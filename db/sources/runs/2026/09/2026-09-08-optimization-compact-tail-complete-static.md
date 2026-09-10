---
type: run
id: 01m1znt8efgzy3q903ty89jp0y
created: 2026-09-08T04:53:25.071290+00:00
updated: 2026-09-08T04:53:25.356050+00:00
summary: New combined binary passes the complete static acceptance suite
binary: V349 7fb2cc0c6cccf93e8a589d02ce5aa839eea38140a1cb8f44cefeb10ec3f472f6
captured_at: 2026-09-08
command: python3 /tmp/slotstream-optimization-execution/compact-tail-static-v356/run.py 2026-09-08T05:01:00Z
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: New combined binary passes the complete static acceptance suite
tool: Slotstream local qualification and exact artifact capture
---
The entire unchanged weights-free static acceptance suite passes on exact V349 in294.05241725seconds. It includes shell/Python syntax, binary-selection and API fixtures, benchmark/cleanup/identity/readiness/campaign/soak/reporting unit suites, projections and public-claim checks, pinned parity data, runtime and pull checks, original small C/Swift transport fixtures, planner and installer checks. The terminal output is STATIC GATES PASS. The selected candidate and every frozen driver remain unchanged. This is static and compatibility acceptance; it does not qualify the still-interrupted native model suite, throughput, live resource capacity or activation.

The explicitly granted static-only interval uses the original seven-GB startup, three-GB live-headroom, three-GB owned-RSS and600-second limits. Maximum owned RSS is1,239,728,128bytes and minimum observed reclaimable memory15,609,233,408bytes; no new swap-outs occur. No Engine/model, GPU tier or Slotstream rebuild runs. A separate04:52:20UTC check verifies group68128empty, a free model lock and no competing jobs, then the interval is returned early. All user apps stay open and no further grant is held. Exact wrapper, protocol, full stdout/stderr, guard samples and independent cleanup evidence follow.

## Exact artifact inventory

```json
[
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-static-v356/manifest.json",
    "bytes": 4321,
    "sha256": "39e72fc75a733b6be54aae61118173c8d1e60c0a50796a80f4e0533732a0a9af"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-static-v356/memory.json",
    "bytes": 270167,
    "sha256": "2f22116aae693e4f60a0d6334f422196a435c8084b94ecf2af088db59965b4c0"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-static-v356/memory.samples.jsonl",
    "bytes": 205787,
    "sha256": "fdf68cc8c48f3f631fcfffe818220110d26e02925a94d3607bc0265936d5548e"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-static-v356/preparation.json",
    "bytes": 350,
    "sha256": "046ef73eae829363fbb2ddfeb629e79960e5a5e1e711bdcdddaf5ed298af5980"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-static-v356/protocol.json",
    "bytes": 34874,
    "sha256": "1b43b45bcc3b853089f868bd650f313f78c9bf3a3f03a9701b4dca2cd3298df5"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-static-v356/run.py",
    "bytes": 3692,
    "sha256": "96cede0fc0fe1af02559936cb20d44c6e424e7bc73cdffe32164837882e214b1"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-static-v356/stderr.txt",
    "bytes": 2997,
    "sha256": "10303dde2b968a101af1effef9c76bf277192b3ae294d970d950975de7aefae5"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-static-v356/stdout.txt",
    "bytes": 15897,
    "sha256": "da4a62a79c742e203875555e40e493a40f72a637be03f53e6f7dd8b4016788f7"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/handback-20260908-v356.json",
    "bytes": 2690,
    "sha256": "c3e105ac885288fec50c1d58ee45926e78fcc80fd7f4a2500cd5da28f4af49f5"
  }
]
```

## Artifact SHA-256 39e72fc75a733b6be54aae61118173c8d1e60c0a50796a80f4e0533732a0a9af

Encoding: `utf-8`. Original bytes: 4321.

````````````text
{
  "passed": true,
  "protocol_sha256": "1b43b45bcc3b853089f868bd650f313f78c9bf3a3f03a9701b4dca2cd3298df5",
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 17417584640,
    "swapins": 44130071,
    "swapouts": 77538158,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    40668.\nPages active:                                 985809.\nPages inactive:                               981659.\nPages speculative:                              3208.\nPages throttled:                                   0.\nPages wired down:                             240253.\nPages purgeable:                                4269.\n\"Translation faults\":                    16904812224.\nPages copy-on-write:                       876869965.\nPages zero filled:                       22679325647.\nPages reactivated:                        3738013057.\nPages purged:                               79214971.\nFile-backed pages:                           1018148.\nAnonymous pages:                              952528.\nPages stored in compressor:                  1785349.\nPages occupied by compressor:                 833941.\nDecompressions:                           1279974229.\nCompressions:                             1603861706.\nPageins:                                  8070573471.\nPageouts:                                   11393457.\nSwapins:                                    44130071.\nSwapouts:                                   77538158.\nPages tagged:                                 176866.\nPages tagged resident:                        132417.\nPages tagged compressed:                       44449.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6971.\nPages tag-storage free:                          165.\nPages tag-storage non-tag pageable:            91160.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7261888.\nTagged compressions:                        12460432.\nTagged decompressions:                      11503179.\n"
  },
  "exit_code": 0,
  "elapsed_seconds": 294.05241725,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 17064312832,
    "swapins": 44130071,
    "swapouts": 77538158,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   485947.\nPages active:                                 760198.\nPages inactive:                               775863.\nPages speculative:                              1356.\nPages throttled:                                   0.\nPages wired down:                             240221.\nPages purgeable:                                5394.\n\"Translation faults\":                    16918078136.\nPages copy-on-write:                       878556078.\nPages zero filled:                       22684612714.\nPages reactivated:                        3738015195.\nPages purged:                               79218588.\nFile-backed pages:                            550182.\nAnonymous pages:                              987235.\nPages stored in compressor:                  1764674.\nPages occupied by compressor:                 821718.\nDecompressions:                           1279993626.\nCompressions:                             1603861706.\nPageins:                                  8071086310.\nPageouts:                                   11393819.\nSwapins:                                    44130071.\nSwapouts:                                   77538158.\nPages tagged:                                 177199.\nPages tagged resident:                        135037.\nPages tagged compressed:                       42162.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6970.\nPages tag-storage free:                          386.\nPages tag-storage non-tag pageable:            90940.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6828224.\nTagged compressions:                        12460432.\nTagged decompressions:                      11505232.\n"
  },
  "candidate_unchanged": true,
  "drivers_unchanged": true,
  "remaining_jobs": [],
  "model_lock_free": true
}

````````````

## Artifact SHA-256 2f22116aae693e4f60a0d6334f422196a435c8084b94ecf2af088db59965b4c0

Encoding: `gzip+base64`. Original bytes: 270167.

````````````text
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
````````````

## Artifact SHA-256 fdf68cc8c48f3f631fcfffe818220110d26e02925a94d3607bc0265936d5548e

Encoding: `gzip+base64`. Original bytes: 205787.

````````````text
H4sIAAAAAAAC/829245tuXId+N5fYejZmCDjxqB/xpDl82BALQk6MoyG0f/uMWauLEiNIrOTM6bsrEI91N65ciTJuEeM+J9/85e//9t/+utf/ut//utf/u4f/+G//vVv/tN/aFdrIirm2b6+pPl//A9/84//4x/w9/75r3/9z//l//mXv/BviphFyz/+7J/++R//7i/487/7x//+D//CP8ef/PNf/u7v//a//d9/+1/+/i9/fF8f1qP7xA/B3/jr//jbf/pv/8D/b9a1tdE///Mf//u/8P+O4Zrd8//9v/7nn6IV7aq9pf45xubRp7QlSFuDbNZ6RmYBSIsuqjoWBxlhTdOOQKqNbD0KQMbs4iKzz6+vP8c6vOXQOMCqc4zggyrAOqVL9lwdaBv4XeYZyDndzZ8faL+699AWsgLZMsbhrduA9BScZL90Qn5mS9ne+jlWPHqb1s0KsIbEaL3HWIDsTXvkAUjX6d00sgBkhvrQZh8xynKsFHiL8Vx5ytWbAyFUfTlIh15S1ygAeX/SWIr6A4ywHU1KDpLG8l/pm/+PCZr2ZUZ+LzsdPxVKswBh9mb4rMUpeuDN2pl8dyhbLcCoV9NwDyjMj+OxunH1eWaBErqjwTQUYJUBAYda1C+sVo/VoUjSKs7VO2S8rSXoHCOFaBSoTb3wSTTpUg7S8X3KmyoASWWpOdf68hxkTvMxn79Mg0cMXQSDNjYGnR5zMztSSilQyEOyACosD74WD7PDzk07CjDgTAv0nVYcZyQjFWnlNlLHQPyEKKoAJJx2hDljBTLG6F8+7YH7pmNW+MN+dZt9tPVJ0ksMO3uSA7fQrAAkflsZkPBVPIm7Hu0MZENQ7SUgEdNayjr8OQc5EPHOJhUgYXN0roNeBNcIJc80UFeJtOcaKK4GyYhcx2hPQAKPFNjvuPRLmdVjHFMRThVkD+JySx8wDdswMgQi3tqh64awXCrufIx0eBsRX1C9PNGRCvmMAiEaFwNv041b9L9f0sclhstRt4XDDgn7xKt/DtJ3IA0PPypAWjZ4RNZXyQNJuIlyZn0S31vwNMc1BK66vaGMTLy7FECccKiHb16kMzV1po2sza9k7TOQeQHGMGEecKON0pj4Oblyl2hR4nDkBelO6euYAr+KjSOQkJ4aJzgvBOVhY6yd4FM1hHh/jjl6BcjZApq9f9ug1XkirvDDQBJxlRS4HROuMEP7ttKYsE9D+5kyariMLhUgGem1UX2MdNbpvlYgDGnaYp2/PAcJxdHpzhSAZCLHGPr8OcjuY3xF0wcBJGxuSWq9XfAzRGPMxYtU/ONnL3IEU/YFqWCgRKjN5MYqpoCj8fEW/vfFFEDpiOsHfYJVoKst7Sz3LzZmFqSsgXIM+NO+Ospstk2+bFMGATelwO70Dv831qp8MgF5qCUDEUCB/QZE0dFm0+Vti7evWOAApbcRFW+yX/DAjbnvUY9SFJaxINAFytFac5eVFnqAcgwEOz5LHuVEHKpz7L3LB68TUc9kTPUcq1xwLtNzfaIPkm5V+SygtC5zmPn+RI9dYZwo/qkI0YA1TAb+WZ1ox8OYdniiNuAYtQqUMBKJqMJekKTZoZgqvA69oILxiDYO3AOUkWkVulMv1RlNll7HEAufh/kNPEofUYHSR84uq8C8z8ZLWwfmunWG4cwUlHiBMjtej276tfqnoPjbGxeHK/2J5x+itAvPskX3766YhYuUkXHkIuHBdDz8grwWsOL9tRxLy+4KzzbbwevEt0ZXr+iKscspy7ZMtHf4ebmR9B3KEVN7lpzlQPzQfSXpHbr549j+/nUmnIZRc5YzYbX7OgqCiM0RB2dp8GssZ4Wd9AseUOBmxjYdQxPl0Y6wzqxJYAOrmSLCXSaHO1s0VY5Qjj/07mOUMUJTl1mjjrtTP7JDAk3XswYlezPl0xbTWl+9UcfhHMl78FllQf6oxwWL4bo80c4HdubD3zmuUVG5AErNgBe0jDCZBrKjblemsb2kxxkoQ+R2DlcyxCakLkc37gnvoyKhEBctNlTc3HVnwoWX0LNGHra0jFHhHY8L4TovdmkzVfvc+Eq+7Xe10StycuNSKMeQpUfXe2SXI5QW7MaIkrN0h4LzFzS8JgchtKC2BpRjUtZXN/5AHykefUqviDTyajLm8IjlWUJmjzxOHVCb8LFaBUphE3Jbxuksj2WPI5T9DvFLUFoSpr9g0xNmzSv69IByAIjoWhMdy3ih9OQ1vUebSzvZTT/t3gdx+mT2qUB65gU1pG3ZLdEp4v2s72QguHaviITmBWUIGf6uoOdK0lvLGWevc/B9lpxoQLdbX3oeNhMhxpk+mozxK+ot84Ly7nhCa2t+LOljOstsBWMC7cI3Rdpat59Leu+t4ShLUGrQxV5b82OUCNYm045RgdKnh62N+bGgMxdp0QqSmwCZiB9GLPtPzo05q+/QHgUpD+lXi+BIla8cdgTvO2O+OUtYoOkV5SuglDmbjmr55kFqywLrA4iuYpsm7O7R9SguV4dKhyaSCpTsV0994VHCvYbeKDpLPO7Z1hEv0ypnES9RmpQIuFyC940H3uu99aS/NQoqgEBpwyHFmxtHPB5H+aIOqesVbYVAGbzyP1qHV8oozOxIGQl8Ltiumnufyk6TVNlnOuA7HXXuCUeISiJKUfjEamMs8+5w4MZZMwpQsgGpoCoElCYcQF7FF51p+SZnZ8kxhIpRIKAMBH2R9Uepc/QMr3Az9eK4m8yV6gTK2fo4G+CH+NSoTru6RI+5LE/3GJ+05K+VEs15SdgLlJyaHcsuyAdnKTchxFdq+THKaKx0r1qIoYiGW56JeIeqKxmItyut0f/pOwUv8JL62cwfHia+OQuGUcXhE6d2yaU6YqPGUbtMx+NUinoFSm2OwHc1UPcE5WDTecU0N1A6yV6svYFywgOp6CQGygEzGbI36do43nQUV+LeZ3wKHw+xxtXuxrIlWcedjz+yQzBCMJcVhV+gFAtI0Rv3zmauknYUoLQMBpZeD9JkSkbJUSKKCJnLWirz+uJnzzJbl4r6H1AiFoJuW873un1no38v6KPBLFQIz7j6bHfGeRlhzE9fzu/PUr1FxVAQUJIxJ3PZcPYAZKNV9xKQwUFOX9ufBygRW0hFiyFQwowNtkjVg/Q28a0FTnteHUZy2igHqTYRlJT4G3lx/CDeAOmsiEhBrwRARkeoHy9g5PxlxXwIMJJDY10xf4IyjOXjihzcvBpL0bmaW3okOWPC16qQnHkpvLLlrM0jkIhOa7zLeUEGLUe8oYTKDPhkA3FDlN9/SME9uPaGIy1Ia2m7mgXArnzgJyjxjXc1rQKlDOhL+aYAzHrt7lZTYQFWR3Qz3rDmnGEKjp9XoGQbsbVlRoZzCWd8n/2uKM6a1zlzqugZlZVvIHaHz1EB8Z6tC34tgsicfYyj7mE42PReCyIfvWfrevRlXy7TnD1PahdQnF1KauZAiWejsEHLmOI4e42zjLvHogLlzeya645cg646NZWTDTIFAi7sG7bQ9cznDyQYu3fpbL7wEpTW2Eq4mUMOjX4m4/DhsoJlACgJgg3MX18LEk1p/slTHJwoYumK+h+wMvW0TnCcC1C/5zkKBEivNtm4tRwDS8tPZP17lAE4VuBrAqVa731smBT3hCL+73OWzNRn24xWyYzDR6maPrPkLBM+ptm6Adun9aM2BKYH40Ns+xAlR+oaO2eX73L05nLmC8MliopCtHKYruMXXnrsT6QHV9QrGD6B0nFWKnrK/7d9l0aeqFaBcgRHPZfmJ2jlj0b+FNetWRGaAyW8M1Jgn42j7jCOW+wKMPoltH++rvThM/WQaqAp+URKUCKqCVuuYnggO0q+2RLKc6CE068t14PxD2QnspcwPgIlVJD0NWWz3QsAjkCa+Yef4CHIuGBoBX9n6V/iZc1TNQRFLBWGJy5lPSHX/fZMRh6VS6XRz6+Y3gfKu71VlvxLP3H/7VpN1GRqDcqEWoPiXt44aTrP5gGCcxsVPew6roYAasp6T8QPhPy7TnuH3JWYx3EhzJVY8ihSAvQwtWHNR8XgD0CSOh7B3tIf8q5n63X6ZJKsgiUKKIenh69JJX4gjtmdJdVDidc22C7saeux/dSZhyiFHb4F+2A0L/Y4+oYR+Qfysu1Zsg+3IuWWl+G+dd37dI9YnbW1No6CVoxEA2XA7OhcFqfOUXYmNERbyVnio5ouU24/sihuPSKbWeJszKt7kCpoFYuTMzPyTF+SsbmiRK7kzIxlYZdb1fJsXA6XgEsqcTXmRVIXm8vB2EHK5SOSbtgKBEsVG76Akps22rLZmnTGYZv7zl1HHn77it5bI21ma7leW+KTNYYT0iX2wIxWIeFG2swGt2ylhziG6bEJJ3LXizc5VluC0s27LYcAoEjlQzd3cONJHVdy4/gLocsbNz6s3Y1vUbaIiiVkRt5Mmp6ljCPSSGlHVnw4o76CNjdjeW/25t/9rFH/Oquan4xFvuQwzaJ8ptDtupvmzF3TjnJ3i1WgHAgUudFvoTU5Aa9nKMOsZtwHKBnc5HKRH2585m5NRG4pkYdV9IQbi3xwWHWV/XeBIjizQNBFdjM9VqDUZCVy9S4NIabtNjfmzi9Kk5IlSkJyIJvLDCYkgBF5O0M5pWSSBiiTPX628jFxGN8Z/N+jnCQsq5AeJVV3ypLmwuAzbSe8dig5pl+xVxQo9Z7QX/tvMHXzSBORmTF7BQEYUDrVel81RSD2t76jJdxpoobP7jU3Ppg7n6ssjOLZ+m4eKbeDxuJREJObXcyGyozP/oWVNf8j/XwgQ9w9UuEf2QWQNvpS0mGfWj9EaRYlVMNAaffGmpWnyS5nlyMJ6jaj1dz66H5TGyzknN2au9Vz8e+DEred9IwWEsSVhrv0em67Irg9tUDO/eoj4ZbH0i861pls26cJbhUoDbpGbZUvurc9n8mO3ASxVjAdCZQciI22seW6JR7NbU64pskeKHPA142VldR7fP8QpbCPoWA6xeLqLVyX69Yf6HT4GsK6VqtAiTcZ694NZ3vJbgBt63E0tRJPOC4f98bQtYxn27UO7lBKc63oOADKbL1bW/VZQ6vDadj4mGMb+4SWSM+4cJDwCVYFFQSDuuu7lW0pH4FkhVIfl4RwH+3SxUyyOZ0KTy/paAVKOm19LeLBBXmnwe5gS3gJygEHU9uqhYyts4cUAly2XbHl1rggb0j6ss8NP6kdLrHgdGlFdt2SA6ZwJtYg52f1+O9nu5q6l7i/eUEZunRZl8+OUTKhaBXd/0AZIxDaL2pnQf/3iALK+W+reJJ5zc4AcdlNpLTuZ02N/keg9BAkd+LpnHrmn49dKxG+tYIPxljdy7HaF/sTKci2ZRnKpyTxP+/V0BKrVggje/quvW1sRw1pqFoFyoS5acv5dhKL5S5p2ddRY1f6LVpgFJ3VPXO39XoaiH4cVVHUotd0bAAlpcNkocvZJrxNAI8NyH4zVJaAxDnCU1m3XbIwfsbR6lwzEFaCcozRxsK/MG7G6EfBmOIG2OBesFadpT1IRyxlp82Zu0b62JykZX6ck8coBdYLDtWHKS/KBYjU8CXJQGdpjyOwyya3eS8CP9qcFF1GSZOb3/N7fSwJdeDL3ayRJ3Lu5GmtGOxxlvbwgbpE2UmJs5HzsWuoRxhVkQ50uXrAwMRyn/GAEO2KubuzZINfr3iXLO0pdzwsm0uGzt220y3KaFaxww0ogxu9lpEjZHzKPNuOBonsnznKxyjJaW3rdluYJwk/unFOxbHr6TlKvfBJ3Ne1LO2xme7sxu/W0xJ9ydKeKizlykwa02xHZhJOUZQsT3FW9pgOXCuiOT9kxb83k/jtqo4Sv+1sfSU6o30a93/fqE7CjQraUzc4HNZts+CFe8zzbFOwwCBU5KiBEg6H3xuSVxFk21bLdsqSgU8Fx4qzosclhd9cG7Fw4RBXj36ENQQhSxQMzgDrwPe4rthg7jbxk95lF2+kSC659Ql/t68ndNN96NFJOpsXZknw43A3BKptftbbRrW0O6+9hCYCWKnZNFfSrk3M8tDpwOdOqbh3v3CgCGp12zmobC/cpWTGluxrlCQ7gDUDFsOXoS+Xwcx2ZtRJrRMV4UVcjR+0nN4UsiDb0erLOmYdoFSJu6Cw0PIt5HgADR6BVkxNASXuu8/15DOO+bNM6PcorSHQq/CQWOMjHfGqxvfAYjrZQbSiCOCs8d2Z8PIBbZwiQouSvBFrfGGbBi2hrtoYy52ziZjXS0ScNT7m9JbpTNya9DO3wz2zhCjcWeNj63q9SxyIRGcFIS8wTkSmUOir2U1qy3mmK2/28QrJYY0PEh627nk69ojJEVFC8eUs8uGz1kmONr77uQ9YRe+xrlaBMpwEeUsBJ3frbuXyTnSC+5orkq555WDZZE0UbTbOOLe5naNFRZ+Ozwv+uuhYJ4zORZzT+FKxvhooIYeRy41Tj6SH82cVEzR+c3ZyZ/dyBZH1drjWFJ5llvAoASU5WntbplsNCn9XstidJZ/LKOBRinY1Ejr01bPkePk8Gj9TLl+VipFigASOiA1PxAPhiZsoo1WgZLt6H8vOjQeKyEkN7gXCA5Sj40Y1fwgiPcc4U+3subUZJScKnTE2O8Bn+Idi9fco4ROVDHZFv1h/3+yCJk/RWV3FaTOiQmkCpSH4Il3/Lh1jJHDa9eXtsOIYPqNhj7HG176+pa0k/8xJ2ZyTkd0r2BgAMiO5nHHJjAgjNY5YQly4pLkiKg8hM2KKxLJRgjtFTjNbXBxaEJUDpcrNdLCy6EE65SFHTQgtukQrOUu4Pq7DthnNB4yYUPO9l7QRAusYCPTX7GmRvi32yi5LyBb7AiL70Ivz6c2WPhIM8zjjt1CuQf8sonyMUsw4kLCsspwby4mnUjIvB5SIVizaeimA9MNcJk6x+6cT8TFKGCDWq1asDLD1W0aTnT7q0Js+S258Knsev2sXizEVJk/j1IHXrNisHnb1gO+bS9V5biyZwqbtsAqU3FDost6ThN9it491u6EEJ1liLI0FluSCtbu7rte7xlxvVDGnD6j0PmLJFKOIv+YpM4PjR1fM/YTD+0gu0FRdH6goVELYkRzpmK2kuAaoCIg4DLHkzzNy/Jy9UOdO8Ipw3S92YdiIetcYKGWWLJQESlyLWn9PjmZyDKIAKjf2JdMwuxeqX3u+8yw5F+SqsAqo4vAr13d/U4WNI5G/d/xWVAmCa/s4jgjPcyPyTP3G4RCL8pesOVDOFt38lhuoTyRK7wJryamSSNs42Lt5ptPah6bz1wU3Y+/DqLBM46LDuM7HP5J7u13YVoHSOhvKl3ExvjXVDyNOIQWiVaBkr4P/4JC00Q43Wih3YWiJ3I+L2YC+GsiYcKRlN4LT56ZmLfDGS8LiZMNHX/ciHeeVZFCJVhjP5No02GJ9yXhyWd4cFbV1QPV7UcKy5WPaN83KyYG27gWzI0A5uM5iLu0m/kRkHBa1YOkqxhVjfjkiew1vX5H4mVcfMrxEw88LHvf4QSs9spvDNCsK7YAKw9bnMpPMebxsRxYTPn0zrwHJhn949ZwRWUu8yZYGZfw7FDUBdRpvZu+H4O63nM67Hiq871Hh2Y92kVoSHvGq08untrPGHzgO5MgrOFCgNITI7CpuG1nC1ffTu0fcWbK+CFCD63aW9c1nnjJAVowrAyXUEs6ztd2Bcv9HO0w3CamPCpq+Rr86DH3QB31H7jkoNSuoUQBVOSmo21MlIXvfjbnpbugWd1YxXQKoDtdhsqd38wDmtDnP1rIY3G2v2HgOqFz5HZtVqXd97TBM/uLNeI5SLoQXk3MPCy9viDY5HAgfOt0LMmNAKbAbY8y9ZUK8M097bua9P7MCKtw8uDhLh5TDG13O0k333iArQclH1NpeOzEVc+g7k+h8VDDkAOoMHzmX0+FdPU8bFeVeulyAUq/OUnys2QBgp3cUcv8euVugJHmuynK4CFrFhsZZkmmQLb9VoAwYzsky4tZ0+iHth8AyD6noogXUJF8MR9g39gguup7RvLdJxvwSD88uWOEefZ+7na1/+Cl/TfkCoyw4hayAyuZcRdi0gep4yH03rrdJOomw565iUAJYPaWtpzQfCD5C+hm9RN/blWyEzB+i0JBPy8+vRSqdBIAVl+8X7Gdwwn4DlQy/7WxIhk3tGS4lUNnznLLuyoDHcrr/KFiUKqiEAKWzCXg5b/STh7cl5IRb3wu6QQESzx3K7qdyzbEskfO6VXQMAep0rj/fpklIgBW+SUDoRjnhU2dFRXkEvZJ+Lzt7R+zhPdUwggOqiYss51GEXKDtbA4y07l2plWgDEdUb74LlU3/2Hf+2wO1RFivFayNgJoZYctlD6I+t0S8u27gSCtZXjrG1Rt0iLcX/GaWpCIqznLAIVGdy3Qjl2ANmScbN8mHzHUpJWfpZNS0rdv0JErmEnat4KED1ISXiZB+1RvKbdCHyRGmm0qIgEbeyRH4d76Vds7C6FmUPEO4zacCKns8etsnxkbIJ5j4/ak6iWwqEmN53etp16u+H0j8jMiK5e4ACZ92DtnmRB/EoBAjmKWKPmtAxROCRzKXnI7HS4uhSb7mL5+jnBc84REc1d7VQshVeDYKQNYUlYIJFUC1ntpt39g4yAHhZyqfNB5ZESzNK0hd0vb5hwcSdb+AipEaQM3s3HK/tU4P2l0QiY0SduFsV2f0nW+5zcqRlVZBew2oUMxGAtydWDG2Otu8DKj2TWP6GCotqS33BDxoccTH4nO1QE8BZXaY5cW+U01S452k8gLGZNZo/OxMkXDjgpSbUFglZ9zaKlDKGJxK3D7NCTHbFep3UOHutooZZEB1/OLSfmjLgkO622OxIZomtZO3gjQuoCJI5J71lefMoY55eqDslcoSlPNrbNY2SbwflyJuDtQMSq+CVCTlktZ96jY1anq3Ep3dvfUxK6rfgGoKLWk/tD88EH5uhi95pnIF+YNk6eRP990EyxYkewkqLJJcs+Go+ja+e2DnO9MCrSIDkXpx38G9OWI7yhDpZ1QJnWMXFfuEAZXLFzy2jp7p3aJxNAoIqF4y5g2ozlLAmlKVA0hyxEDd/Y7FR8mBJvOsPV/KjXeGEL0idEq7mjd81PaZWnOuPTwhqmVQxlZXqYAqzOH7epThXO412yjpzwFKLvnSfS2cKf7sR3LfjfuFK9KPgMoZdzKd7e6+W4wzakiIPSSqgloXUGdo67YhANZPKPl78wSfpkbu/epciRvbA2XP+Dafu1kJhp/OVRNZAdW475g8KTvz5PcasoOaGF5N71mxlQdQYwhsaV8PB52jJMtsSVzv17yX7yzJnx+g9N7IKFqAMq7OStCaUuzJWVp4jdvM0mJrcG+20R1TaLtmt92BtlEzUw2owVJ1roZunqC0CdNZUasFyinmHkvO2icoR9Z0YCdnFaNxK4S8c+3m6SXL6wDV2Oy0mq8zG2PYWR8J91rqKGhxBEiEdI2eYjlKbSTDajW3zpZOW29vfoASx9l6RbkuE4oT4dx64/ATlAEZqhiwAkr4xw3faNtWLIRjsql/yq6gPOasWI4BqMHdx7HN4kh27Spn5mi073Whj6HmgBs8lqQunjr80LQHSYsrLNG86HDNtUr6YXOY7fRma9ZqQKo77e/KjyePxG5B8u4o5Ss/WYEyoN9iLo06pH07AbZFmXiWFUWFeSWpZm1ZVGAHqeXRABAcj28S+2coZ7ua449lSQicmpKWR9Rn0zIqFCdQQlX4WGU/Ec18bwv5fcyG+54VPTgA6T0nSRMXlQTEMrLLKuxQ3kMwBYlkoBzsnl8M9U9EF7tFPbJ12t0qJAcQSYAA0VjGaiQDn0cHWZbzmP1CcB73oomdO8z1AXG0YPweca6owQIq99TIvqjNbcdz5yLtoMYYWsE/AKjBvVQbSnr3T4rl4EDZZ1nxQvsFh3CueeSAkomro7P0flMsP3eMplydPVeRa3KZc5TwUrtLCcp7rfpcjp5r73IqQlXBGlAiOCXKBYFck90C3d1BzuDC95KDhPZt98bzBS/saD43JaKt6MSwqLA/ejUj4c92UpJ91J5ndsjIiTAqvA5lRUNhL7Z9az/Rau+gSrBXo1VAJaP0zB+awVItDk+VxNwVHeqACj8uRizJGFv4doPlDiUU56xgtwTKCVdBfVXJJBdUnKW5eOWfx/0QpDEjJzNXIUZvPb/TQL+emlHlJGaUwLQ2BkliNyIPR6mT2DSPsHKWpWKHMrAGZMT66kBH0Ck7GkOCL0gTUnKgnEQZcyVC+EH2veLx9zAnXMWKBSnTr5YZpIbbKSXYaPZ1nEiSDmleQWgKqNoRq7aVEzIySKV3lJ7xT9N7BUqSEzXdjxw3hkeH6S7uztCau4c1uvfb7e4+mnwc8l9DpdpzqXDm42rkXtPtDBp7+e67/D3W4GYbtYrdm8AqAfWTy8EpmPcuciJOeP3sMbSC8jVgMjqAW78Kiuk1jTg6SzaRVEwbA+Qg4d5cVt1sjP7h/vs1TGi1mh00gDnvLe77XloGti02nVVrrAOnGbOCoGuOCw4HLfmWBsWatzxyngI/3/HpvQQrF0Phw1Y8KHih7TOq8VuYZCqaJY2fgAk197WpYHf97j53pMvb6//j6TzGClsPgdoT3vnNGHDinCBqGNo0CqpGM697e0jsxcqhIrRLO8JKJpyS/F1eN4+WrfI40WeLfqRPb0qM6TUofaSrrvqA4PrCfz6yoDCgkTWBXV55t64sxR7PYap2OXuecNAqVkLPeTUdk67D6srx3ZlnAk+ZL3mYE+6IN8jQLrEMN3D23uyotNnJj17QngqoHI+WsSx0uTdxO9o4129GUq2w9pPZEXjw27HOPm73Kk+OtM3Wv7uFH2Od5FSx5bbgBrP02YTza5j4FbnX6/mR9tbolfxIG3r31tnRAGozLnfNgkCUYA2BxpR9jMctCbMf7UuDXkm8gIJiDcHSOUlbDk9Bm8LDsiOhwoF6yUIA4iRlSfth0KcbyYeOXoBwK7ZVNFz11uGZxCb1KBoyWzs6VCFxkVQkI4hTNcXG1tlnX6NuA5PNCyB9cgk/BsE6A9x977ewE6Dtcs87sMrlbCU6oF9jztQ9eZPzU+IsJcVt0iVMoojkL1IByVzS4nwm045UFa4iRwXREHHSk29t2drU5tjz3+1UKulJo9XghD4N4NjyOrSeyonNE7AuchcCS8CygYaLHhcaFXFgnFFH49bJyRs1b3RaRCzb6rvDHo48osdhCqmX8HT2pldnm6ouj3PeLMVHMIWj9hXr6QgTlo49rMsdvp77rpfNtd97xWbW4AydrnPPgaeZ08/CE6Yxe0kXBMFC07FHx1ddwU0/7VW/h4mbLyE9xTFxRS5c+uVuQp2s+cwTsvDGRQGjYnMmceo9tr96o1yNBMWlR+fJ1aGzZ815OoJOW7I39cFBxDOZb/Bmp1UMeRHnSO8bGm7K0Tg18yQPjhIV6hcXdy+WkApdqm3H087Gw9XNITUg8Vl0R7YsQ1BcpCU5U0wxazjbCNYGGQX3DTvUsk2OLGhjO8iHf+M5WI6U3BXS1SZnLs4+oovv99sZJeGIwyMRfOOSuwehqni0s8ooN0SU3H1wLQw+at84ip+45RbcYcXLKiG+JFZ4JdN8tXGFGn/PhbXT+DlNR9GZBtsS9wuMEElCi+12lu0c/OmSo9WAhcpzOOIrt4R73E7dkntRxtSKnAlpT3G3+yoZBD9sHL4A5jE/7dHPwSrkBee2DfHYpR5nhHhdvlh1swSsBzeFLA0/jFjvu36TXTbKSV/Xaw4VGOGY7VN8cLW+N+f8+lBzSs6ayCQvDhnlnkdaIFd9nrHg3iU99SKw4pNs9HtvpUvv7ax8ArA1o+kEawjlva3m/GHMoMvyCCe5a2bUKFbyoSKcX7H1BhuxztL7iGksamoRZELVbq0v+0uhZGzXDrk7zMkFiyU5M3Khwp2SZSGqs2dg5/XtztPI5FRSiCIRqkGZ7jPmzUlifVY1M787lmoONaBB7k2gm0okR2+3rVzblNT8plh6Djb5mH5YdwCdO0OPFpnJvaS5olcfWhLOiiDmXTtViNrnaZgK4x9aoaOAk3S11PxbK9UV8fZZIkXuKb8KXQWw0EXKetG2bmqBoz/LmyNgZxtKzQvg+jUc3EqxhnLPxJkBoD/2qQ08xdkv5g7XxKgdEco+Tt3FVO5Ne8lL7RdHrVuO5bZNsoWOo+KOsDOgZBcwcRqzzbnMSkJ9M+prRxtZuL+1RkP1C07ZXM/oMBntekSSBQ9qIgzLGpgT1pnZjj/PosBnZ5R1MigshlffKjYW9y5wT+Dty3b+hb/Flvt+M7JhDHwr+M+J1YCUlIBthxUu5q6sJ7tNYaQFLpEmgYeCwGTMXRydSQ7Ps8VBONdesqeeWMnv0cZ2n8QTrMrt3BWro3rXq3PNja1iqEdHSk5oKTFOenGDzA8E+M+wBvem1GCFRQ9uQf/zCGU6Wx0zDwf1vitZz2FypZ3pKi39CCbsKBusCmAaHmgL31NMP8CqGWPOGtfE8Epb2H4J/DOs+PGWNecayvh05e4B5rA4ov9RxGfDS5K9gJnpxlT+7khn+16S/vuFcV8bpCp0qV8dv7rN/VN9hBWGpWLlLrHiqfrYL2N7hJWcyyWdp8AaJvIDdfsjrA2PPUvEymH7DV8/YO0t8mgW8t7yZyWdsj1u25+x9VUfYOUea66tsRKsOjlyEns9cI51pI5RMXVCrOTTm7lq6n1y/fhM1ZJ2FMDMyd1Xq0wqJ5rGoQOAH5slo3u9j4u8prEnEekNj202OQqpumibXqKqBp7p7LmvnzwDizCoTasBG6RJ3q/oewZWWYPLGrAAwZLusj6huZ/p2eFs+MZZElDl1d3x/lfe/5MgRRyHWVLuAUz8xnTRF3lp0iifm35OrGUNTGioMcfW/XuCFZ44e1Jqbn52/VLRL2GF3cgsMafz6mHafxjme/IGenSPEgPASprrHKtE6jOYTjMnJTDh6STU8yJBOfVeuNXOzOnIz2Kq5zBJvIOY9w2YnA6r2HPapZEdH4K/pU9+hDUQqVUw9BArQE7lzb+EtczmAytX3Y719ePbRxwJkwYLXSV+FGBydxC9k20mBeduh6HJ8KJEmvSrc33QWPrRT2Dei1QruvkB0yTg6y7zPQ9QOhRwBY0UUcLFibZfPACsMc9YvnkAMkqapYCV2ZiMH1KT3nPImdyTxK9G7lmX4nxBPUaSQJS09QlX9KnM3OdOnmAVjplWOCXAGqlsaF2K0wOYMXrJkj7CnAI1Z/u0iQPsGS2bkjfRKkjzEYRf/a7rL5u6gZ/TxUdn2mbvJaSmxGl8R305FvUIJ2JxkYrxGOCEqb+ZGN84Tij8GvOpeKJ4Q/OH0h6pR86I7tjWllIRjorBK+2pvvKeeptwK+2MjLGTQa8kZwacxjbIfdf5M7AekSUjpgC72hj9DKGQj6LEMBljJg/b8nQ8AtvmbDXlZ/GL9H5su1gfqvUhZ94TaVtrZMnZINuhRvrYH+oxWNgSHRWM4AQbHCpvP76Ac7Bk/qsg5iPY2VPYIfaW9OND6fNXSD/HzmDx2g/p/TlEz8JS6P8OB9WlBKxxs0/X8RJYaUClOmvA3susbO1PPcFJZr+qQ805bmbC8QZOxLUlmTNhIWqySrBq6IREzXaY4oGpslnS0AmcdtO3rxmjz3EqrWBNa4fc5SfNuc1BPwKLq7pp4kvAziZ5Z6HrcXIi3qUEJ8tPxr6eF3AyP6Q1hR3g1Dlt2hsglbtApAQkC6TNYuNKPcAJMSoZMAPO5OR2G2tN/wBnGYuYzKvf7SvcMomv5Qvl5oqz9ojmA+qp5FC5Hw8u1NyYpQc4E+GeF+HkYqqxHIh7glOD2+JG1Fx+WsATs/n19cbli5VskMZ3XAgeBlnN14faT4uOdZevHNsaCPPfwRlSs4iOOH3e3eDQUVvJPwZLuuGaSgnAponr3Kj9B4c6Wh8l3ALaLwAJZWX4pUPleOos4bwCWIXnKMkG2a34PxErNpzWgPXJ+dIP2FdkiwvFe80zSDIn7hI+T3Caleyb7SpXb22aur32XC3dStrNlJvq+q3/5ltglX56hWkF2GjdYWJ/8qseKAKoAe81zyDtpoBah6dPnqtzG3xBeKrK59rvzZz/R79UhWKdmfbOed57xiu6ZIATfqp71ispcoDMIodKr3SJqfMNh4prO2qaDdXwOiNIx7+xUAOq1v1kC8Ngmhu4KioSwKo+ZtoqcfYApswc6iXTW4AZcPr7siX2EcwRrPFICUySu45ZDvJOa88S4jN1Pk9447Bw6+dJ2qrWTpbucHfVnCX7q4iV49i+rOc/gcnZ+VaxFp0wPWfAvr12pLOJZklk4hfXJZuvZksfwBQx115CIKXBAAq6buE4P0CpHFcbJQQiQMl9IyPW7xO6tR9VHclB3LPmfQZiJhLdrcoOD2B24yK4kioOYDINNcJ2vvIDrBx+YLq14kjHRZvRlsP5Drf/bLsWfRGBO1ZypAMPNGfOlc/0EGZKSX8ZYDou3JdL4J7B9Kkl04OAmVwHEita20cwnXq5xA1JElsNXax9fARStKjgAJD4qIhlYcShoVXP5Ny5FbqkuAiYDsvOLrgXYEJ7fHhxnsNMel39ldNkm3sJ/YrOmx92LvsJnl16LyraKetL+LRpS635f8Sls7w0vth2X4A5fbQimMnYRUZ74TRltlkC09rV8XW3idXD9H5vri6BqYGwZS5dzvijs+5A0uFUl5BtASYeJty4bZL2EVbEWlKyrABYM3qHvdhlvx9gNSHrWMlWMuNWMnxWLsO3c5iaXsVYD5jKrpm+hhkclz1Z6JrzXglc0eoCmAzc2Z2xvflzrIG4y0t68YCVUy2xcT4fHOkYTUtax0wQGLWbs0HqYea9OC5LYHIubsq24gVPWabkGVbYixr2f2BFqAW3e1X0jvYHScbvl80jhI0S6ldj9Yh00tss2DnWIdpTaybCTdlEks2qMbb87CErwagkfp69/NoHFJ59E/A+h4n71pzxAsxMrkgsOs3UTnqehXv37NJpkUt8EcPDZLA1XjjMOZgIkhKUCk+Bgyz2iqgz99trmgWBlVscx3jhRKE9XWr8OsPzDBnL3YjPLn7qKCnImON5civmyro/Os3u3yshnsPkTlzW8uUFnWQWVkH1YqwbCRSnLS+d9cI4gzlMW5RExn5xgZ2NtSF6ANPhfJRw5llcDOHgci81/AOYwV2vJacZeJv477596RHWOqMZeKDq+VHzb2DlBvQayxnQoCQjXdUQnsBkg+xnDdhTmAOvVLmmfpQLEyPNmSUtVsblWM7Wsn189ACrCkLOiloxsN4WfkmT/wgmNy5G1sCkLGm0145UunvJgKLlHR9JjxdUPgye1HClAaZyH29f0Xk+gqkuXtK5ZiwiSTZ9QeapQdm2HiUw897K9YYBndq8ldCO27waNytK7IMPz9ytxNph5YxeSQM4sJLgRVlMeQUr+xZ1ltCOA6tP3L6uhpKjRXzix1/DDLlXgNccaVrAIq9V01A/o8zhpzIMKYDpDa80ydxVjzJxnlHClQSUbNHU/gJIPsyS7k+AZCIW7kiu7Pu4GZ3Ogs6un625z2Gmq8pYR3Nwyo8y3zxNxAw1V94v3Irr2M57PcE6NdNL8kzOMlKQ/G7Ol7AK2Y16DVb2fHM3ZX8JKzODJeU5YE2/WQig7N/BCpxWQjfqnE3KzkSB1MOcjWtoWwlMZYdAa6/A7LNmZ4vL/UqVE3kv3fyY2WukX9hOr+7rlP0TJVXlj7pevSNS1ndgOo1oK4Gp5H2OiBdg+mw1VS/nLBKej/wQJT/ACoPiJVO+zokk7gwas1zmhUPZuKoKmMYHCi/vhyzeOVZSVtewYgIrc3iImdZ+8zFMkllFCWcrYLJjiCPT/oIwpdZsjQdM1qM99A2YBhviFUOyfo8kcU7a3nLzzH2UNP4DKywSOTGHvaWfOIBcokudxh7xSI9YD/Y/w3rPNUsJVjxVrucQe0lJwZmwEiZs53ASRF/f0FHu6loiVRxOmhwWfc2S8t8SVlRgjdYSPukydp76qbQf+FDQgCVdrYCZTAovC6Hax+HyWJhnLeLz8AF12tkFuo2az7GyyYs72GuwKnuj59KQPoEJYfKSEhNgBnlbc5nbeXSaCW2SNaeZ7q3/UFt+ghWfX5PHdU4pDQaLbwgT3NGi9APnlKb0/sbzHFGz2Qogg9nm/oIU9ZsA0Uu85mSG1PuSRv4ZTGacS/LNnFIyWM19I+sjKUoSybYSrHAXZvshm/tIOwXc0ZJ8zryVaIxPT8F8AetANC41bwCajkWWN7STDHjNFZ5oNCZH4TXtk87PxIrtWa0EKzQpzEc1RgnVot0hwbGl7ly2M+pheqaXJMmCE0uinvvunEdHmhklnUTBiSU1E623TUJqTUS3WQITYQLe0TKL+0jfK2KXisEFwAwSGXiz1wTeEId4DdYM2vpZf6SEWTReE3Jx7HM9RvsM5vBWshY0WGDi1MYL9ohr70vo7gCS+tNVXpB1mM0oabYPFpaYG1nxsj3z6pUk7BWHycKSx3p73UNXCWF3RUNzsLA0IEJvGSNijVEyGACs0TmJ+4Jbx8qnSkkVBDAzkn0pbxijgA+uJR4dC0uDLKQ7wp6HIXKfNTfPwtJkfnHlhjAP+tVd8WuYpJSqKYUAJjQTwo+lzD+ASRa56FJzmjk4o7U07Q9gtmhNSjpaw6/ODpfdpUMTHHE6tIaXWTPUD5jKLWi+9ECewGw6axaTA2Yobsb2JZpjrNAhrRV1YwErLocNOSblMDNzjpKdIBEX5JHc2KvWxicwm42aGUrA5CKUvlxd8gwmt11JDcwQLhb7dIbPF7Cy3hU1WHPgn/mpzb5wrlC/RUZpQI027mTW6lfKPVXRooTTATDxxzOtHiNiTS1ZTAyM8IdCc2M4z2FC35EWswRmJvcsbNyQBw8zRErmEyPZ2TTE39BLI3V6L0mBJXxPFZ7meEfW4SZHUbouESG5wFd+4ebx26uXEHgAJp76ZAZIXoDps9dkFSceqOnQZdPlyP5ZLfl7ce8+rJWkvSeTn13avoo0EOt97ZX9PUssxAly30qwBuf604tBcm19y1YTH01Yd8BQHVtP5AFWt9lKyp2jwQeF8si1xJ/DRBzHbjYpgQk5QYy0z3w/wKo4z5qADliDzFJjmb95cqQGh6mEfwIwc8Rsc98o9ATr8FFDCD46Xum0FyCmeQ1tKCAiSopY0FbLjC/m3F9DNO6fLmEwHnf5SHtbEi0fw2Sto00vGUUdrBw5ZXFJ/34Ms6Xdm3wrYLJy5AjicjdG9QjrmFKTCgNWJedIjBdOlB5jjQhxPEngJq9p/+Hun7WBQtXd1PIlKNNGrPuYHsGsO0wlRz2bt1aMkU9gatxsaiUwuciIfK59uz3jyZFyjExKsDqekfZtCvTJCg1jP3aWOCF6MalsI17DKq2ICWuQ9q51k9ewOjyRLCE8HCS/a8Ehx7H27Z9g5ZyClaTsgRUOM+LPNRtrn+Nrt/mBIWX0ajXXn0IJXa+p+NrId0R1Oe5EawVMv9rAicVe+p9gpejXSL9Dq0Ke3sMKedUaTixg5bZFs7FLPzzCqswSVhSWBsnwwjcrqc5h4r6S264qYMbF5nrdbFo4h3mTaZZQewyS4TUuEfL6O++NebcalFzOYv6GemKVsmbX6CADnree68PsPdsZm4vi1dcEIuOmFovNnoUHMKXnGEUwVTPnZvHLE5j3DuMamDf3nbxzmllUQB7kvoMtWnbcPYEZ6cBTUfwYN+0dhLm9cOnQch7iNTA5PjLnh75l1mNtXILda7DiCcFRXE6gNw5qtbOLzxglZVmgZLVPNuQYp5sAANNxlCX0y4PUd/ea+jdghnxXzJ7DVJMx+rK/9glMw0eXzMkOEt65jr58mk9QziYl7bXj5rtD5PoGSo9Rk2tKDiJBlFu+AZM9u1EhQMkZJDJ4/0CFcoxVRMVrirJJ2jvBp2m9FOFjoZJLUgxJ2jsj5ds7m1S4VZaNfBU1xCT3HVST6xuKKZlpqUiHAKYaiYLXlGcPYNLalrghgOncoDPGnknwCVa8US86UnqJU35gEnyi8X32krmPlHtLIrwGqdelXAtaE7snB5JMYZm2HYxPBJ+jAyk1WKORsWlNIfoE5uS0eJTAZBO4vWFDJ2xeCdF+Kp7nl68cL4mSD7couXfOJsEn6fqKW2J4oRXNDcmxJDyh9kr4wVa4kuno1HvsWOIV8zm11WwnSo4laVi8IOyN6/eixiRxIsmiyyunSRI9kRqYiF4RfaypmZ7ATK1h6AHMjGDFrb8gQsp54xIRcrzNmN1eOU28p16yGBMwodgi9AfuMKa0zvYB4HXap57/HCuX87S5OdIHMGdaCXcYYCZ03E9N4E2mHtZjYeJnzSaI5FiScH5vKUwPYI7JFjQpganwZ9XWjvIDmCYwSEUwo8Ory32b5ROsdWqUY0lt5PiBH/oYq0ifXkO5nQOv1AZEf2nnz2EqgrmaHSCAqSSi23DFPoEZ0kuYRQAzJGzkmsz4wQMtS4EDZo7Bulz9pTcWqFpJB3gmJ49vV1leknkfrYbGGlg1b2P8hholg1bJ4jzADHUx+2HvzxOVD/NZwnUFrBB3xodRbkC/NqHU+PYTrxTeSPthZ8X5ymaDm1dDH5acUSL3av0a16B2rsnZk+JuIFLYz/08wcoV8CU9l0mKu7yZrF840oS2L8nZz8YZT8v4oWTzBGuQaSRKsHLQ0/oLGG9ihFaCMbpvWkKfvU5vY/Saa2fWahfVPRH4oSkVydDJsaSG6HLtNT2ACd9OS9qEAJMLn8JfkHSD42AVlcTJ4aRUVqTHS5IuJFyQmntHNO/W3nieX/naijn+KQzk84Vd8p2fW2EyAREGSHKu9/Y+OMnRh0mFkwyYZKmYbb0E+wlMk1YyJQuYObT7fEMfsddqlMzFT2XoDrfzBddjINLETbUSlKRKc/V6UylCKq6SiXjAhGKDEL3ldPYmziHuGqw5kpyt9WJEpoWZowSm4X12yPoLYgQFElJDtwmYariaep1EMgQ80ZLmSqDkLK/3daHrAcwRLiUbaAAz4W3N9gZMBITKKkQBTL8agqENp90TmN6YrGklMFURWL3gvwNmSsySxhDA/Oqff0PQVb1JSawOmHCMm7wWBJPUT70mcgs80MRDqj/SmAPf20vW9U6uR4Jl22kl8cwjBiGmaIqUJ2ePELP4xgc5h0lfqeaBcvbo1nL7fPcpVrp1+CrptpnjahPfFPVHysDImQCKEpgqzJ2vjfs5ynYvULcSlA7f0+KHToEnWI077GpONAV/Qf09rGkmFR0YMy8udfG2yc4+gKlkc4wSmNo15y7ePBf5nqxztBKYbrYJjc4xmmVNHwswjqkTXtMLNz7GsKLE7LwgkLKsaz3A6H14CREsMMIKMcOb+sKNk2xx1BwlI+F7uOEdfRREYEVYk5tBpL9w8xFwICqCOGntguPZbRd2PDjNzha7LIEJP5YdcAtRjzvpdJRYUkcwk6PmMN3cpyxZYJ/AHKNZxewZYQ7uOZXluOEjmLOXbA6W1qE4TdtYXrkfT0ArosMqkIIgq63ndZ/AjBZe0QxAmG5k81oWDZ7AbHGvFyqBOSY1Tm6XRR9jDfZ79pLWBWlykU90rJfZn8O8p0xLMiGEKWRmjo1OOoXJUGuWUAURpot0j3qMjS+qCOMYeJsvCBFD9STtUoUV0qsJBw2XvVRPYJJDoILDijD5MMeSGOjRpePKZ4VrTJikF4y539nzAKtZ0WY2YiV5V+9dvB4mrWaNSrKL3Xy57gV4ABMqOYvE3S5BOD3HPvvxBKvDIqvVYOWMtq7LhE9gQudJjX23i3uOxjqT+ARm5zyTVmhQh2knZfgLN965payVYLyZmOd+8ABmX89KB8AKzVSxE5xYnWOlvlb1D2BSOivISgmT3fxNl9sxHsFkg3NW3HzgdU6f7b2bH95K2r6IVab0uaY5eQIzpnrVkbpRNufeyD/BGjln0ZFyNsrtJawIZjWG16RtxsWchfTy2x98/aNI7gceaUas5znC7iVmRzDx/Is0/mB2CX9npUWNufUjCl04zNo5aRklMBnH2Dfdb9ZjbRMH2iqONKFKM8idryuYkxvMjmAiOpaaJG3igTZhS/sLMMlKbSUZERaN4JQsySOewIyGeNZmDcwxWYFd7nQg44/m2crQMeKTLn8Kc+JtylgzhJlTCM7GtKGVR0mnPGGy//zO+67FnXsU8quv+PcPFDIkVuLXz8vvbphVfGzZoQntTCvxOsxqbn7cumMVJRnCsT7kLDMyOkxuhVff28VfuK3F/QlMZxttRToMMMW5v3q7OPIR1hycV67ByoZCSOZuooPO379pFvuVtidHRYXtBNbBxfVjS5husNUfYtQ/xyo7lT+GVWGdcwDrKrJ7BlO4N6ICZr/ESOC2kqhOt/yzWPPPcdoapzT2hrQanIYYJHy1lHPEkNipe9vVFISsx1ECEzqE5DG7xROiCpOgm9HiNVhmWz0qBuAJdnIMw1Y7cmAQrPfZTu4e94F4sSQK6XJ1dv8umX8lnASUG3L3Hc4ePUtsPXBaM1XbZknuaaeITTJv81LxzUUlG4AliXYs07es/nc3PzrUMZM8mzWXnzfP4kpBSXTSLMSRMMHvFq/oUkfEfUEo02yFEkF0fJGVHKCUGj5lolRJ7pvfRcrcxGMfko3fgp33rK0WgeU+a+7G+vMYVLp3+VAX/BonHTQ22ZbgHDChbb/HRZS9SV/Fgl+Dxacz/VQB1q6GP+3LGihiAZjDyKNDDfg9RUrf4JhwedFK7GGv0+Y8EqhEZK8ltVrARFyL8Hvll4iyYrJz8zfqHgYUotpqcMIRXeWc7jnhQydvcOC0ppkNIEnTmktWSEEsgaOcZ4YeqqLX4PSLo0PDVkG9cOvzbHLmODXS/xZMURCntZtHfBfbcaXR99bFXwu8+FRWRErAhpL4exWIsADVD/XSFGilirXRhJlhXFS1uHomTeeZ25QtuB2nIpXX4yIBsPrSbep4GdqPfHtYzbQ+pAan0oPr26k5SC7kIsaZsufWg5JmF4B1v1nkd2CtG5foRB5E9ohjsllNdBd3y+29iH2JMz9u5W+TOnhZwc79CmXKgh1chnVrsJGZsdlJogyvqtdQGRKncCnFcvZj6BBteYazMQqpyZSMyyFPI1fEoAiWcCxH/LVkljbtFVuHiJMjaRyf20TLAwoXf+eo9YVao1Hxl4CdY8i/RfJvHulMtzzbbw5ZQhBeUqnvecF/V5eFdRriPvP0OH3arGCFJUw8I/hIe6Jd2NHW+lHWWZR917OiKQ9gI+Aby6qj4BlMzrhazdUjBkG8tG/SeASW2cAaz3Re/V5gtm90fATW7zRpKwFr0pkLewEl6VxLWlyBMgZ8qfVM/yOco/eihN68JiJ7DX1BnshX5FEx3QtNjyc6TMcb58nsGtMbUoKTO2l9vUphTvLuHNEPMHxEDDFrcMYYt8Yb5TgRG/qsSUIA57yXam7e5zFOASCEeBU2VDre52SiLjcbJp+BDYQHJVEzwOKRwo2StTA9wOnDS3bkEScCRr3XLL6AU6idKoIR4ERsp2R/kq39fAC2Z8ySgUWRi83r4W9IlCYOwSpoDonTSHKoayf/wXkigGWEmCU4uazV4idP7xhsZ+poTq05VMQM2WL+4Oo/AWvOhSwFYBUv1Tz7eOUFNGjrXoTTlI7eG7aUi1qGVOwhI06y7praiy+1+RwlBlVh+KervWGjGOUgiKjIRYjhkUpvvqR5eHT5pK73EofP8Eg1tW1wws9SOTvPYDdEiTDZxYa6Dd8lcM4++lHg5Hf1oSKxB5wTnri35Vj1E5wG3xwuVAVOvzpbx8dGiT7AyVpOzb37ZXZXSNreMj24/GZkp5USsBw90h/N6DHYnrT63mvATkT4Pt54qTDQyYnwCk0aF7tHbO7XlTwC27h/tSQfEfROM9bcpw9wKiGNGrGKi14OnKiIdw5VbVh+xhCeg4VU9XV32TOcWTVAIgM2f0br+QZOv/snS9TUgE7tJuti3iNhciuqkwAn1GmyCWy8oUnJWNprznMay3nL6fVnOFsrIe/DfUOTpsw3nmfn4rySNX+Eyd1U77gmMEzjO1v8HGdA2kfKG9LeupYsXCBMtuQ3fwcmG3ZKHOeJxxnO7bjylpkXjaK07rzIgjlyk85/gjM5MFZzqKN1+bnc+EQ9SVgJrwrATvhhu6TuVDuqivPqZZYwqmi7BLLU208ByQOw+Qe14nOw8O4Ri67bTJhKGCOOcM5OLqVWgnP03qiYd8OirVHhHA2HA6wBb8UwHsBOhIupq8DpGc7M1ltF17N2tpnAv1+5ec9wxtAoyT8CJ1dRtn3D3hOwgm+1iKJDxYHaaoLkEUrYpuHZsgTlhDvq+QZKl9FrUMrFmxkhb0k9gocoSkMArCn3lG1U6QOcA0q/FR3qnSh94YEqGf44JlyCcnIPx1gNOzw8zaE1g9fKWhO9sVV/7hOckE+OJPUanKZzsyXmEc7ofUpJlxZwBsLEWPaXPMMJ2zxKyAGAkyF9ymqC4KEc6ahpMVC77q779mU6X1GhHBL1iqQjwCKwb/qGxMe0GmYygCSn07rA+FAzidUk8YBzOjc7+Cv6s6iFVB0mHjZzvKI/o3MbWEXsCZwIkkh3NfwFPT/g01uJXnIE9FD0va3tJhy0HidzA6yCzVEyaK0sLpGLcEvY/Qgsu1VaCSWAssKknN9dP9IHhzrpMJcIU1z3UhzdRfPn52n3f1oJThwmfLBXHimzeCVLfYmTRl6XO6cfnufdTVIhTONiokVso5yevE/DeZbIEetKgz2Jb+CELxZWQpun43ZCGcS/oZeErnLU3PskRpVdqvER2OAer5JGIr2LS9bnxmN+gJMUzr0Ip9lMmOMfkg4PwJKCtyY1xhITvvpnG+BczIs10puf+XreGIiXJJuT7c6cwlp5+KQxirPZS/XuEiX1RZ2I6VXHWJWVH+Fkn0rJekXiNHi3HOR8AadTnrzEd54X6fV9vwnhCVjnKpkaGhiAnXzz6zTeE5y9S81GarHGxBNvaeWTPsGJFyqjJIcLnKTiY5FpjRP2sJ0NsE/GTRWPFDhjwnfOzb3jUWg7U6Kd6yAqOvGB8+7KWweiwMn+hXamnOCVlwR41mHu5yBB8HgBZ5JGrcLcAydcfDyjjVE6x8muilHSOAicA2999lfO07nXrFWweBsrS8rOwW1g/wCsc59uTQXUWGDifpqQemFyYQdZRA1OPNIGay8vHSq7HIvISAF2AKq3lyQf7lMJGwRwznulTLyDc+YoGbk1ZYq04y+8ofGdC+mlRJiUjxTy9IphGswcVDThGitMbHpaBvfPcKa1koodcE7NEUu2eeIk59ehd69FG1aNg0w5fe7E6BincTK6hIfSWFzqTX82TOdgZ88a+h9jkQm+pu8M0/nld+4qKtGhdmegbBctPXmkMrOkH9M4zeTRh268vPN756azkqKdcZqJm0F/CpXPwZJSSmtcPU4zzXts+4XLT4n88Fs9x8lKaLP5xiNFGNI5bV6AM2Do4Zb06a/cO/zyktkg4OQKEdILSzlODseZlSRHgRMxjevcOU7HOOGJNylZMmAcX5rm63LYI5zsay0ZtzGOLwm7c+QtC3qv4SwZrgdYu8PafEPjB5dRzqjBSRoIf9Et4abcJiUaf1xcyjf8FY1Pj0dLuvIsr86Fy++Y+yAVZclEA3Aa22U5JfPO5XPPCilXWwnYGBzW1zfUKW4ru5VknEmhx0TmG5LUNb0kfT+vTu6D/op6Gl21hnwaOA0YW75hmziz38UrtokZefP63S4sb6nR9gfB9nOwk4sE5saBOi/Y4hgyWgVOJ3lehI1NquQcJ/upeklLu9/keYhpdzW78/OUzqmzGpxkBycHZb6B05jLtBKcU8k90zfZBw40y5kcmdf05Xkn0VPTWLbiPsEZsw08qCjBafe8wS4AfYCzym0CTpI+rLcJPbt3heuoFb49cHLcYMbOEznHKRMBU8l5kjJPjW0pL9x7nTPipMwLhMrvyLtyuryiBuqkzAuJfOMwXfsoEXbB45Q2OBWx90ROwbq4Ri8ZVXWFGwpdv+5wfYLTSEdVUqUHTmtGhriWb+DsXF6QJThxPQMqZLc58AlYk8Zp9Yr8GMDORsl841DFmHYqaRd3wyPtTeUNswScYjVkCsBp3G/Tdvnbc5xkC8iKCihwBoKlua3YPThPilOJuje8z6kQpBfMp0n/ahoswOlXt3swfxPLH+NkYshLKrXAqZNNzW/IkWn/Y0f7c5xMr4++ZdB4KEzaa/gxARZKFL7Dj0nxc7DBCltJABpXd/iNS2bcRzi956gZaAFOa9z88Pmy8g5XubnSShhnATYcf6X7G83iOWq424Fykspl50E9aBa/w5yKEoMPPFE2KIjfV//CpADEqdUsYgVY467xXXb0AU73rGFOAs7wJBvLC83iGsbJyBJLOvBIxxy7iu2T8xTREjp0TzzSKSQk8nf0E8DisnpJdJ9wSyFT/tIjvYfuanCy2e2ORd+SfOFu517zAmZnj8q6EjqSG13iTJ36qGko8omXCrusm6k7h0N4tPJMFUJQw5oGnGyBGOtEhLHR5qtp7dc4xTh6WNGrAZyhDS6ZfD3SP5d8bgXqFn7EmmYjrOiRziuDy7z//OpZJY1P6Pv7IxXF/Vd40NEuRHlcELi4+pwKNzvOcCocZympNgDn7eRwoc766h+B5ZORkpQuwMInc19SFhAndMwZt9tguNcreJ6AkzCpgnyt9J+BtbSeFb5p9KsxyPdVQuIhTpxCydJY4FT4jdr/XOzv/cShR2yeo2nRmnCAdK51HavDfIazG1vcswRn4s9t75Y8AavaEUVoidjL1bj6ij0/BOvlYKXxu0t8E4BV1uzZPv3OyTZuw+gl668A1kncv2wpe4DTBxzJ2UrWXwHnYIU9V0m+JzgTNnrW5M1Crya965JA7RlOjuGUtDwCJ1Q6h+xXOOWmxjnZf+NjqLBvI0twQuFN2NLUjWMKF0P8aGu0DyfjeklDBMAOhA3Dl2c64ZaOk1lrPE4bOavOdMYkHfwiZ8blA9/7dn6Nsye3v1WkS8PuCcGbCubP/RKEAV1kE4/IGiebCWuquMERLNgP2Vqn3rifHFZxjdbWaGFMizingTYGguflCtEp5EWJze1vcMIvv0ncS3BySzaip0X81O/uzY9r+VugSZuXJbwq4Rf0PZyylcfXG7xBh7ydAWXpoqT/DUA1JLntcXmiNyfxppF0A3R04dRUlgD1CTe3yUqUEKvYJ+f56ycqIgidS5wnv9hkkG0lSjjQMbgT7OjmufCPNG0FQONqTir4lcZH1Ds6X6kc3Tw0dJbsiwZQOCWp/SsBvTD3HXD9u9bxS7TB6VO3kkZioPUuCMlWBorc/pMbqs+AGnznkn4oAB33Hu5cPtTAb/KhQfw10CSXeStR+nFxf57J1t1jjXvaZ3nVr9EO6OOsiaEHidzZs7a6/+ZDYBTlyJZCn8IWFwE1NddYA80O+zTONP+c3NZUEpaMKwKiT42yCfQHflxaP9Gq5IweVjJ9DbCJ17rRqjhVCNYXA+6vgSIyazWkWpFXF9ihsc1GQlk1rnHchCdrtMHsmdSE+nmpw99d1qDujSnWppy5KaNFTU0fQCFPI2WtVbmH4cPMfgBUvx/5c6CJMCpt7aHCisnYrULa+vykmSpJm8+LPCtQqLsGGRp/8gPq0bFO5hG9RKvOC2emxtrtDm0ghtV+JFYTb+cu8pWgdW4aWmamAHSMkc2OxCqnzllCrQegg2+xr+LTxjfX9Sjqj66zqMTDtV3sA89l5vQRztGzhAFwkFER3p+tM6dPcMIBaq2izRg4rUOa9JXzRLxoNXO4wAlfGffzxvPkApsmWQOTFiSWpNTPcAqJ4yt8k9EvxJ7Qc2+ghAOpWpHZHSw9upq8cpYkXK5I8AClh8GHW6XM2CrJrpE4SewaHN1Z0mcGnMyK2DJP/ggmLZGUHKdciO4syEW7s++jQWf1o6z+yMFXWqI/5YKj5731rZMPlxRugJzV84Z2zRKWQqA1FiH8c7YrtJOx/tGKTh94C+Il7LRAC5cEUWn7SkssHCgR+tFfVvu3aEM4l1vS0QO0UM0QgdXcOJkRGQblUXGPNh9+T8WxKunLMpiW2ggYwLbv1QK/FzAmk6QIrcGYyFg60KJ40q5xVIZkMWKWEFkBKDtO4UvkpgHhEVq4vbiSEooLoOX8Vy6D6Gc4W7qXDG8Mu/ASA/HjKtsDoCypH5XMo8OnrGmPBFDyaM/lWP4zoG3CONd40nZB+O2mVd5p1UfHmsLdazVok81sY9XK+wyoyO1cVTgCfiGGD2urxvhHQEdCVL1k5RyACslibCf6x0ATvr/NknXSAMrUyU2I+cYbnRk1W3oB9EbZY9fL+xDtEG6IrEELGzIh+Fv/+plYdS5eLLGqca+cnLIvTT5D20i5WhINxGVAGuToeA2t9bt3tAQtqdK6fso+r7xbpW8uNWi5T0Pn2M3yPURr91KpimhgXB3OBVRCvOEOwCeCuil5suNSmOqbd/c1dwBgtWSJHtDC/c25H5t4iJbrGUsKwECbDNo+L/aVsxWoxt4qWtRGXk1ni756srOJzBkn03JMWd8kNlaCE6EpBMCWvf4UjrZJtmxT6wpnM2rO0wHS56qi6p11rJPxjuT85SxpUgHKcdeRV3GL4jza2ehhWnIYK2suHRi7LudOFQpGPY9O0+b8vomnMOclcNU4brtxrkhEn3k01ZU+WFKu6PoBVq7BiFURQDnjPPTg4rlbCB5FybT5IBfn8H/VdPRvREj3HSk7iGxvL+nzA8TJGYFYTXOQxWb+6wD2/3eFl0aOm18qTjLbxSFjj3wDpo7ZtOI0AVOZRxsr9Y6YXT7Jhd92oaWJtlmyfhYwfeLTlmtyOZLQj5plAZNF05LFL4CZPLC2unS4OgYdLUcw8eSjhFYg+9WMAxDbwsRdBTnqluPN95CSeRNgZQJFbVXv4xxH7352pI0zDRXpE8Dk5smxTEjC1+tNTxpkOOZvVpOOAkxIut77CtYW0/o9dNJOsHZuz4qiIyUrFdkvNskIvDQa93Z0/S7iNdpe7v0fOlfNp4bw9LOl7/cwOcJTslYDME05r7jS9gZH/6xDHjCHZcwSmZe7uKO+IjwyRLjzqOUQMOm6lux/AEzExkuOBiN7rJ/qz+w1S0dTLyYEfOzTTkzOuuShEi0ahgPWu4NbVyTbZsq2iTMpamzGqHDlAZOkYc1XBA2k/otTy/k18iUlMJOOnW/5TjobIqUfOk69KNOUxjaUti48Knfe6RG5HfRnNCmZKwRMgaTod5O5rbBym/lRwGmqJJOQEqzw8eK+/pUvGh6b+RLfxfDceVTRYA6YCDDw4lfMqxw63ArTDiYZ0atgTjcudtsNbeCwG5TX2ZG2r92VBVj96tlTxmoG8glMTY0ajljAxP3A8qx6TR7BjPHtITyHGQhkxbeEcTYg9H2TXtxi7SpZ0c0HrIkQRJc0sU9gJsvYo6KtPOPqHFFcxnTnMOFj4+nXNEMBpiJQmrntNoScbYcfN1C5oGXWxB9xebRwWVUTEEPrpzL469xdeNOa9YOAOWZnsnKRH3FI2S4ntkOZI2tmyHNc8BfS9n2bKmyQ32DdidIg+WKJkzcuaCbOPuwojuj/b0fed1jxw6WkexdYLenc/Lluwutwj36k7qFDi0Y0AJLMEZmya4FApBu7ISLZQSUPT4k0jYsEFyO3raW8QTmrfkzuyZQSI5oXf/XWVpHdT1p0I/h42uk1jlOSZX3M5TKVBygLlWiSxxJmbpUd4aJPbUe1uWRBtqRMA5Tp9ySy16Msa8/MebVkVW7Wo5xUx1YSfMxLOX2+XNX9BCW7ZkpahoDSbbIWueKtfHKWajW830A5yIHXX0CZcZOuFKCc7Wq9I8TeMheSzfMwzcRsbU3vFaDKTSAfGyYb281h2FbSv4ukz2EyfF/zvbPrPcKOUOZdnssSlIN1omW78BOUgx3YVvM6J3etLROgwGgZh/roaxKiAGWnz9ElRtukbProsvWPYnOiAkNcQrMArDqzdf+BFMDaIX9NoZ4H1nuQaxnExbzXnhyhVGEZKUtQcj5gzvXeBLhQZ5V4GDnyiRaEmlOu3sgEsaZXwcXtqNO3MKUoowiYSs4qWZU3A0fSjoj9iZJEIDUo/R6z+2TqVg2gjX98hhXWdpTs6wTWgfiKC2UXNaR7i0A70EtDuJk6S3hqJqle291vtJAi7sQ96mrgQg++0BqUiNZTlrHGE5RB0qiKGhdQGkMi0hBvNo8cQ23OdHpJOhFQR8fl2OrayfckftQJGPf08C8P9H8Bpfst4NsjAwA=
````````````

## Artifact SHA-256 046ef73eae829363fbb2ddfeb629e79960e5a5e1e711bdcdddaf5ed298af5980

Encoding: `utf-8`. Original bytes: 350.

````````````text
{
  "original_executor_sha256": "fe26b0b0cb09a2410134d2aba52654f3e482ec704b80bad08bbd66876e22eb5b",
  "new_executor_sha256": "96cede0fc0fe1af02559936cb20d44c6e424e7bc73cdffe32164837882e214b1",
  "body_unchanged_except_candidate_path_and_label": true,
  "original_full_suite_and_bounds_preserved": true,
  "launched": false,
  "model_loaded": false
}

````````````

## Artifact SHA-256 1b43b45bcc3b853089f868bd650f313f78c9bf3a3f03a9701b4dca2cd3298df5

Encoding: `utf-8`. Original bytes: 34874.

````````````text
{
  "classification": "Complete weights-free static gate on exact V349. Includes the original small C/Swift transport-fixture compiles; no Slotstream rebuild, model, serving benchmark or resource qualification.",
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
    "identity": {
      "source": {
        "Makefile": "e5082f0416f2d534a8a84a9f89fe1ed555f24bda661041e27bba9acd0282758d",
        "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
        "Package.swift": "8e2faec45c5aa764014d61b5cc04dee63640660322ad3e943084d5cb6dee4f87",
        "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
        "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
        "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
        "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
        "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
        "Sources/Slotstream/CPUSlotWrite.swift": "da137aec8944dab6590cbea17afff28f094aef876688d20782b5791028d83349",
        "Sources/Slotstream/CacheBookkeeping.swift": "08e4699592062a413e986e0e572aca7504dfa6cf589f5a153f5b22b44a117dc4",
        "Sources/Slotstream/Checkpoint.swift": "c12d46bb51943700c05f7de0269574de2077a15d347a542f7bb229f47b0d4353",
        "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
        "Sources/Slotstream/Context.swift": "fbbfd320072cde6ad01b12dd93f5303258a36bec59a6e3e150c9b70701978ca0",
        "Sources/Slotstream/ContextFeasibility.swift": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
        "Sources/Slotstream/ContextMemory.swift": "c59d3ea2700eef685182b374934aa10e997f8c045990bd7439d6dd3314f46865",
        "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
        "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
        "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
        "Sources/Slotstream/Engine.swift": "9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316",
        "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
        "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
        "Sources/Slotstream/ExpertStore.swift": "e73272bce5c32851ff531bfb31f4b9c549c8a7607844155feff4c91a002a2f04",
        "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
        "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
        "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
        "Sources/Slotstream/Generate.swift": "7036e275990695568a948e279505cc03495da21d8b5f81a5f9160843d59c0c0d",
        "Sources/Slotstream/Governor.swift": "5d41e9767f919ccaf6245dd194801cd8b5189362d741fbf01e9d95aaeffddd48",
        "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
        "Sources/Slotstream/Layers.swift": "7d4c74e589ed681094bd9570e1d550f5c9fe4ecd9e171bb6360d2e0dab4b46a9",
        "Sources/Slotstream/MTP.swift": "edd961941b4a96b00fb7e417187ee9a291d92a73348e17dab2d3fcd150131189",
        "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
        "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
        "Sources/Slotstream/Model.swift": "a4cea913e0f438a69e72672d42046bf904717700d8753c1449e5e48b419033a6",
        "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
        "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
        "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
        "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
        "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
        "Sources/Slotstream/OptimizationPlatform.swift": "e4c17aeb1ab294ac9d9e9c60095cc5360382c0809a4f579672b4d0b66a0ed3cf",
        "Sources/Slotstream/Optimizations.swift": "b31945de9dbedd9f0dd4beb39be7d31a6673f18c21619ab1847e5d81ad82c12e",
        "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
        "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
        "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
        "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
        "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
        "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
        "Sources/Slotstream/Plan.swift": "7e4a911ccd73339f9676f2cd839e5bb403fb3b7540f3acb543df9cde2f09a64d",
        "Sources/Slotstream/PlannerCostModel.swift": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0",
        "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8",
        "Sources/Slotstream/PrefixCache.swift": "f8b0a921d06bacfed30626d8b0d4609660cb4e8fcf50d284fe5f1ac38da64919",
        "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
        "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
        "Sources/Slotstream/RequestControl.swift": "fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655",
        "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
        "Sources/Slotstream/RouterProjection.swift": "98ea668ac6f47549ec9cdee41b81109e66f11935946d2d1587ebf97ad106230d",
        "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
        "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
        "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
        "Sources/Slotstream/Server.swift": "325b2c29e6fc03f17c642d5a72eccf77eb5e3f82be1df1df4b910b65519fb00a",
        "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
        "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
        "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
        "Sources/Slotstream/StatePrefixFork.swift": "c18f2caa63cb252f0c8c8a1f0cc0b0c3b5206bfdc96288feaa1aa8125bb8fe79",
        "Sources/Slotstream/StateRecovery.swift": "1b7f979dada5d79ef30171b7691516d28a41b45c273576513fa68aa6dd8f514a",
        "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
        "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
        "Sources/Slotstream/Version.swift": "8d740b5437ef927435deaba810b2f1209443189386106a1c238221f2f616abd8",
        "Sources/Slotstream/Vision.swift": "38565f564bf8ba73d2dc87e2f1874fa6fda2652e094a324048bfa8cb1278a79e",
        "Sources/Slotstream/VisionAttention.swift": "83b1012cb0b3a2c22098f71515e3e853cf1ca3affb01cb667a8248e3c34c63a5",
        "Sources/Slotstream/VisionPrompt.swift": "61b90891a5ec9944406287fa73b4c0e5bdd29b4e3903dff345cbeb80638c6435",
        "Sources/Slotstream/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
        "Sources/Slotstream/WeightStore.swift": "df36f23325493c95efdd73f9f20d8ce56bc5b7c8b1b40d5660651e143e72d7b1",
        "Sources/Slotstream/Weights.swift": "4c6112412f38192de1955bedb6b7f3cddcb2d0b338b570b6b688df4638a55e5f",
        "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
        "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
        "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "752ef228b166ec58fb70df53e2c9ee6fb85aac1ffc4ad18e8096590bfd324d57",
        "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
        "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
        "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "75cdd2137b2856407d2fb297504039b174b3ae116b40608d5f42fabf0237a66d",
        "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "ac7f3b5ed140a566348e9be06274cf757144d2db099fe5af097c4a3807dc6801",
        "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "7363b347ae2df47ff005cb414722434d8d67783ea85a228d68f3b829153f5f8e",
        "Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift": "51e505bd3279983263ad731133b2f1e20606387cf03ba360ffcb2fba34dd33a3",
        "Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift": "90b83306d1966da794daf28cc84f426a42cd853075f5e236cf1bacae10787d8f",
        "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
        "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
        "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
        "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
        "Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift": "983a071e562451dbc22cfe09b005d9c68af687c10e7d94802d7d3cb28af1c7cd",
        "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
        "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
        "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
        "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5d0e619769c0f7d4ea8c73439ac44bc499db6184c4954b417f4cb7804aec20e8",
        "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "512dd096a194f8c56f1d9be16931714035150ca54cbb02cbbb9d0aec5871657d",
        "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
        "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
        "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "f4b9c59e6abc340e8f15b2d523296ab74fcd269cc39c67f514cb18f41a1f6a96",
        "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
        "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
        "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "e383c494263afa029a9ef107c90d6ba59f44cda5da7ca1035eae68cbda3562d2",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "71b49d3edc91c35572e0e40937860f8112c5ac56b9816ce870e189d4223d641c",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "55d6c4d984dac87ea915306a90507a26edfab5f9fdf8017315645e7c1bae4819",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "5de9452266e8e59da03b078990689554fc7a419a5cd8e5879cc68e2e277ea8cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
        "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "f84979a3da94bc5ac0cfeb5cc84b61af43716c5664cc71853085ffa1b116d325",
        "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "224e4bf5210afbddd992894860343add73d1f52b12b2d9a00abf78fdc492ada0",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "1532f45714ceb98a5adcfa31abd31f065493164f49d2ee3aac868d5d4080b04c",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "5d51636a62b376e74dfefab207fdd42da61436210973f714819c7cc11488a04d",
        "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
        "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
        "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "6c34e92eac7476ea5f7a1126ea6bf0eb5eb9b5b9fca8659cc28c2f760476dadf",
        "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "b5ce492456b9e27b19765a0bd4f23cbd81ccff034be5af3142737cdae7944d6e",
        "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
        "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
        "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
        "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "32c10a839423b13a4dceff67a5b2a617f90d145376a70b19bd27f2e62452e288",
        "Sources/SlotstreamDiagnostics/Diagnostics+StateRecovery.swift": "a53db99ff0f97a26e87586e35bf05daa26b9281fe7d686a1670c14984da2dd77",
        "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "7ef27bec8489f52ccdd3ea51c125d21eb94512924b163e854b7aaf25ef39f57a",
        "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "be63108d11318a9469d26587ade08c79bf34274c61b847d752663d8ce007f9af",
        "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
        "Sources/SlotstreamDiagnostics/Diagnostics+VisionCapacity.swift": "0610214d34b5f763aa65c17013082914f176ca176483a77a422c5a87d592b591",
        "Sources/SlotstreamDiagnostics/Diagnostics.swift": "98ff2ba72838b5346d45ff18b87e43c2598a4ecf09a54b50c050150108a9fa03",
        "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
        "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
        "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
        "Sources/SlotstreamTestKit/OpenAIChecks.swift": "744c5f3b32f22c9ab300cfc6ea766f7c557774a2372464272bda6041384c31cc",
        "Sources/SlotstreamTestKit/T0Checks.swift": "d371b062ce0544477957dc02f525b54f3022e9c2ae128cbb5f3b3d5e66b219f3",
        "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
        "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
        "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
        "Sources/slotstream-cli/ContextCommands.swift": "f260bb03cdf9aea5bd4e02ba8742ee6063bcafa2d7b838f46f8916716d0e27b4",
        "Sources/slotstream-cli/MTPCommands.swift": "b33d034d2e61ac5351b1feb7ff0dee45bcc829988f30aef97aa5aa73252f693b",
        "Sources/slotstream-cli/OptimizationCommands.swift": "ae17fae2d748198fa56a06c6a0ce0feaab2515c3997fcb9a5c7cfe84aa283571",
        "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
        "Sources/slotstream-cli/Pull.swift": "4fa56def1edb0ae575bd898e3b53b669f0a16b04d734ef86e0f6c4a6ad185d14",
        "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
        "Sources/slotstream-cli/VisionCommands.swift": "df80e089ea9cdbc6fc51ec7dc895b0dbf0eec5d4db80eb73b0ca9720a3ce8cc0",
        "Sources/slotstream-cli/main.swift": "a490e0b9d9c902e3996b64e427ce1e1b88b254fc6fe14f9ef7fcd74753f479f4",
        "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
        "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
      },
      "source_archive_sha256": "ff2a4c967bd785261e792d88c63a2d2f71d875e28429c136c258be7e4d58193e",
      "binary_sha256": "7fb2cc0c6cccf93e8a589d02ce5aa839eea38140a1cb8f44cefeb10ec3f472f6",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "wrapper_sha256": "96cede0fc0fe1af02559936cb20d44c6e424e7bc73cdffe32164837882e214b1",
  "command": [
    "bash",
    "/Users/carlos/Projects/slotstream/Tools/static_gates.sh"
  ],
  "environment": {
    "SLOTSTREAM_TEST_BINARY": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream"
  },
  "deadline_unix": 1788843660.0,
  "policy": {
    "startup_reclaimable_bytes": 7000000000,
    "minimum_live_reclaimable_bytes": 3000000000,
    "maximum_owned_rss_bytes": 3000000000,
    "maximum_build_seconds": 600,
    "sample_interval_seconds": 0.2,
    "stop_on_new_swapouts": false
  },
  "drivers": {
    "Tools/all_hit_replay.py": "24401912f3fd8b2e70105c5095c993c131b6ffbe27add38f9268c9e1dc0ed9a1",
    "Tools/api_generation.py": "cdb5b81e785b5e96e4f81e4fa5e2fe48a3b32f20b149952a9ee7f9a5c68b2eaf",
    "Tools/api_generation_test.py": "d2bd5494d9a73ec76806f6aad9344e76554fa8777721f4dd525f9478fe4f535b",
    "Tools/api_robustness.sh": "a7397ac2f5df3a7eb8f7e1578daef51124c1c7fdabd0526c13518b8048984a96",
    "Tools/api_test.sh": "77bd216be56f3a309cff380c649af47edaff2d1d17e9dd9ad4f10fd489664c11",
    "Tools/brain_gates.sh": "7f32151567f0e64f8ed9619e5551bc7716aaf24be6b19fc0c62496b1dd44df2b",
    "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
    "Tools/build_identity_test.py": "04facecff6ee3b65c261678131e5c3b4e64e5aff630b7df00c7414439e2776ec",
    "Tools/cache_policy_confirmation.py": "a2d0108f30b64b4838064ba0d450e49a28c8aca43ad0a41dcd1c30760e475748",
    "Tools/cache_policy_probe.py": "93ce0ec7cb98cd16cca46509089864d6267c3e080a2172615beadd3f69632a81",
    "Tools/cachesim.py": "0f6c304c69f88d49b1e3e699a0230d4c90de937baffc02aec52bf38429004f38",
    "Tools/claims_gate.py": "12a76b03bdf78ca0d71ea00a757684d19a137582b432875d10a670f583dcbced",
    "Tools/compute_islands.py": "9c25400b28ad425bba9e752138a967882d573432e6093d4b898da6dca266b985",
    "Tools/consumer_smoke.sh": "5e039b3f03844f26df5ccd223edf5bee4320cd670b60dcd1b62a2953c18a7c70",
    "Tools/consumer_smoke_test.py": "0fd6aea920c671d3bece420013a9ebc526ed9dd48d55bcdb8f83f6e7badc6bf1",
    "Tools/context_acceptance.py": "6791b61a99763d5b0ecfc510aef669fac982fb7cd5ff6dfc78fe61b5ea7864ba",
    "Tools/context_acceptance_test.py": "9a57bf61a50f2a3187ecc887110c77b3a7d161eea9dc7b7a8abe368fbee21aeb",
    "Tools/context_contracts_test.py": "635c6dcfabd89a0868ceacf00fe305d165fa8720ebf71b8fd147c70838ccbc1c",
    "Tools/context_gates.py": "712a328c906011b2cd07dff0b5225e5b45089b6c6effd4b1a151c90db3d587e4",
    "Tools/context_overflow_probe.py": "3bf2633e583898d2c60ed8630409ccf314d352352ecf342bcb72d0705fde52c8",
    "Tools/context_proxy.py": "825f99c7a16677398bc8c04f3ace63dc98f18fa98c17b9265ac1b79a35b11203",
    "Tools/context_qualification.py": "094b567ccc21613444cfd0edf098967bb758af42652be8ba70762ae313cbbf34",
    "Tools/context_qualification_checks.py": "4f26ef66a0444d5d7f13b37464bcc25f21ceb9c0e3c71f0bc038f128667583d9",
    "Tools/context_resource_gates.py": "b1fb297f645d231250915ce7467856c36221c31885fd9426364637597d57b003",
    "Tools/context_window_matrix.py": "b24e904c0d64b61e08ad33779505445c51f2a00de8e556f14167042390495104",
    "Tools/context_window_matrix_test.py": "37f59dd7674175cf53e87f2bb2663a27c732eed5f9382508b578e96fa9cdef52",
    "Tools/coverage-floor.json": "6eca5d16f69f3bb1a4cd88d1036fa074d1232ed8d8d630cda80c91c309c0b828",
    "Tools/coverage.sh": "bc52a65b95dadbd15391f9a636287611f1117e8decf56e14e189da2d7abd90b6",
    "Tools/coverage_ratchet.py": "9bf8c570b83d6a89acd1b005d1ed051bb8125c5281424c0b294d3b46cd753a06",
    "Tools/coverage_ratchet_test.py": "ed632f76757cc7dfb346de92d1c8b00fcbd6596b4363d093beebbfc67af43a93",
    "Tools/dbmd_install.sh": "8b892df4f2232db0fac42b8bf1585371e652d13c9cd9094c8190e3f957e58e1e",
    "Tools/debug0_ref.py": "930d258ed12c6d60e7db4506a25677e4fe60e8da07cddb244c7740ebb66ca6f1",
    "Tools/e2e_release.sh": "b4762272eca921614d46ec6a4d4bcc28e939bcd22639f7e9bbf5fca0ceaedca7",
    "Tools/e2e_release_test.py": "acc7930f33ce45c93ef89f7568e8c380e4a6cfc453a64fcc93a2c84287b84152",
    "Tools/expert_layout_probe.py": "a76bcba5750c58d8aad0188569c3c53e9721476009034c802a7f21f9d35d3ec2",
    "Tools/expert_layout_probe_test.py": "e6e9363cc3afc9081cb9f00ff7adc6fc77fc1c1a12b9580b32f0cd27c1b32f9d",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860",
    "Tools/fixtures/context-acceptance-v1.json": "7bca4c4ad9a8ea9d0b7496e83e769c92eac901d8d11fc4ce059b07b83c256e55",
    "Tools/fixtures/context-default-v1.json": "c6e55a5b0ab8a4f143b99c8ec0691d528cf3b3f9b5a21d14ab493c886b053558",
    "Tools/fixtures/optimization/qualification/actual-default-one-token.json": "8481bffb4721fbd594eca609506308480e7979a486c327732cba6ff138daf26b",
    "Tools/fixtures/optimization/qualification/complete-repeat.json": "9b8308d23621b55ae70dfb34258571ed00a97c9ea2932127aa787d438085ba6e",
    "Tools/fixtures/optimization/qualification/distinct-tail.json": "7d80ab65e1ed821e24922c050afc4ff24b83f9e3a2b560383efd4e7868aad59e",
    "Tools/fixtures/optimization/qualification/mtp-resource.json": "5a0c57424e2097b5ec7b4199dd9ae28d40e24f6c4eef24d13098f3ce8d652613",
    "Tools/fixtures/optimization/qualification/sampled-short.json": "ec97a77e98417def8f7489b5fd58ded65790659e15ebe6f4d2328c8688d76a7a",
    "Tools/fixtures/optimization/qualification/short-one.json": "5c736b2eec31378f0b3d2beb64d20561569ce8dfd765e363afde72b0755278a9",
    "Tools/fixtures/optimization/qualification/soak.json": "0b79f271e4dbaabe77802a54a125c371ee4519848c2e01e5019bd5d8a36a065b",
    "Tools/fixtures/optimization/qualification/unique-prose.json": "6831b8f47138d175f28ac9716bacaa8c937515a970df709393004bff84a45c35",
    "Tools/fixtures/optimization/qualification/unique-with-retention.json": "0b2593dab6a12e10226dd94d60c43d40b085160b2c23680b79545d7fe41dbb2d",
    "Tools/fx_gates.sh": "035f425d0becb017f9c8e2fd71bdabb52e61f17d69c10ef5194688bb8f20a20e",
    "Tools/fx_scenarios.py": "f8418efaac463b0969f9518f909aafcfb30c9732606b4bcfc811b45a49a66d3e",
    "Tools/gateway_client_gate.mjs": "7a5b605d18d6044fa4d038d169ace4b6541222a3d98977f2b773e204c34864dd",
    "Tools/gdn_profile.py": "f4483f1c78ffc9f70439688f3336abd41768458a87117950fc1b4f3e2879923e",
    "Tools/hermes_integration_gate.py": "517c4b7fbdc5a24bedb7924cb57051ec65b58d44d0c0df40e7119ab44e54b0f6",
    "Tools/indexer_score_probe.py": "b51796a075f6391b301cbe78eda3e82ac9378e16823e9ca48f0f1f97b166e8b0",
    "Tools/indexer_score_probe_test.py": "1cf32f1db801a0813c634888e0a942f6c3dc9abe92fbc538ce7772eb7891df1d",
    "Tools/installer_gates.sh": "ffcb88381decda386da186d82365b635a32fc2e01b8973fbddd6e39464154936",
    "Tools/installer_gates_binary_test.py": "a0017f16f6676bc0098e4cf01508d658611cbd0ffa6baf0ad490d7b90a2839d1",
    "Tools/llms_full.sh": "3f2c9694f274697a2eb63288e1ea7b0e774e82ffad1a9a9483f4ef2c9e7cbcef",
    "Tools/long_context_gate.py": "b7422f009eaf24b079c87cc3ed847840ea941e4a141d5357fc240ad5945a54ee",
    "Tools/memory_gate.py": "9d09d3aade7b1e1f9180f3779a651480f2d7b6ab194065820831c136c3c6cc9c",
    "Tools/monotonic_plan.py": "3ab76df40092ccab549a92ae2ef5ae457f7ad3ab8adc8512ee749ef1c05355bd",
    "Tools/mtp_convert.py": "22f58712346b67a35cdc0d7a4da45a665335ae9382e104156aff16e91b7b053d",
    "Tools/ngram_cache_probe.py": "01e295b269d94350730c46a59edf7a62b562c9c45f6456c2d9947862835a57e7",
    "Tools/ngram_cache_probe_test.py": "05141ddb547bdd870fbc2e4d971caa2e1a84e121b9416b0da87ca84c739d9bb3",
    "Tools/ngram_lookahead_bench.py": "9492467ff3a03154da642f51848a9cbaedc02509f76ae78d3533868bbfd1d02f",
    "Tools/openai_tools_gate.py": "28f571e0f774f9717d6469a926083b17b3ec6b607cea1d72ec84d76912832357",
    "Tools/optimization_build.py": "dee7d43c4fd70aac9145cfe33ea9d3d446e803fbca5dbf54e07d577d27deca6f",
    "Tools/optimization_build_test.py": "cfa7367792c17d4d8617ac2e16161043471714297355bfa0b0de508defea3c95",
    "Tools/optimization_campaign.py": "ae49f185713b26f0999b77126df0c480dda017f09f9b315a020b1693bf52d1c4",
    "Tools/optimization_campaign_test.py": "7d35ef74a8184224b2ec8aabb29f94c4f416c27bdae2d51ee7c794404e36745d",
    "Tools/optimization_check.py": "61d050207c1074131de4f5917bcfcc50373f9d105688ba0185c19febaa6f1462",
    "Tools/optimization_component.py": "cbdab6f194dbb8acdee13d5efc484aae4dd7aa3d8431d9033d77f1bd9785904a",
    "Tools/optimization_prerequisites_test.py": "215ab0cead0daafd4d95f469254870159c66b9d719997410838cea83c151d41b",
    "Tools/optimization_readiness.py": "56a654ab367b7eca3ee6ab0270641fb2af70ce2bd4a242b8036da506229f283c",
    "Tools/optimization_readiness_test.py": "6c963a9aec3be52975da24328a965b3778259a6372c691b3e6c9f32b92e63016",
    "Tools/optimization_results.py": "e2c5e813835792b1d0cfd28fb836528f556fb3d0219ea801570f2d00b7b9e8f3",
    "Tools/optimization_results_test.py": "05201a9fd044498ab578b6d63666eda6e675d77bb8e4f894603dc9401d384e14",
    "Tools/optimization_serial_build.py": "f33cba39a2a427b76353c57075128a9278a7cb3f22d3f086d7be8c25179bf6cf",
    "Tools/optimization_serial_build_test.py": "b6b21d18f2a96522f034b246aa4be3b43f19f11cc178ea401992c54c519bc54a",
    "Tools/optimization_soak.py": "61ea2ddff2c8bb72ea6bdb226c96cdfe69ae086ab9bf8384f06f2a80f3907f0e",
    "Tools/optimization_soak_test.py": "3b61d9e63a6c5fbe79b618324b283826d51ab3085582200df4e276cb1befd0be",
    "Tools/packed_layout_build.py": "2f780a584bd0d5b461cfbf3cfc32b992ebc3480afb6bf78cb167af9ca8fba8ab",
    "Tools/parity_ref.py": "cb938f6215f1433bbc6eef2b8cc04a8a9cf9d5953f487347649637fa911abab6",
    "Tools/planner_gates.sh": "f869506fa2c7c4aa73ecf279a52b84103227a451a7a2e319d489eff30b150b29",
    "Tools/prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "Tools/prefill_bench.sh": "68a6695ab67766626394637dcdaaee1db53fc06077a4ed7310e8a006bfa5de66",
    "Tools/prefill_bench_test.py": "fa263527173e3d139e868b12e19f9417478380466094b35e0726381cbe5245b7",
    "Tools/process_cleanup_checks.py": "2de6d823a4850662fda621cbe2df43aa869731e40530e7f286c9a2f289e6a982",
    "Tools/projections.py": "90a02090829c0dae88d69846f8a0f55bd2b039e3f12c549aa58b175f4e842355",
    "Tools/pull_bench_linux.sh": "2062f832627a33edc8103559c74e647b6aeb1145e0043d3ab310c2205de304eb",
    "Tools/quality_probe.sh": "cfa2ae2995acd9dd0d416ff2d9e71ec538ab0b259ebbb30324c4ad28c6fca3ba",
    "Tools/reference/config.json": "0da22a8ed4323fbe969bf982aeb054743b315206791f28ef74a309c707080ba5",
    "Tools/reference/generation_config.json": "e70c136c1b78ddc1fb0905bac8e733a4dc448d4f852a5dd75143fffc70be550e",
    "Tools/reference/make_mtp_fixture.py": "7d54481d25ffdacb7ef52b3ef345a817d4c0783e6340224edebe587a9d8f0d52",
    "Tools/reference/model.safetensors.index.json": "072cc2c60b8af6cce82a387f62e39ca88754c3a6fccae0816dd21bb89d27470d",
    "Tools/reference/mtp_ref.py": "f28827ac0409fe58b9c255f16add5ecb00b17a2310a3521d75a677f2d4a84f24",
    "Tools/reference/qwen4_exp.py": "6fae4ec0decbf77ca4a4571de683bc5580ec75e84325ecb432dfcd2fc81df75e",
    "Tools/reference/tensor_shapes.json": "302d9926b8d1770c1a11f1fdd9d199b136865117f427dcb29e512c7d6dd4c780",
    "Tools/rope_component.py": "f8e56f6d33c98cc50a64efe67b5c184bb0a4ebdff26ca4aa3e34f5434fb202ca",
    "Tools/run_model.py": "00ea3727aed92fcc17df1e16f4284f8840145558cf776e08429eb1884eb7b8c0",
    "Tools/sampler_gates.sh": "7e781d7593224973597906e7031c7ab143ab4dff540dd4bf86542e52cb7ed144",
    "Tools/sampler_gates_test.py": "89f1a34df9dbb37e904c1b32e15e72cd9fc5c01a955097abaeb2ef6c2d435fc7",
    "Tools/sampler_ref.py": "faa87e6db26853b275322d18cab1994430315e19783b984ac28e1cdaf34395c3",
    "Tools/selected_attention_probe.py": "e4e5a4a4980f4f20dddca7c8a7633c3d4b66dfc2034a4a83f1b791e3f5497328",
    "Tools/serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
    "Tools/slotbench.py": "d27b4d18f75f423443f1b4a8dd4da50965fa1885d531029f0c7f0baecdf24262",
    "Tools/slotbench2.py": "0d38017db9e74141df23664083a0c520458e3a531d5d865ad19ab6e23bdd2711",
    "Tools/slotbench3.py": "7518329fcb4217760689f5c8bc5cbd268c5220ca0a38f2289af9c7d84c8e2e05",
    "Tools/slotpack/checks.py": "59a598a3d77b9fa38117e4437fd11aa52982fcb833000a62c25b2e990d4165b3",
    "Tools/slotpack/cli_checks.py": "a67f5d06d09a713051fea673562a95367e76f8cfb4ac8fe3b1592781c39470d7",
    "Tools/slotpack/coverage.py": "c53cb1fd611ab6fc690db0fc1db1b816e4d0e5379420874545b8760bfd9fe644",
    "Tools/slotpack/download_checks.py": "7958ef42e29b4885319186a4bccd6e5dd3e2b20cbea9cbbf971554bf353657ef",
    "Tools/slotpack/embed.py": "9c0d98858b54353584ab92abd45b85ed3894e0004e38f1e2945d8ab6d6ee8c94",
    "Tools/slotpack/fetch_build_inputs.py": "a6f5b52aad619d6aef58e527ca42d7743e1e45c568dd2287c7f80800c18c31c1",
    "Tools/slotpack/full_pull.py": "b925415dae87b6f240d875e67fe5a9684534e6d96dd953424082fe80c54ecb96",
    "Tools/slotpack/memory_checks.py": "e0494906ac1a8673ee41ec0f60e5971626afc958e4caa49dc29090187e1447f0",
    "Tools/slotpack/pack.py": "1bdaef49bb324f37bb64c7c453f9ec724c9f96c3d1f579ff6f3e9417e1d510cd",
    "Tools/slotpack/public_probe.py": "33dc5a003b4f59356e208f4330370c905a51fb515ddccf27a9dae471cd76d10a",
    "Tools/slotpack/publish_hf.py": "e9a7a07198bd3eddc1dadd94d8dd8729b8528282992c049eb00dcbcf93cf190e",
    "Tools/slotpack/publish_hf_checks.py": "76a3f41abe9b16239a9d32e6fb4b50f4f8e323076d04803a31f02f4162aa587c",
    "Tools/slotpack/publish_r2.py": "cdd39ae06637800dc02e84c948c5b2c50c2c9abec71673f299dfb8d1112b9684",
    "Tools/slotpack/raw_checks.py": "772f4132088582fa9642f3dd86f800be3c8f005e9145c827b6692ee4f6386d94",
    "Tools/star_history.py": "58801509a122439429f675295041e35aae89504a638ff31eb76fe97979d7152f",
    "Tools/static_gates.sh": "a9b1afc3fa887f28e46e5adfff213a7ef8b021529b36005517a16f8879c36876",
    "Tools/static_gates_binary_test.py": "a5abc42cdfd95f0c569009da7f52f28cb9fab9561eda4387edc6970e5f25abdf",
    "Tools/thermal_readiness.py": "461dc8513bf8a23c7af5d999edf3c2ed1cbdb3d80d7869124603fa5babade048",
    "Tools/thermal_readiness_test.py": "5eb2d5d27258b2b1250d2588ec332472d18b65171122340ecd8cccb4f90b9467",
    "Tools/trace_convert.py": "8ea22dda841860f0f829203c4ece5f68c515c13a39f2c6122bc309a2150f0079",
    "Tools/trace_routers.py": "32ff38f4f0f02d9679dcd16fc57f64694836416baf666075151e9f208be23da6",
    "Tools/verify.sh": "4eb4c0990bb7a92141f9510800457985a9ed0c40b4db601d36acfd30cd9d65e4",
    "Tools/verify_binary_test.py": "b9caffe691a91a3ef8eb44aa543bc5d5c95354199f8537b5b73eeab91acbbdbd",
    "Tools/verify_corrections.py": "2cf6f0818a3ab39aac948ba78b5f5e3ac5dfc1b8037bb7f48caa7c16fa198a0b",
    "Tools/vision_attention_probe.py": "1575d36927dba5f4ff52d1549a96d93e7c6c190c2c5e8d94644628c672fbe346",
    "Tools/vision_capacity_gate.py": "851a598f05d34cbaf597e56a593de3bf2a9f492a069d77d93ba6f5a7e0a42040",
    "Tools/vision_capacity_gate_test.py": "4cb266cbc6859ba053529f0ddb792199dc2a4e35af798a4d9cd636a123122412",
    "Tools/vision_qualification.py": "ce719b37ec53672639389ca75a481cbe9a80adc6585557fa5312ca35188c13a2",
    "Tools/vision_qualification_test.py": "7f23e984ece5cfc2e8b51a829b97335366d9b02a0fd95fbf95568d6c05cdf8b0",
    "Tools/vision_ref.py": "fa62575c947392f990841e6ac90656737eb67edb000ab369d7b7a0f66a05ef29",
    "Tools/vision_serving.py": "6afd42ebefd87619d3ccb6dc96172366483ea94f7e86ecc0215a7bdf3c6b76fb"
  }
}

````````````

## Artifact SHA-256 96cede0fc0fe1af02559936cb20d44c6e424e7bc73cdffe32164837882e214b1

Encoding: `utf-8`. Original bytes: 3692.

````````````text
from pathlib import Path
import datetime,json,os,re,signal,sys,time
ROOT=Path('/Users/carlos/Projects/slotstream');P=Path(__file__).parent;sys.path.insert(0,str(ROOT/'Tools'))
from prefill_bench import digest,preflight,vm_snapshot
from serve_bench import verified_build,competing_jobs
from optimization_serial_build import guarded_run
from optimization_readiness import pressure_snapshot,require_normal
B=ROOT/'.build/optimization/compact-tail-combined-build-v349/candidate/slotstream'
DEADLINE=datetime.datetime.fromisoformat(sys.argv[1].replace('Z','+00:00')).timestamp() if len(sys.argv)>1 else time.time()+620
remaining=int(DEADLINE-time.time()-20)
if remaining<60:raise RuntimeError('insufficient remaining reserved static interval')
S={'classification':'Complete weights-free static gate on exact V349. Includes the original small C/Swift transport-fixture compiles; no Slotstream rebuild, model, serving benchmark or resource qualification.',
 'build':verified_build(B),'wrapper_sha256':digest(Path(__file__)),
 'command':['bash',str(ROOT/'Tools/static_gates.sh')],
 'environment':{'SLOTSTREAM_TEST_BINARY':str(B)},'deadline_unix':DEADLINE,
 'policy':{'startup_reclaimable_bytes':7_000_000_000,'minimum_live_reclaimable_bytes':3_000_000_000,'maximum_owned_rss_bytes':3_000_000_000,'maximum_build_seconds':min(600,remaining),'sample_interval_seconds':.2,'stop_on_new_swapouts':False},
 'drivers':{str(f.relative_to(ROOT)):digest(f) for f in sorted((ROOT/'Tools').rglob('*')) if f.is_file() and f.suffix in ['.py','.sh','.mjs','.json'] and '__pycache__' not in f.parts}}
(P/'protocol.json').write_text(json.dumps(S,indent=2)+'\n');r={'passed':False,'protocol_sha256':digest(P/'protocol.json')};started=time.monotonic()
def interrupted(number,_frame):raise KeyboardInterrupt(f'static check interrupted by signal{number}')
signal.signal(signal.SIGINT,interrupted);signal.signal(signal.SIGTERM,interrupted)
def snapshot():
 v=vm_snapshot();require_normal(pressure_snapshot());return v
saved={k:v for k,v in os.environ.items() if k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
try:
 r['before']=preflight(7);snapshot();assert not competing_jobs()
 for k in saved:os.environ.pop(k,None)
 os.environ.update(S['environment'])
 with (P/'stdout.txt').open('w') as out,(P/'stderr.txt').open('w') as err:
  result=guarded_run(S['command'],cwd=ROOT,stdout=out,stderr=err,record_path=P/'memory.json',snapshot=snapshot,policy=S['policy'],classification=S['classification'])
 report=(P/'stdout.txt').read_text();r['exit_code']=result.returncode
 r['passed']=result.returncode==0 and report.rstrip().endswith('STATIC GATES PASS')
except BaseException as e:r['error']=f'{type(e).__name__}: {e}'
finally:
 for k in list(os.environ):
  if k.startswith(('SLOTSTREAM_','SS_DEBUG')):os.environ.pop(k,None)
 os.environ.update(saved);r['elapsed_seconds']=time.monotonic()-started
 (P/'manifest.json').write_text(json.dumps(r,indent=2)+'\n')
 for n,f in {'after':vm_snapshot,'candidate_unchanged':lambda:verified_build(B)==S['build'],
  'drivers_unchanged':lambda:all(digest(ROOT/n)==h for n,h in S['drivers'].items()),'remaining_jobs':competing_jobs,'model_lock_free':lambda:bool(preflight(0))}.items():
  try:r[n]=f()
  except BaseException as e:r.setdefault('cleanup_errors',{})[n]=f'{type(e).__name__}: {e}'
 r['passed']=bool(r['passed'] and not r.get('cleanup_errors') and r.get('candidate_unchanged') and r.get('drivers_unchanged') and not r.get('remaining_jobs') and r.get('model_lock_free') and time.time()<=DEADLINE)
 (P/'manifest.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps({k:v for k,v in r.items() if k not in ['before','after']}),flush=True)
raise SystemExit(0 if r['passed'] else 1)

````````````

## Artifact SHA-256 10303dde2b968a101af1effef9c76bf277192b3ae294d970d950975de7aefae5

Encoding: `utf-8`. Original bytes: 2997.

````````````text
.....................
----------------------------------------------------------------------
Ran 21 tests in 14.016s

OK
..........
----------------------------------------------------------------------
Ran 10 tests in 8.479s

OK
................
----------------------------------------------------------------------
Ran 16 tests in 7.815s

OK
........
----------------------------------------------------------------------
Ran 8 tests in 8.971s

OK
.........
----------------------------------------------------------------------
Ran 9 tests in 7.954s

OK
....
----------------------------------------------------------------------
Ran 4 tests in 0.933s

OK
............................
----------------------------------------------------------------------
Ran 28 tests in 36.513s

OK
.........
----------------------------------------------------------------------
Ran 9 tests in 0.026s

OK
...
----------------------------------------------------------------------
Ran 3 tests in 3.129s

OK
....
----------------------------------------------------------------------
Ran 4 tests in 0.038s

OK
......
----------------------------------------------------------------------
Ran 6 tests in 0.005s

OK
..............
----------------------------------------------------------------------
Ran 14 tests in 1.307s

OK
....
----------------------------------------------------------------------
Ran 4 tests in 0.000s

OK
........
----------------------------------------------------------------------
Ran 8 tests in 0.001s

OK
.................................................
----------------------------------------------------------------------
Ran 49 tests in 0.019s

OK
......
----------------------------------------------------------------------
Ran 6 tests in 0.023s

OK
......
----------------------------------------------------------------------
Ran 6 tests in 0.004s

OK
.....
----------------------------------------------------------------------
Ran 5 tests in 0.000s

OK
.....
----------------------------------------------------------------------
Ran 5 tests in 0.002s

OK
.....
----------------------------------------------------------------------
Ran 5 tests in 0.014s

OK
..............................
----------------------------------------------------------------------
Ran 30 tests in 2.259s

OK
...........
----------------------------------------------------------------------
Ran 11 tests in 0.079s

OK
.............
----------------------------------------------------------------------
Ran 13 tests in 1.018s

OK
...........
----------------------------------------------------------------------
Ran 11 tests in 0.080s

OK
.......
----------------------------------------------------------------------
Ran 7 tests in 0.009s

OK
######################################################################## 100.0%
######################################################################## 100.0%
######################################################################## 100.0%

````````````

## Artifact SHA-256 da4a62a79c742e203875555e40e493a40f72a637be03f53e6f7dd8b4016788f7

Encoding: `utf-8`. Original bytes: 15897.

````````````text
coverage ratchet checks pass
{"phase": "starting", "prompt_tokens": 16, "reclaimable_gb": 20.0}
{"prompt_tokens": 16, "passed": false, "error": "ValueError: capacity rung was incomplete, aborted or over its plan"}
{"phase": "waiting for build reservation", "seconds": 0.0}
{"starting": "native/combined-plain"}
{"starting": "native/combined-mtp"}
{"starting": "native/read-failure-serving"}
{"starting": "paired/short-one"}
{"starting": "paired/unique-prose"}
{"starting": "native/combined-plain"}
{"starting": "native/combined-plain"}
{"starting": "native/combined-mtp"}
{"starting": "native/read-failure-serving"}
{"starting": "paired/short-one"}
{"starting": "paired/unique-prose"}
{"starting": "paired/sampled-short"}
{"starting": "paired/mtp-resource"}
{"starting": "paired/distinct-tail"}
{"starting": "paired/complete-repeat"}
{"starting": "paired/unique-with-retention"}
{"starting": "paired/actual-default-one-token"}
{"starting": "soak/off"}
{"starting": "soak/on"}
{"starting": "native/combined-plain"}
{"starting": "native/combined-plain"}
{"starting": "native/combined-mtp"}
{"starting": "native/read-failure-serving"}
{"starting": "native/combined-plain"}
{"starting": "native/combined-plain"}
{"starting": "native/combined-plain"}
{"starting": "native/combined-mtp"}
{"starting": "native/read-failure-serving"}
{"starting": "paired/short-one"}
llms-full.txt is current
warning LOG_UNKNOWN_KIND log.md:124 — log entry kind `change` is not recognized
    hint: use one of: ingest, create, update, delete, rename, link, validate, index-rebuild, contradiction
1 issue(s): 0 error(s), 1 warning(s), 0 info
MEASUREMENTS.md is current
PLAN.md is current
claims gate: 95 needle checks, 0 failures
BRAIN GATES PASS
dequant_row.txt: OK
layer_0.bin: OK
layer_1.bin: OK
layer_2.bin: OK
layer_3.bin: OK
ngram_ids.txt: OK
tokens.txt: OK
PASS  request VM counters are monotonic
PASS  request VM reclaimable bytes are available
PASS  process physical footprint is readable
PASS  process RSS high-water is readable
PASS  lifetime RSS is separately readable
PASS  monotonic duration is nonnegative
PASS  footprint sampler includes endpoints
PASS  automatic platform-qualified optimization defaults
PASS  qualified platform keeps the complete joint candidate
PASS  unqualified platform 0 keeps portable work and original rotation
PASS  unqualified platform 1 keeps portable work and original rotation
PASS  unqualified platform 2 keeps portable work and original rotation
PASS  unqualified platform 3 keeps portable work and original rotation
PASS  unqualified platform 4 keeps portable work and original rotation
PASS  unqualified platform 5 keeps portable work and original rotation
PASS  unqualified platform 6 keeps portable work and original rotation
PASS  unqualified platform 7 keeps portable work and original rotation
PASS  unqualified platform 8 keeps portable work and original rotation
PASS  unqualified platform 9 keeps portable work and original rotation
PASS  unqualified platform 10 keeps portable work and original rotation
PASS  unqualified platform 11 keeps portable work and original rotation
PASS  unqualified platform 12 keeps portable work and original rotation
PASS  platform selection is deterministic
PASS  explicit kernel qualification remains available
PASS  explicit kernel fallback remains available
PASS  absent overrides retain the selected default family
PASS  explicit zero disables only SLOTSTREAM_OPT_COMPACT_STATE
PASS  explicit one restores only SLOTSTREAM_OPT_COMPACT_STATE
PASS  explicit zero disables only SLOTSTREAM_OPT_COMPACT_MTP
PASS  explicit one restores only SLOTSTREAM_OPT_COMPACT_MTP
PASS  explicit zero disables only SLOTSTREAM_OPT_NGRAM_ROWS
PASS  explicit one restores only SLOTSTREAM_OPT_NGRAM_ROWS
PASS  explicit zero disables only SLOTSTREAM_OPT_MTP_TAIL
PASS  explicit one restores only SLOTSTREAM_OPT_MTP_TAIL
PASS  explicit zero disables only SLOTSTREAM_OPT_FINAL_FORWARD
PASS  explicit one restores only SLOTSTREAM_OPT_FINAL_FORWARD
PASS  explicit zero disables only SLOTSTREAM_OPT_SAMPLER_THRESHOLD
PASS  explicit one restores only SLOTSTREAM_OPT_SAMPLER_THRESHOLD
PASS  explicit zero disables only SLOTSTREAM_OPT_SAMPLER_DRAW
PASS  explicit one restores only SLOTSTREAM_OPT_SAMPLER_DRAW
PASS  explicit zero disables only SLOTSTREAM_OPT_OUTPUT_QUEUE
PASS  explicit one restores only SLOTSTREAM_OPT_OUTPUT_QUEUE
PASS  explicit zero disables only SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR
PASS  explicit one restores only SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR
PASS  explicit zero disables only SLOTSTREAM_OPT_COMPLETE_PROMPT
PASS  explicit one restores only SLOTSTREAM_OPT_COMPLETE_PROMPT
PASS  explicit zero disables only SLOTSTREAM_OPT_SHARED_ROPE
PASS  explicit one restores only SLOTSTREAM_OPT_SHARED_ROPE
PASS  explicit zero disables only SLOTSTREAM_OPT_FUSED_ROPE
PASS  explicit one restores only SLOTSTREAM_OPT_FUSED_ROPE
PASS  explicit zeros restore the complete reference inference family
PASS  explicit numeric zero disables inherited prefix retention
PASS  non-optimization environment leaves the family intact
PASS  selected defaults still reject invalid override ["SLOTSTREAM_OPT_COMPLETE_PROMPT": "false"]
PASS  selected defaults still reject invalid override ["SLOTSTREAM_OPT_TYPO": "0"]
PASS  valid inherited read scope retains its prerequisites
PASS  inherited scope rejects disabled prerequisite SLOTSTREAM_OPT_COMPACT_STATE
PASS  inherited scope rejects disabled prerequisite SLOTSTREAM_OPT_COMPACT_MTP
PASS  inherited scope rejects disabled prerequisite SLOTSTREAM_OPT_LAYER_WORKSPACE
PASS  inherited scope rejects disabled prerequisite SLOTSTREAM_OPT_INDEXER_TILES
PASS  inherited scope rejects disabled prerequisite SLOTSTREAM_OPT_PLE_TILES
PASS  scope can be disabled while retaining its other independent work
PASS  public environment function value keeps its signature and automatic default
PASS  typed override enables compaction
PASS  malformed override refused
PASS  unknown optimization refused
PASS  invalid read scope -1 refused
PASS  invalid read scope 1 refused
PASS  invalid read scope 16384 refused
PASS  invalid read scope bad refused
PASS  unbounded read scope refused
PASS  explicit workspace tile is recorded
PASS  unbounded workspace tile refused
PASS  terminal output needs no speculative draft
PASS  draft count fits remaining output
PASS  public depth cannot exceed recording cap
PASS  negative remaining output cannot underflow
PASS  prefix cache reaches its four-entry bound
PASS  an identical history replaces instead of duplicating an entry
PASS  a miss evicts before allocating a fifth state
PASS  a smaller live token ceiling evicts immediately
PASS  held GB includes fixed recurrent state
PASS  growing hit still reuses its state
PASS  growing hit reserves future state before allocation
PASS  huge reservation safely misses
PASS  huge reservation releases held state
PASS  capacity reservation still hits
PASS  capacity growth reserves bytes before reuse
PASS  saturated byte reservation evicts safely
PASS  identical bytes hash alike
PASS  different bytes do not
PASS  the same image at the same offset matches
PASS  a swapped image does not
PASS  an entry ending inside a run still matches that run
PASS  a text-only entry rejects a prompt with an image inside its range
PASS  an image beyond the entry's range is irrelevant to the match
PASS  a vision conversation is held, not discarded
PASS  the same ids with a different picture miss
PASS  the text-only splice never sees a vision entry
PASS  prefix splice chooses the longest retained extension
PASS  prefix splice is strict, not an identical-history match
PASS  prefix splice lookup does not consume the retained state
PASS  a disabled prefix cache offers no splice
PASS  shard listing works through a symlinked model dir
PASS  8.1 GB plan stays inside its target
PASS  10.0 GB plan stays inside its target
PASS  16.0 GB plan stays inside its target
PASS  30.0 GB plan stays inside its target
RUNTIME CHECK PASS
PASS  matching file is accepted
PASS  same-size corruption is rejected
PASS  exact Content-Range is accepted
PASS  wrong range start is rejected
PASS  wrong range total is rejected
PASS  unknown range total is rejected
PASS  every pinned file has a digest
PASS  the draft head is pinned as the one optional file
PASS  an absent optional file is not a repair; an absent required one is
PASS  an empty directory reads as missing
PASS  missing needs the required model
PASS  status carries free disk
PASS  bytesToFetch agrees with required files
PASS  a missing copy is not ready
PULL CHECK PASS
{"bf16_predictions":16711680,"centers":1000000,"roundtrips":60,"malformed_inputs":39583,"pass":true}
MANIFEST CHECKS PASS
{"name": "normal", "pass_": true, "seconds": 0.273, "returncode": 0}
{"name": "cache-miss-reporting", "pass_": true, "seconds": 0.028, "returncode": 0}
{"name": "redirect", "pass_": true, "seconds": 0.028, "returncode": 0}
{"name": "bad-object-fallback", "pass_": true, "seconds": 0.029, "returncode": 0}
{"name": "missing-object-raw-fallback", "pass_": true, "seconds": 0.034, "returncode": 0}
{"name": "raw-wrong-range-fails", "pass_": true, "seconds": 0.013, "returncode": 1}
{"name": "raw-ignored-range-fails", "pass_": true, "seconds": 0.012, "returncode": 1}
{"name": "optional-absent", "pass_": true, "seconds": 0.027, "returncode": 0}
{"name": "optional-corrupt-and-unavailable", "pass_": true, "seconds": 0.028, "returncode": 0}
{"name": "bad-object-fails", "pass_": true, "seconds": 0.013, "returncode": 1}
{"name": "retry-after", "pass_": true, "seconds": 0.029, "returncode": 0}
{"name": "hugging-face-rate-limit", "pass_": true, "seconds": 5.461, "returncode": 0}
{"name": "cancel-during-hugging-face-rate-limit", "pass_": true, "seconds": 0.514, "returncode": 1}
{"name": "transient-retry", "pass_": true, "seconds": 5.437, "returncode": 0}
{"name": "wrong-length-fallback", "pass_": true, "seconds": 11.167, "returncode": 0}
{"name": "short-body-fallback", "pass_": true, "seconds": 36.282, "returncode": 0}
{"name": "content-encoding-fallback", "pass_": true, "seconds": 36.169, "returncode": 0}
{"name": "cancel-preserves-progress", "pass_": true, "seconds": 1.497, "returncode": 1}
{"name": "damaged-resumed-chunk-rejected", "pass_": true, "seconds": 0.036, "returncode": 1}
{"name": "damaged-resumed-chunk-repair", "pass_": true, "seconds": 0.03, "returncode": 0}
{"name": "resume", "pass_": true, "seconds": 0.028, "returncode": 0}
{"name": "already-installed", "pass_": true, "seconds": 0.014, "returncode": 0}
{"name": "valid-symlinks-reused", "pass_": true, "seconds": 0.013, "returncode": 0}
{"name": "corruption-seed", "pass_": true, "seconds": 0.026, "returncode": 0}
{"name": "same-size-final-repair", "pass_": true, "seconds": 0.018, "returncode": 0}
{"name": "invalid-resume-map", "pass_": true, "seconds": 0.027, "returncode": 0}
{"name": "forged-complete-map-without-parts", "pass_": true, "seconds": 0.028, "returncode": 0}
{"name": "oversized-map-is-discarded", "pass_": true, "seconds": 0.029, "returncode": 0}
{"name": "part-symlink-rejected", "pass_": true, "seconds": 0.005, "returncode": 1}
{"name": "part-hardlink-rejected", "pass_": true, "seconds": 0.005, "returncode": 1}
{"name": "part-fifo-rejected", "pass_": true, "seconds": 0.005, "returncode": 1}
{"name": "concurrent-writer-rejected", "pass_": true, "seconds": 0.008, "returncode": 1}
ALL HTTP CHECKS PASS
{"name": "raw-multichunk", "pass_": true, "seconds": 0.781, "returncode": 0}
{"name": "raw-installed-no-http", "pass_": true, "seconds": 0.26, "returncode": 0}
{"name": "raw-source-fallback-missing", "pass_": true, "seconds": 0.342, "returncode": 0}
{"name": "raw-source-fallback-wrong-range", "pass_": true, "seconds": 0.347, "returncode": 0}
{"name": "raw-source-fallback-encoding", "pass_": true, "seconds": 40.807, "returncode": 0}
{"name": "raw-source-fallback-ignore-range", "pass_": true, "seconds": 0.347, "returncode": 0}
{"name": "raw-wrong-range-fails", "pass_": true, "seconds": 0.026, "returncode": 1}
{"name": "raw-corrupt-final-rejected", "pass_": true, "seconds": 0.184, "returncode": 1}
{"name": "raw-optional-inflight-writers", "pass_": true, "seconds": 0.215, "returncode": 0}
{"name": "raw-cancel", "pass_": true, "seconds": 3.285, "returncode": 1}
{"name": "raw-resume", "pass_": true, "seconds": 0.346, "returncode": 0}
{"name": "raw-same-size-repair", "pass_": true, "seconds": 0.476, "returncode": 0}
ALL RAW HTTP CHECKS PASS
SUSTAINED MEMORY PASS 337428480 bytes peak RSS
SLOTPACK GATES PASS
PASS  48GB pristine: 33.0 GB target and starts quiet
PASS  48GB busy: clamped to 15.4 GB, sized-down note
PASS  16GB pristine: 9.8 GB target, no notes
PASS  16GB busy: refuses an unphysical minimum allocation
PASS  8GB Mac: refuses an unphysical minimum allocation
PASS  128GB auto stops at the knee, not at 70% of RAM
PASS  128GB explains the memory it left on the table
PASS  128GB: --memory-gb still reaches full residency
PASS  --sim-ram alone plans instead of erroring
PASS  --max-ram-percent lowers the auto target
PASS  --max-ram-percent cannot exceed the knee
PASS  --max-ram-percent 0 refused
PASS  --max-ram-percent 150 refused
PASS  --max-ram-percent noted when outranked
PASS  more memory never plans slower (7-90 GB sweep)
PASS  explicit total target cannot authorize unavailable memory
PASS  --experts-per-layer 0 refused
PASS  --pool-gb 0 refused
PASS  --memory-gb below minimum refused
PASS  --memory-gb inf is a clean error
PASS  --pool-gb inf is a clean error
PASS  --pool-gb 1e300 saturates safely instead of trapping
PASS  --memory-gb 1e300 refuses physical overcommit without trapping
PASS  huge finite memory plan remains valid JSON
PASS  --sim-ram inf is a clean error
PASS  --sim-working-set inf is a clean error
PASS  --sim-available inf is a clean error
PASS  tiny pool raised to the floor, consistently
PASS  knob precedence noted, never silent
PASS  --model with no safetensors: clean error
PASS  --model with no safetensors: names the fix
PASS  MTP auto on a big quiet machine: knee + head = 34.6
PASS  MTP auto stays off on a 16GB machine
PASS  MTP auto on at --memory-gb 30 (137/layer after the charge)
PASS  MTP auto off at --memory-gb 20 (below the 120/layer floor)
PASS  --mtp on forces the head onto a small machine
PASS  --mtp off suppresses it everywhere
PASS  --mtp on without mtp.safetensors is a clean error
PASS  --mtp on cannot squeeze under the minimum target
PASS  --mtp gibberish refused
PASS  MTP charge visible in json peak
PASS  --model with unparseable config: clean error
PASS  invalid config arithmetic is rejected before it traps
PASS  --model with a corrupt safetensors header
PASS  safetensors dtype/shape byte mismatch rejected
PASS  safetensors header over 100MB rejected before allocation
PASS  --model with a different model's tensors
PASS  serve --max-context 0 refused before load
PASS  plan announces the context cap and the wait
PASS  doctor --json carries max_context_tokens + wait
PASS  serve --max-context above the ceiling names the ceiling, not a knob
PASS  doctor --max-context above the ceiling is the same clean error
PASS  a lower --max-context caps the reuse ceiling too
PASS  prefill-schedule: full model window obeys the product without exemptions
PASS  prefill-schedule agrees with the doctor wait for the same pass
PASS  prefill-schedule: a prefix hit reads only what is new
PASS  prefill-schedule --chunk 0 refused
PASS  context-check --tokens 4 refused before load
PASS  parity rejects an invalid layer count before model load
PASS  parity rejects malformed token ids without trapping
PASS  n-gram golden rejects malformed token ids without trapping
PASS  dequant golden rejects a negative row before model load
PASS  sampler golden rejects an empty vocabulary without trapping
PASS  sampler golden rejects a negative draw count without trapping
planner: passed 64, failed 0
INSTALLER GATES PASS
STATIC GATES PASS

````````````

## Artifact SHA-256 c3e105ac885288fec50c1d58ee45926e78fcc80fd7f4a2500cd5da28f4af49f5

Encoding: `utf-8`. Original bytes: 2690.

````````````text
{
  "captured_at": "2026-09-08T04:52:20.383371+00:00",
  "static_suite_passed": true,
  "elapsed_seconds": 294.05241725,
  "owned_groups": [
    68128
  ],
  "remaining_owned_members": [],
  "model_lock_free": true,
  "competing_jobs": [],
  "pressure": {
    "command": [
      "sysctl",
      "-n",
      "kern.memorystatus_vm_pressure_level"
    ],
    "level": 1,
    "name": "normal",
    "stdout": "1\n",
    "stderr": ""
  },
  "vm": {
    "page_bytes": 16384,
    "reclaimable_bytes": 16894885888,
    "swapins": 44130071,
    "swapouts": 77538158,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   474827.\nPages active:                                 770247.\nPages inactive:                               777144.\nPages speculative:                              1885.\nPages throttled:                                   0.\nPages wired down:                             240275.\nPages purgeable:                                5393.\n\"Translation faults\":                    16918279243.\nPages copy-on-write:                       878578417.\nPages zero filled:                       22684740283.\nPages reactivated:                        3738015596.\nPages purged:                               79219117.\nFile-backed pages:                            550962.\nAnonymous pages:                              998314.\nPages stored in compressor:                  1763319.\nPages occupied by compressor:                 820909.\nDecompressions:                           1279994915.\nCompressions:                             1603861706.\nPageins:                                  8071086638.\nPageouts:                                   11393819.\nSwapins:                                    44130071.\nSwapouts:                                   77538158.\nPages tagged:                                 177265.\nPages tagged resident:                        135116.\nPages tagged compressed:                       42149.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6969.\nPages tag-storage free:                          269.\nPages tag-storage non-tag pageable:            91058.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6827712.\nTagged compressions:                        12460432.\nTagged decompressions:                      11505239.\n"
  },
  "maximum_owned_rss_bytes": 1239728128,
  "minimum_reclaimable_bytes": 15609233408,
  "guard_swapouts_unchanged": true,
  "candidate_and_drivers_unchanged": true,
  "no_model_or_gpu_test": true,
  "no_additional_run_authorized": true
}

````````````
