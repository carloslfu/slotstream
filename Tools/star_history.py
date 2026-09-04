#!/usr/bin/env python3
"""Render repository-owned light and dark GitHub star-history charts.

The script uses GitHub's GraphQL API because the stargazer timeline is no
longer available anonymously. It has no third-party dependencies and writes
plain SVGs suitable for a README <picture> element.

    GITHUB_TOKEN=... Tools/star_history.py \
      --repo carloslfu/slotstream \
      --out-light docs/assets/star-history.svg \
      --out-dark docs/assets/star-history-dark.svg
"""

import argparse
import calendar
import json
import math
import os
import sys
import urllib.error
import urllib.request
from collections import Counter
from datetime import date, datetime, timedelta, timezone
from html import escape
from pathlib import Path


API = "https://api.github.com/graphql"
QUERY = """
query($owner: String!, $name: String!, $cursor: String) {
  repository(owner: $owner, name: $name) {
    createdAt
    stargazerCount
    stargazers(first: 100, after: $cursor) {
      edges { starredAt }
      pageInfo { hasNextPage endCursor }
    }
  }
}
"""

THEMES = {
    "light": {
        "background": "#ffffff",
        "border": "#d0d7de",
        "grid": "#d8dee4",
        "text": "#1f2328",
        "muted": "#656d76",
        "line": "#0969da",
        "fill": "#54aeff",
    },
    "dark": {
        "background": "#0d1117",
        "border": "#30363d",
        "grid": "#21262d",
        "text": "#f0f6fc",
        "muted": "#8b949e",
        "line": "#58a6ff",
        "fill": "#1f6feb",
    },
}


def github_graphql(token, variables):
    body = json.dumps({"query": QUERY, "variables": variables}).encode("utf-8")
    request = urllib.request.Request(
        API,
        data=body,
        headers={
            "Accept": "application/vnd.github+json",
            "Authorization": "Bearer " + token,
            "Content-Type": "application/json",
            "User-Agent": "slotstream-star-history",
            "X-GitHub-Api-Version": "2022-11-28",
        },
        method="POST",
    )
    try:
        with urllib.request.urlopen(request, timeout=30) as response:
            payload = json.load(response)
    except urllib.error.HTTPError as error:
        detail = error.read().decode("utf-8", errors="replace")
        raise RuntimeError("GitHub API returned HTTP %d: %s" % (error.code, detail))
    if payload.get("errors"):
        messages = "; ".join(item.get("message", "GraphQL error") for item in payload["errors"])
        raise RuntimeError(messages)
    return payload["data"]["repository"]


def fetch_history(repo, token):
    try:
        owner, name = repo.split("/", 1)
    except ValueError as error:
        raise ValueError("--repo must be OWNER/NAME") from error
    if not owner or not name or "/" in name:
        raise ValueError("--repo must be OWNER/NAME")

    cursor = None
    created_at = None
    expected = None
    timestamps = []
    while True:
        repository = github_graphql(
            token, {"owner": owner, "name": name, "cursor": cursor}
        )
        if repository is None:
            raise RuntimeError("repository %s was not found or is not readable" % repo)
        created_at = created_at or repository["createdAt"]
        expected = repository["stargazerCount"]
        connection = repository["stargazers"]
        timestamps.extend(edge["starredAt"] for edge in connection["edges"])
        page = connection["pageInfo"]
        if not page["hasNextPage"]:
            break
        cursor = page["endCursor"]

    if len(timestamps) != expected:
        raise RuntimeError(
            "stargazer count changed while reading it: expected %d, fetched %d; retry"
            % (expected, len(timestamps))
        )
    timestamps.sort()
    return created_at, timestamps


def parse_day(timestamp):
    return datetime.fromisoformat(timestamp.replace("Z", "+00:00")).date()


def day_range(first, last):
    return [first + timedelta(days=offset) for offset in range((last - first).days + 1)]


def nice_step(value):
    if value <= 1:
        return 1
    power = 10 ** math.floor(math.log10(value))
    fraction = value / power
    choices = (1, 2, 2.5, 5, 10)
    nearest = min(choices, key=lambda candidate: abs(candidate - fraction))
    return max(1, int(nearest * power))


def selected_indices(length, wanted=6):
    if length <= wanted:
        return list(range(length))
    return sorted({round(index * (length - 1) / (wanted - 1)) for index in range(wanted)})


def date_label(day, span_days):
    if span_days >= 730:
        return str(day.year)
    if span_days >= 180:
        return "%s %d" % (calendar.month_abbr[day.month], day.year)
    return "%s %d" % (calendar.month_abbr[day.month], day.day)


def range_label(first, last):
    if first == last:
        return "%s %d, %d" % (calendar.month_abbr[first.month], first.day, first.year)
    if first.year == last.year:
        return "%s %d–%s %d, %d" % (
            calendar.month_abbr[first.month],
            first.day,
            calendar.month_abbr[last.month],
            last.day,
            last.year,
        )
    return "%s %d, %d–%s %d, %d" % (
        calendar.month_abbr[first.month],
        first.day,
        first.year,
        calendar.month_abbr[last.month],
        last.day,
        last.year,
    )


def chart_series(created_at, timestamps, as_of):
    created = parse_day(created_at)
    star_days = [parse_day(timestamp) for timestamp in timestamps]
    first = min([created] + star_days) if star_days else created
    last_star = max(star_days) if star_days else first
    if as_of < last_star:
        raise ValueError("--as-of cannot be earlier than the latest star")
    last = max(first, as_of)
    days = day_range(first, last)
    per_day = Counter(star_days)
    total = 0
    totals = []
    for day in days:
        total += per_day[day]
        totals.append(total)
    return days, totals


def render(repo, days, totals, theme_name):
    colors = THEMES[theme_name]
    width, height = 960, 500
    left, right, top, bottom = 78, 38, 122, 68
    plot_width = width - left - right
    plot_height = height - top - bottom
    stars = totals[-1] if totals else 0
    step = nice_step(max(1, stars) / 5)
    y_max = max(step, math.ceil(max(1, stars) / step) * step)

    def x_at(index):
        if len(days) == 1:
            return left + plot_width / 2
        return left + index * plot_width / (len(days) - 1)

    def y_at(value):
        return top + plot_height * (1 - value / y_max)

    points = [(x_at(index), y_at(value)) for index, value in enumerate(totals)]
    if len(points) == 1:
        points = [(left, points[0][1]), (left + plot_width, points[0][1])]
    line_path = "M " + " L ".join("%.2f %.2f" % point for point in points)
    area_path = "%s L %.2f %.2f L %.2f %.2f Z" % (
        line_path,
        points[-1][0],
        top + plot_height,
        points[0][0],
        top + plot_height,
    )

    title = "%s GitHub star history" % repo
    subtitle = "%s · %s" % (repo, range_label(days[0], days[-1]))
    star_word = "star" if stars == 1 else "stars"
    span_days = (days[-1] - days[0]).days

    lines = [
        '<svg xmlns="http://www.w3.org/2000/svg" width="%d" height="%d" viewBox="0 0 %d %d" role="img" aria-labelledby="title desc">'
        % (width, height, width, height),
        "  <title id=\"title\">%s</title>" % escape(title),
        "  <desc id=\"desc\">%d GitHub %s from %s.</desc>"
        % (stars, star_word, escape(range_label(days[0], days[-1]))),
        "  <defs>",
        '    <linearGradient id="area" x1="0" y1="0" x2="0" y2="1">',
        '      <stop offset="0" stop-color="%s" stop-opacity="0.30"/>' % colors["fill"],
        '      <stop offset="1" stop-color="%s" stop-opacity="0.03"/>' % colors["fill"],
        "    </linearGradient>",
        "  </defs>",
        '  <rect x="0.5" y="0.5" width="959" height="499" rx="12" fill="%s" stroke="%s"/>'
        % (colors["background"], colors["border"]),
        '  <g font-family="-apple-system, BlinkMacSystemFont, Segoe UI, sans-serif">',
        '    <text x="42" y="49" fill="%s" font-size="22" font-weight="600">GitHub stars over time</text>'
        % colors["text"],
        '    <text x="42" y="78" fill="%s" font-size="14">%s</text>'
        % (colors["muted"], escape(subtitle)),
        '    <text x="918" y="50" text-anchor="end" fill="%s" font-size="30" font-weight="600">%s</text>'
        % (colors["text"], format(stars, ",")),
        '    <text x="918" y="77" text-anchor="end" fill="%s" font-size="14">%s</text>'
        % (colors["muted"], star_word),
    ]

    value = 0
    while value <= y_max:
        y = y_at(value)
        lines.extend(
            [
                '    <line x1="%d" y1="%.2f" x2="%d" y2="%.2f" stroke="%s" stroke-width="1"/>'
                % (left, y, width - right, y, colors["grid"]),
                '    <text x="%d" y="%.2f" text-anchor="end" dominant-baseline="middle" fill="%s" font-size="12">%s</text>'
                % (left - 13, y, colors["muted"], format(value, ",")),
            ]
        )
        value += step

    for index in selected_indices(len(days)):
        lines.append(
            '    <text x="%.2f" y="%d" text-anchor="middle" fill="%s" font-size="12">%s</text>'
            % (x_at(index), height - 31, colors["muted"], escape(date_label(days[index], span_days)))
        )

    lines.extend(
        [
            '    <path d="%s" fill="url(#area)"/>' % area_path,
            '    <path d="%s" fill="none" stroke="%s" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>'
            % (line_path, colors["line"]),
            '    <circle cx="%.2f" cy="%.2f" r="5" fill="%s" stroke="%s" stroke-width="3"/>'
            % (points[-1][0], points[-1][1], colors["background"], colors["line"]),
            "  </g>",
            "</svg>",
            "",
        ]
    )
    return "\n".join(lines)


def write_svg(path, content):
    destination = Path(path)
    destination.parent.mkdir(parents=True, exist_ok=True)
    destination.write_text(content, encoding="utf-8")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo", default=os.environ.get("GITHUB_REPOSITORY"))
    parser.add_argument("--out-light", required=True)
    parser.add_argument("--out-dark", required=True)
    parser.add_argument(
        "--as-of",
        type=date.fromisoformat,
        default=datetime.now(timezone.utc).date(),
        help="chart end date in YYYY-MM-DD form (defaults to today in UTC)",
    )
    args = parser.parse_args()
    if not args.repo:
        parser.error("--repo is required outside GitHub Actions")
    token = os.environ.get("GITHUB_TOKEN") or os.environ.get("GH_TOKEN")
    if not token:
        parser.error("GITHUB_TOKEN or GH_TOKEN is required")

    try:
        created_at, timestamps = fetch_history(args.repo, token)
        days, totals = chart_series(created_at, timestamps, args.as_of)
        write_svg(args.out_light, render(args.repo, days, totals, "light"))
        write_svg(args.out_dark, render(args.repo, days, totals, "dark"))
    except (RuntimeError, ValueError) as error:
        print("star history: %s" % error, file=sys.stderr)
        return 1
    print(
        "star history: wrote %s and %s (%d stars through %s)"
        % (args.out_light, args.out_dark, len(timestamps), args.as_of.isoformat())
    )
    return 0


if __name__ == "__main__":
    sys.exit(main())
