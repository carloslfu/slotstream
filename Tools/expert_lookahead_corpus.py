#!/usr/bin/env python3
"""Public, reproducible prompt corpus for the Expert Lookahead experiment.

Every request belongs to a family: one source document, one problem
template or one authored conversation. Families, never single requests, are
assigned to the train, validation or test split, so paraphrases, excerpts of
the same document and variants of the same template never straddle a split.
The shuffle and the split are frozen with seed 1729; the manifest records the
resulting request IDs and prompt hashes, because the seed alone is not the
split.

Repository-derived prompts (code and documentation) are stored as references
to a git blob plus a byte range and a template, and materialized on demand;
each materialized prompt must match the SHA-256 the manifest recorded.
Authored prompts (arithmetic templates, multilingual paragraphs, structured
tasks and conversations) are stored inline. Nothing here reads private data.
"""
import argparse
import hashlib
import json
import random
import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
FIXTURES = ROOT / 'Tools/fixtures/expert-lookahead'
CORPUS_VERSION = 1
SPLIT_SEED = 1729
KINDS = ['code', 'reasoning', 'prose', 'multilingual', 'structured', 'dialogue']
# Estimated emitted outputs per request for planning only; actual counts are
# recorded by the collector. EOS usually arrives before the cap.
EXPECTED_OUTPUT_FRACTION = 0.7


def sha256_text(text):
    return hashlib.sha256(text.encode('utf-8')).hexdigest()


def git_blob(path):
    return subprocess.check_output(['git', 'rev-parse', f'HEAD:{path}'], cwd=ROOT, text=True).strip()


def git_head():
    return subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=ROOT, text=True).strip()


def line_cut(text, fraction):
    """Cut at the line boundary nearest to `fraction` of the text."""
    target = int(len(text) * fraction)
    cut = text.rfind('\n', 0, target)
    return text[: cut + 1] if cut > 0 else text[:target]


def excerpt(text, start_fraction, size):
    start = int(len(text) * start_fraction)
    start = text.rfind('\n', 0, start) + 1
    end = text.find('\n', min(len(text), start + size))
    return text[start: end + 1 if end >= 0 else len(text)]


MUTATIONS = [(' <= ', ' < '), (' >= ', ' > '), (' + 1', ' - 1'), (' == ', ' != '), (' && ', ' || '),
             ('max(', 'min('), ('return true', 'return false'), (' -= ', ' += '), ('.count', '.count + 1'),
             (' < ', ' <= '), ('!= 0', '== 0'), ('True', 'False')]


def inject_bug(text):
    for old, new in MUTATIONS:
        at = text.find(old)
        if at >= 0:
            return text[:at] + new + text[at + len(old):], old.strip(), new.strip()
    return None


# ---------------------------------------------------------------- code families

CODE_TEMPLATES = {
    'complete': ('Continue writing this {language} file from the exact point where the excerpt stops. '
                 'Respond with code only, no explanation, starting immediately with the next line of code.\n\n'
                 '```{fence}\n{body}```'),
    'fix': ('The following {language} code contains one bug that was introduced by a small edit. '
            'Respond with the corrected code only, as a fenced code block, with no prose before it.\n\n'
            '```{fence}\n{body}```'),
    'test': ('Write a focused unit test for the following {language} code. '
             'Respond with test code only, as a fenced code block, with no prose before it.\n\n'
             '```{fence}\n{body}```'),
}


def code_sources():
    files = sorted([*ROOT.glob('Sources/Slotstream/*.swift'), *ROOT.glob('Tools/*.py')])
    picked = []
    for f in files:
        size = f.stat().st_size
        if 1500 <= size <= 20000 and '_test' not in f.name:
            picked.append(f)
    return picked


def build_code_requests(rng):
    files = code_sources()
    rng.shuffle(files)
    requests = []
    for f in files[:30]:
        rel = str(f.relative_to(ROOT))
        text = f.read_text(encoding='utf-8')
        language = 'Swift' if f.suffix == '.swift' else 'Python'
        fence = 'swift' if f.suffix == '.swift' else 'python'
        family = 'code:' + rel
        blob = git_blob(rel)
        prefix = line_cut(text, rng.uniform(0.35, 0.6))
        requests.append(dict(family=family, kind='code', cap=256, language=language, fence=fence,
                             source=dict(path=rel, blob=blob, license='MIT'),
                             template='complete', span=[0, len(prefix.encode('utf-8'))]))
        middle = excerpt(text, rng.uniform(0.2, 0.5), rng.choice([1200, 2000, 3000]))
        mutated = inject_bug(middle)
        if mutated is not None:
            body, old, new = mutated
            start = text.find(middle)
            requests.append(dict(family=family, kind='code', cap=256, language=language, fence=fence,
                                 source=dict(path=rel, blob=blob, license='MIT'),
                                 template='fix', span=[len(text[:start].encode('utf-8')), len(text[:start].encode('utf-8')) + len(middle.encode('utf-8'))],
                                 mutation=[old, new]))
        tail = excerpt(text, rng.uniform(0.5, 0.75), rng.choice([900, 1500, 2400]))
        start = text.find(tail)
        requests.append(dict(family=family, kind='code', cap=256, language=language, fence=fence,
                             source=dict(path=rel, blob=blob, license='MIT'),
                             template='test', span=[len(text[:start].encode('utf-8')), len(text[:start].encode('utf-8')) + len(tail.encode('utf-8'))]))
    return requests


def materialize_code(request):
    path = ROOT / request['source']['path']
    data = path.read_bytes()
    lo, hi = request['span']
    body = data[lo:hi].decode('utf-8')
    if 'mutation' in request:
        old, new = request['mutation']
        # Reapply the exact first-occurrence mutation used when the manifest was frozen.
        for cand_old, cand_new in MUTATIONS:
            if cand_old.strip() == old and cand_new.strip() == new:
                at = body.find(cand_old)
                assert at >= 0, 'mutation site vanished'
                body = body[:at] + cand_new + body[at + len(cand_old):]
                break
    if not body.endswith('\n'):
        body += '\n'
    return CODE_TEMPLATES[request['template']].format(language=request['language'], fence=request['fence'], body=body)


# ---------------------------------------------------------- reasoning families

def reasoning_templates():
    def trains(r):
        a, b, c, d = r.randint(1, 11), r.choice([0, 15, 30, 45]), r.randint(2, 4), r.choice([5, 10, 20, 25, 35, 50])
        return (f'A train leaves the station at {a}:{b:02d} and travels {c} hours and {d} minutes. '
                f'It then waits 25 minutes and continues for another {r.randint(1, 3)} hours {r.choice([10, 20, 40])} minutes. '
                'At what time does the journey end? Show every step and end with one line "Answer: HH:MM".')

    def budget(r):
        rent, food, transport, income = r.randint(700, 1500), r.randint(250, 600), r.randint(60, 200), r.randint(2400, 4200)
        pct = r.choice([10, 15, 20, 25])
        return (f'Someone earns {income} a month. Rent is {rent}, food is {food}, transport is {transport}, '
                f'and they save {pct} percent of what remains after those three expenses. '
                'How much do they save each month, and how much is left after saving? Work it out step by step and end with "Answer: <saved>, <left>".')

    def conversion(r):
        km, kmh = r.randint(120, 980), r.choice([48, 60, 72, 90, 108])
        return (f'A cyclist covers {km} kilometers at an average speed of {kmh} km/h, resting 12 minutes every 2 hours of riding. '
                'How long does the whole trip take, including rests, in hours and minutes? Reason step by step and end with "Answer: H hours M minutes".')

    def modular(r):
        a, m = r.randint(200, 999), r.choice([7, 9, 11, 13])
        return (f'What is the remainder when {a} to the power of {r.randint(3, 6)} is divided by {m}? '
                'Use modular arithmetic step by step and end with one line "Answer: <remainder>".')

    def combinatorics(r):
        n, k = r.randint(7, 12), r.randint(2, 4)
        return (f'A committee of {k} people is chosen from {n} candidates, and two specific candidates refuse to serve together. '
                'How many valid committees are there? Show the counting argument and end with "Answer: <number>".')

    def percentages(r):
        price, up, down = r.randint(40, 400), r.choice([10, 15, 20, 25, 30]), r.choice([10, 15, 20, 25])
        return (f'A price of {price} is increased by {up} percent and then the new price is decreased by {down} percent. '
                'What is the final price and what single percentage change does that equal? Step by step; end with "Answer: <price>, <percent>".')

    def averages(r):
        scores = [r.randint(55, 98) for _ in range(5)]
        target = r.choice([80, 85, 88, 90])
        return (f'Five test scores are {", ".join(map(str, scores))}. What score is needed on a sixth test for the average of all six to reach {target}? '
                'Explain step by step and end with "Answer: <score>" (say if it is impossible above 100).')

    def work_rate(r):
        a, b = r.randint(3, 9), r.randint(4, 12)
        return (f'One pump fills a tank in {a} hours and a second pump fills it in {b} hours. '
                f'They run together for {r.randint(1, 2)} hours, then the first pump stops. How long does the second pump need to finish? '
                'Show the rate arithmetic and end with "Answer: <hours>".')

    def digits(r):
        n = r.randint(3, 6)
        return (f'How many {n}-digit positive integers have digits that strictly increase from left to right? '
                'Explain the reasoning and end with "Answer: <number>".')

    def sequences(r):
        a, d, n = r.randint(2, 15), r.randint(3, 9), r.randint(12, 40)
        return (f'An arithmetic sequence starts at {a} with common difference {d}. What is the sum of its first {n} terms, '
                'and which term first exceeds 200? Step by step; end with "Answer: <sum>, term <index>".')

    def logic(r):
        names = r.sample(['Ana', 'Bruno', 'Carla', 'Diego', 'Elena', 'Farid'], 3)
        return (f'{names[0]}, {names[1]} and {names[2]} each own exactly one pet: a cat, a dog or a parrot. '
                f'{names[0]} is allergic to fur. {names[1]} does not own the dog. Who owns which pet? '
                'Explain the deduction and end with "Answer: <name>: <pet>, <name>: <pet>, <name>: <pet>".')

    def geometry(r):
        w, h = r.randint(4, 20), r.randint(3, 15)
        return (f'A rectangle is {w} by {h}. A path of width 1 runs around the outside. What are the area and perimeter of the outer boundary, '
                'and what is the area of the path alone? Step by step; end with "Answer: <area>, <perimeter>, <path area>".')

    def probability(r):
        red, blue = r.randint(3, 9), r.randint(2, 8)
        return (f'A bag holds {red} red and {blue} blue marbles. Two are drawn without replacement. '
                'What is the probability that both are the same color? Give the exact fraction; end with "Answer: <fraction>".')

    def unit_price(r):
        packs = [(r.randint(2, 8), r.randint(150, 900)) for _ in range(3)]
        desc = '; '.join(f'{q} units for {p} cents' for q, p in packs)
        return (f'Three package sizes are offered: {desc}. Which is the cheapest per unit, and by how many cents per unit does it beat the most expensive? '
                'Step by step; end with "Answer: <package>, <difference>".')

    def clock_angle(r):
        h, m = r.randint(1, 12), r.choice([5, 10, 20, 25, 35, 40, 50, 55])
        return (f'What is the smaller angle between the hour and minute hands at {h}:{m:02d}? Show the computation and end with "Answer: <degrees>".')

    def compound(r):
        p, rate, years = r.choice([1000, 2500, 4000, 8000]), r.choice([3, 4, 5, 6]), r.randint(2, 5)
        return (f'An amount of {p} grows at {rate} percent per year, compounded annually, for {years} years. '
                'What is the final amount, rounded to the nearest whole unit? Show each year; end with "Answer: <amount>".')

    def diophantine(r):
        a, b, c = r.choice([3, 5, 7]), r.choice([4, 8, 11]), r.randint(40, 120)
        return (f'Find all non-negative integer solutions of {a}x + {b}y = {c}. Explain the search and end with "Answer: <list of (x, y)>".')

    def scheduling(r):
        tasks = [(t, r.randint(1, 6)) for t in ['A', 'B', 'C', 'D']]
        desc = ', '.join(f'{t} takes {d} hours' for t, d in tasks)
        return (f'Four tasks must run on one machine: {desc}. B must run after A, and D after C. '
                'What order minimizes the average completion time, and what is that average? Reason step by step; end with "Answer: <order>, <average>".')

    def primes(r):
        lo = r.choice([100, 200, 300, 500])
        return (f'List the prime numbers between {lo} and {lo + 40}, then give their sum. Show how each candidate is tested; end with "Answer: <sum>".')

    def base_conversion(r):
        n, base = r.randint(200, 2000), r.choice([2, 3, 5, 7, 16])
        return (f'Convert {n} to base {base}, then add 1 in that base and convert back to decimal to check. Step by step; end with "Answer: <base-{base} digits>".')

    return [trains, budget, conversion, modular, combinatorics, percentages, averages, work_rate, digits, sequences,
            logic, geometry, probability, unit_price, clock_angle, compound, diophantine, scheduling, primes, base_conversion]


def build_reasoning_requests(rng):
    requests = []
    for template in reasoning_templates():
        family = 'reasoning:' + template.__name__
        for variant in range(4):
            text = template(random.Random(SPLIT_SEED * 1000 + hash(template.__name__) % 997 + variant))
            requests.append(dict(family=family, kind='reasoning', cap=256, messages=[dict(role='user', content=text)],
                                 provenance='authored template, seeded numbers'))
    return requests


# ---------------------------------------------------------------- prose families

PROSE_TEMPLATES = {
    'summarize': 'Summarize the following documentation excerpt in four to six sentences for someone who has never used the tool.\n\n{body}',
    'rewrite': 'Rewrite the following excerpt as a short plain-language explanation for a newcomer, keeping every technical fact intact.\n\n{body}',
    'questions': ('Read the excerpt, then answer these three questions in complete sentences: (1) What problem does it address? '
                  '(2) What is the one number or rule a reader must remember? (3) What would go wrong if the advice were ignored?\n\n{body}'),
    'long-summary': 'Write a one-paragraph summary of the following document. Mention the three most important decisions it records.\n\n{body}',
}


def build_prose_requests(rng):
    docs = ['README.md'] + sorted(str(p.relative_to(ROOT)) for p in ROOT.glob('docs/*.md')) + ['CONTRIBUTING.md']
    requests = []
    for rel in docs:
        text = (ROOT / rel).read_text(encoding='utf-8')
        data = text.encode('utf-8')
        blob = git_blob(rel)
        family = 'prose:' + rel
        for template in ['summarize', 'rewrite', 'questions']:
            size = rng.choice([1800, 3000, 5000, 8000])
            start = rng.uniform(0.0, 0.5)
            body = excerpt(text, start, size)
            lo = len(text[: text.find(body)].encode('utf-8'))
            requests.append(dict(family=family, kind='prose', cap=256 if template != 'rewrite' else 128,
                                 source=dict(path=rel, blob=blob, license='MIT'), template=template,
                                 span=[lo, lo + len(body.encode('utf-8'))]))
        if len(data) > 12000:
            requests.append(dict(family=family, kind='prose', cap=128, source=dict(path=rel, blob=blob, license='MIT'),
                                 template='long-summary', span=[0, min(len(data), 24000)]))
    # Long-document stratum: two families of concatenated public documents.
    long_docs = [['CHANGELOG.md'], ['docs/TESTING.md', 'docs/ENGINEERING.md']]
    for group in long_docs:
        family = 'prose-long:' + '+'.join(group)
        for cap_bytes in [16000, 22000, 28000]:
            requests.append(dict(family=family, kind='prose', cap=128, template='long-summary', long=True,
                                 sources=[dict(path=p, blob=git_blob(p), license='MIT') for p in group], byte_limit=cap_bytes))
    return requests


def materialize_prose(request):
    if request.get('long'):
        parts = []
        for source in request['sources']:
            parts.append((ROOT / source['path']).read_text(encoding='utf-8'))
        body = '\n\n'.join(parts).encode('utf-8')[: request['byte_limit']].decode('utf-8', errors='ignore')
        return PROSE_TEMPLATES['long-summary'].format(body=body)
    data = (ROOT / request['source']['path']).read_bytes()
    lo, hi = request['span']
    body = data[lo:hi].decode('utf-8', errors='ignore')
    return PROSE_TEMPLATES[request['template']].format(body=body)


# --------------------------------------------------------- multilingual families

MULTILINGUAL = {
    'es-mercado': ('Spanish', 'El mercado del pueblo abre cada sábado antes del amanecer. Los agricultores llegan con camionetas cargadas de tomates, '
                   'plátanos y café recién tostado, y las primeras compradoras son las cocineras de los restaurantes del centro, que eligen '
                   'los productos con una atención que parece casi ceremonial. Hacia las nueve la plaza se llena de familias, de músicos que '
                   'tocan por monedas y de vendedores de jugo de caña. El alcalde quiso trasladar el mercado a un edificio techado, pero los '
                   'comerciantes se negaron: dicen que la sombra de los árboles conserva mejor la fruta que cualquier techo de zinc, y que un '
                   'mercado sin cielo pierde a sus clientes. Al mediodía, cuando el calor aprieta, lo que no se vendió se reparte entre los '
                   'vecinos más ancianos, una costumbre que nadie recuerda haber decidido y que todos cumplen.'),
    'fr-bibliotheque': ('French', 'La bibliothèque municipale a rouvert après deux ans de travaux. Les architectes ont conservé la façade de brique '
                        'mais ont remplacé les rayonnages sombres par de grandes étagères basses, si bien que la lumière traverse maintenant '
                        'toute la salle de lecture. Les habitués se plaignent du bruit, car les enfants ont désormais un espace de jeu près de '
                        'l\'entrée, tandis que les étudiants apprécient les nouvelles prises électriques et le silence relatif de l\'étage. '
                        'La directrice explique que le budget a été dépassé de douze pour cent à cause de la découverte d\'une cave inondée, '
                        'et que les horaires du dimanche seront réduits jusqu\'au printemps. Malgré tout, le nombre d\'inscriptions a doublé '
                        'en trois mois, et la ville étudie déjà l\'ouverture d\'une annexe dans le quartier de la gare.'),
    'de-werkstatt': ('German', 'Die Werkstatt liegt am Ende einer schmalen Gasse, und wer sie zum ersten Mal betritt, bemerkt zuerst den Geruch '
                     'von Leinöl und altem Holz. Der Tischler arbeitet seit vierzig Jahren dort und repariert vor allem Stühle, die andere '
                     'längst weggeworfen hätten. Er sagt, dass ein guter Stuhl dreimal so lange lebt wie sein Besitzer, wenn man die Leimfugen '
                     'alle zwanzig Jahre erneuert. Seine Tochter hat inzwischen die Buchhaltung übernommen und eine kleine Webseite eingerichtet, '
                     'über die Kunden Fotos ihrer kaputten Möbel schicken können. Seitdem kommen Aufträge aus der ganzen Region, und die '
                     'Wartezeit beträgt mittlerweile drei Monate. Der Tischler findet das übertrieben, arbeitet aber weiterhin nur bis '
                     'siebzehn Uhr, weil danach das Licht in der Werkstatt schlecht wird.'),
    'pt-farol': ('Portuguese', 'O farol da ponta norte deixou de ter faroleiro em 1998, mas a casa ao lado nunca ficou vazia. Primeiro serviu de '
                 'posto de observação de aves, depois de estúdio para uma pintora que passou ali três invernos, e hoje funciona como '
                 'pequeno museu da vida marítima da vila. As crianças da escola visitam-no todos os anos e sobem os cento e doze degraus '
                 'até à lanterna, onde um mecanismo de relojoaria ainda funciona embora a luz seja agora elétrica. A câmara municipal '
                 'discute há anos se deve pintar a torre de branco, como era originalmente, ou manter as riscas vermelhas que os pescadores '
                 'usam como referência. Nas noites de nevoeiro, a sirene continua a soar a cada trinta segundos, e ninguém na vila consegue '
                 'dormir sem ela.'),
    'it-vigna': ('Italian', 'La vigna sulla collina appartiene alla stessa famiglia da cinque generazioni, e ogni generazione ha cambiato '
                 'qualcosa. Il bisnonno piantò i filari in direzione nord-sud, il nonno costruì la cantina scavando nel tufo, il padre '
                 'introdusse le botti di rovere francese e la figlia, che ha studiato enologia a Bordeaux, ha ridotto la produzione di un '
                 'terzo per migliorare la qualità. I vicini pensavano che fosse una follia, ma il vino ha vinto due premi in tre anni e '
                 'ora si vende soprattutto all\'estero. La famiglia continua però a vendemmiare a mano con l\'aiuto degli amici del paese, '
                 'che vengono pagati con una cena lunga fino a notte e una cassa di bottiglie a testa.'),
    'zh-茶馆': ('Chinese', '老街尽头的茶馆已经开了六十多年，木门上的漆掉了好几层，可是每天早上六点，第一壶水准时烧开。老板娘从母亲手里接过茶馆时，'
               '曾想把它改成咖啡店，后来发现来喝茶的人并不是为了茶，而是为了坐在同一张桌子旁听彼此说话。退休的老师在这里下棋，'
               '送快递的年轻人在这里躲雨，附近工地的工人在这里吃自己带来的午饭，只要一壶茶的钱。去年街道改造，茶馆差点被拆，'
               '是几十位老顾客写信给区里，才把它留了下来。现在墙上多了一块牌子，写着历史建筑，老板娘却说，牌子没有用，人在，茶馆才在。'),
    'ja-駅前': ('Japanese', '駅前の小さな本屋は、今年で創業七十年になる。三代目の店主は、大型書店とネット通販に押されて売り上げが落ちる中で、'
                '店の半分を古本と地元の作家の本に切り替えた。毎月最後の金曜日には、店の奥で朗読会が開かれ、二十人ほどの常連が集まる。'
                '店主は、本を売ることよりも、本について話す場所を守ることが自分の仕事だと言う。近くの高校の生徒たちは、放課後に'
                '参考書を立ち読みしに来るが、店主は決して注意しない。代わりに、学期の終わりに一冊だけ好きな本を安く売る。'
                'この習慣が、卒業生を何年経っても店に呼び戻している。'),
    'nl-polder': ('Dutch', 'De polder ten zuiden van het dorp werd in 1632 drooggelegd, en de molens die het water wegpompten staan er nog '
                  'steeds, hoewel ze al een eeuw niet meer draaien. Tegenwoordig doet een elektrisch gemaal het werk, onopvallend en '
                  'zonder geluid, en de molens zijn woningen geworden voor mensen die bereid zijn om trappen te klimmen. Het waterschap '
                  'wil het peil met tien centimeter verhogen om de veenbodem te beschermen, maar de boeren vrezen voor hun weilanden. '
                  'Op de jaarlijkse vergadering in het dorpshuis duurde de discussie tot middernacht en werd er niets besloten. '
                  'Intussen zakt de grond elk jaar een paar millimeter, en de oudste inwoner van het dorp zegt dat hij de kerktoren '
                  'in zijn jeugd hoger heeft zien staan.'),
}

MULTILINGUAL_TASKS = [
    ('translate', 'Translate the following {language} text into natural English. Respond with the translation only.\n\n{body}', 256),
    ('summarize', 'Summarize the following text in three sentences, writing your summary in {language}.\n\n{body}', 128),
    ('question', 'Read the following {language} text and answer in {language}: what is the one decision or change the text describes, and who disagrees with it?\n\n{body}', 128),
]


def build_multilingual_requests():
    requests = []
    for key, (language, body) in MULTILINGUAL.items():
        family = 'multilingual:' + key
        for name, template, cap in MULTILINGUAL_TASKS:
            content = template.format(language=language, body=body)
            requests.append(dict(family=family, kind='multilingual', cap=cap, messages=[dict(role='user', content=content)],
                                 provenance='authored paragraph, CC0'))
    return requests


# ----------------------------------------------------------- structured families

STRUCTURED = {
    'inventory': {
        'schema': {'type': 'object', 'required': ['sku', 'name', 'quantity', 'unit_price_cents', 'tags'],
                   'properties': {'sku': {'type': 'string', 'pattern': '^[A-Z]{3}-[0-9]{4}$'}, 'name': {'type': 'string'},
                                  'quantity': {'type': 'integer', 'minimum': 0}, 'unit_price_cents': {'type': 'integer'},
                                  'tags': {'type': 'array', 'items': {'type': 'string'}, 'maxItems': 4}}},
        'csv': 'sku,name,quantity,unit_price_cents\nABC-1001,steel bracket,240,375\nABC-1002,brass hinge,80,1290\nXYZ-2210,oak shelf 90cm,12,4599\nXYZ-2211,oak shelf 120cm,7,5899\n',
    },
    'weather': {
        'schema': {'type': 'object', 'required': ['station', 'date', 'readings'],
                   'properties': {'station': {'type': 'string'}, 'date': {'type': 'string', 'format': 'date'},
                                  'readings': {'type': 'array', 'items': {'type': 'object', 'required': ['hour', 'temp_c', 'humidity'],
                                                                           'properties': {'hour': {'type': 'integer'}, 'temp_c': {'type': 'number'}, 'humidity': {'type': 'integer'}}}}}},
        'csv': 'hour,temp_c,humidity\n0,14.2,88\n6,12.9,91\n12,21.4,55\n18,18.7,63\n',
    },
    'orders': {
        'schema': {'type': 'object', 'required': ['order_id', 'customer', 'lines', 'total_cents'],
                   'properties': {'order_id': {'type': 'string'}, 'customer': {'type': 'object', 'required': ['name', 'country']},
                                  'lines': {'type': 'array', 'items': {'type': 'object', 'required': ['sku', 'qty', 'price_cents']}},
                                  'total_cents': {'type': 'integer'}}},
        'csv': 'order_id,customer,country,sku,qty,price_cents\nO-77,Marta Ruiz,ES,ABC-1001,3,375\nO-77,Marta Ruiz,ES,XYZ-2210,1,4599\nO-78,Ken Ito,JP,ABC-1002,10,1290\n',
    },
    'sensors': {
        'schema': {'type': 'object', 'required': ['device', 'firmware', 'alerts'],
                   'properties': {'device': {'type': 'string'}, 'firmware': {'type': 'string', 'pattern': '^[0-9]+\\.[0-9]+\\.[0-9]+$'},
                                  'alerts': {'type': 'array', 'items': {'type': 'object', 'required': ['code', 'severity', 'message'],
                                                                         'properties': {'severity': {'enum': ['info', 'warning', 'critical']}}}}}},
        'csv': 'code,severity,message\nE102,warning,battery below 20 percent\nE311,critical,temperature sensor disconnected\nI005,info,firmware check complete\n',
    },
    'library': {
        'schema': {'type': 'object', 'required': ['isbn', 'title', 'authors', 'year', 'available'],
                   'properties': {'isbn': {'type': 'string'}, 'title': {'type': 'string'}, 'authors': {'type': 'array', 'items': {'type': 'string'}},
                                  'year': {'type': 'integer', 'minimum': 1450}, 'available': {'type': 'boolean'}}},
        'csv': 'isbn,title,authors,year,available\n9780140449136,The Odyssey,Homer;Emily Wilson,2018,true\n9780262035613,Deep Learning,Ian Goodfellow;Yoshua Bengio;Aaron Courville,2016,false\n',
    },
    'flights': {
        'schema': {'type': 'object', 'required': ['flight', 'from', 'to', 'departure', 'arrival', 'status'],
                   'properties': {'status': {'enum': ['scheduled', 'boarding', 'departed', 'landed', 'cancelled']}}},
        'csv': 'flight,from,to,departure,arrival,status\nAV9342,BOG,MAD,2026-10-02T22:15,2026-10-03T14:05,scheduled\nLA4110,CLO,BOG,2026-10-02T06:40,2026-10-02T07:45,boarding\n',
    },
    'recipes': {
        'schema': {'type': 'object', 'required': ['name', 'servings', 'ingredients', 'steps'],
                   'properties': {'ingredients': {'type': 'array', 'items': {'type': 'object', 'required': ['item', 'amount', 'unit']}},
                                  'steps': {'type': 'array', 'items': {'type': 'string'}}}},
        'csv': 'item,amount,unit\nrice,400,g\nchicken thighs,600,g\nonion,1,piece\nsaffron,0.5,g\nolive oil,3,tbsp\n',
    },
    'employees': {
        'schema': {'type': 'object', 'required': ['team', 'members'],
                   'properties': {'members': {'type': 'array', 'items': {'type': 'object', 'required': ['name', 'role', 'start_date', 'remote']}}}},
        'csv': 'name,role,start_date,remote\nPriya Nair,engineer,2023-04-10,true\nTom√°s Vega,designer,2021-11-01,false\nLena Kova,manager,2019-06-17,true\n'.replace('√°', 'á'),
    },
    'config': {
        'schema': {'type': 'object', 'required': ['service', 'port', 'replicas', 'env', 'limits'],
                   'properties': {'port': {'type': 'integer', 'minimum': 1024}, 'replicas': {'type': 'integer'},
                                  'env': {'type': 'object'}, 'limits': {'type': 'object', 'required': ['cpu', 'memory']}}},
        'csv': 'key,value\nservice,search-api\nport,8081\nreplicas,3\nLOG_LEVEL,info\nCACHE_TTL,300\ncpu,500m\nmemory,512Mi\n',
    },
    'invoices': {
        'schema': {'type': 'object', 'required': ['invoice', 'issued', 'due', 'items', 'tax_rate', 'total'],
                   'properties': {'items': {'type': 'array', 'items': {'type': 'object', 'required': ['description', 'hours', 'rate']}}}},
        'csv': 'description,hours,rate\nAPI integration,12,95\nCode review,3.5,95\nOn-site workshop,6,120\n',
    },
}

STRUCTURED_TASKS = [
    ('from-csv', 'Convert this CSV data into a single JSON object that satisfies the JSON schema below. Respond with the JSON only.\n\nCSV:\n{csv}\nSchema:\n{schema}', 256),
    ('to-yaml', 'Rewrite the following JSON schema as an equivalent YAML document with a two-line comment above each top-level property explaining it. Respond with YAML only.\n\n{schema}', 256),
    ('validate', 'Here is a JSON schema and a CSV export. List every row that would fail validation against the schema after a straightforward conversion, and say which rule each one breaks. Answer as a numbered list.\n\nSchema:\n{schema}\nCSV:\n{csv}', 128),
]


def build_structured_requests():
    requests = []
    for key, spec in STRUCTURED.items():
        family = 'structured:' + key
        schema = json.dumps(spec['schema'], indent=2)
        for name, template, cap in STRUCTURED_TASKS:
            content = template.format(csv=spec['csv'], schema=schema)
            requests.append(dict(family=family, kind='structured', cap=cap, messages=[dict(role='user', content=content)],
                                 provenance='authored schema and data, CC0'))
    return requests


# ------------------------------------------------------------- dialogue families

DIALOGUES = {
    'bike-repair': [('system', 'You are a patient bicycle mechanic who explains repairs step by step.'),
                    ('user', 'My rear brake squeals every time I stop, and it started after I rode in the rain last week.'),
                    ('assistant', 'Squealing after rain usually means grit on the rim or pads, or pads that are glazed. Clean the rim with rubbing alcohol first, then look at the pad surface for a shiny layer.'),
                    ('user', ['I cleaned the rim and the pads look shiny. What now?', 'The pads are worn down to the line. Can I ride to the shop?', 'It still squeals. Could the wheel be out of true?'])],
    'garden': [('system', 'You are a gardening advisor for small urban balconies.'),
               ('user', 'I have a north-facing balcony in a cool climate and want to grow herbs.'),
               ('assistant', 'North-facing means little direct sun, so choose herbs that tolerate shade: mint, parsley, chives and lemon balm do well. Basil will struggle.'),
               ('user', ['How often should I water them in autumn?', 'Can I keep them alive through winter indoors?', 'The mint is taking over the parsley pot. Should I separate them?'])],
    'travel': [('system', 'You are a travel planner who gives concrete, budget-aware advice.'),
               ('user', 'Three days in Lisbon in November, on a modest budget, and I dislike crowds.'),
               ('assistant', 'November is quiet and mild. Base yourself near Graça or Campo de Ourique rather than Baixa, use the transit day pass, and plan mornings for popular sights before the tour groups arrive.'),
               ('user', ['Give me a day-by-day outline with rough costs.', 'Is a day trip to Sintra worth it in November?', 'What should I eat that will not blow the budget?'])],
    'study': [('system', 'You are a study coach who designs realistic schedules.'),
              ('user', 'I have four weeks to prepare for a statistics exam while working full time.'),
              ('assistant', 'With full-time work, plan on about ninety minutes on weekday evenings and one longer block each weekend. The first two weeks rebuild fundamentals, the last two are practice exams and review.'),
              ('user', ['Break week one into daily topics for me.', 'I keep forgetting formulas. What memorization method works?', 'How do I know if I am ready a week before the exam?'])],
    'kitchen': [('system', 'You are a cooking teacher who adapts recipes to what people have on hand.'),
                ('user', 'I have rice, eggs, half an onion, soy sauce and some frozen peas. Dinner ideas?'),
                ('assistant', 'That is a fried rice night. Cook the rice ahead if you can so it dries a little, scramble the eggs first and set them aside, then fry the onion, add rice and peas, and finish with soy sauce and the eggs.'),
                ('user', ['I only have fresh rice just cooked. Does that matter?', 'Can I add a fried egg on top instead?', 'How do I stop it sticking to a stainless pan?'])],
    'finance': [('system', 'You are a personal finance educator. You explain concepts and never give individualized investment advice.'),
                ('user', 'What is the difference between an emergency fund and general savings?'),
                ('assistant', 'An emergency fund covers unplanned essentials, such as a job loss or a medical bill, and stays liquid and untouched otherwise. General savings are for planned goals and can take more risk or be spent.'),
                ('user', ['How many months of expenses is typical for an emergency fund?', 'Where should an emergency fund be kept?', 'What counts as an emergency and what does not?'])],
    'writing': [('system', 'You are an editor who improves clarity without changing the author\'s voice.'),
                ('user', 'Here is my opening sentence: "In today\'s fast-paced world, communication is more important than ever before in history." Thoughts?'),
                ('assistant', 'It is a placeholder sentence: every clause is generic. Start with the specific situation your piece is about, and let the reader infer the importance.'),
                ('user', ['The piece is about hospital handovers between shifts. Suggest three openings.', 'Can you explain what makes a sentence generic?', 'Rewrite my sentence keeping the word communication.'])],
    'debugging': [('system', 'You are a senior engineer helping a junior developer debug.'),
                  ('user', 'My web server returns 502 errors randomly, about once every hundred requests.'),
                  ('assistant', 'Intermittent 502s usually mean the upstream sometimes closes the connection or times out. Check upstream logs for restarts, compare timeouts on the proxy and the app, and look for keep-alive mismatches.'),
                  ('user', ['The app restarts every few minutes because of memory. How do I find the leak?', 'The proxy timeout is 30 seconds and the app timeout is 60. Which should change?', 'How would I reproduce this locally?'])],
    'history': [('system', 'You are a history tutor who answers with dates and sources when possible.'),
                ('user', 'Why did the printing press spread so quickly in fifteenth-century Europe?'),
                ('assistant', 'Movable type met a market that already existed: universities, merchants and churches wanted copies, paper had become affordable, and cities with capital and trade routes could fund presses.'),
                ('user', ['Which cities had presses by 1480?', 'How did it change the price of a book?', 'Did anything similar happen earlier in Asia?'])],
    'fitness': [('system', 'You are a running coach for beginners.'),
                ('user', 'I can run ten minutes without stopping and want to reach five kilometers.'),
                ('assistant', 'Use run-walk intervals three times a week, adding one minute of running per session, and keep one easy walk day. Most beginners reach five kilometers in eight to ten weeks.'),
                ('user', ['Write out the first three weeks.', 'My shins hurt after the second week. Should I stop?', 'How fast should the running intervals be?'])],
}


def build_dialogue_requests():
    requests = []
    for key, turns in DIALOGUES.items():
        family = 'dialogue:' + key
        base = [dict(role=r, content=c) for r, c in turns[:-1]]
        last_role, variants = turns[-1]
        for i, content in enumerate(variants):
            messages = base + [dict(role=last_role, content=content)]
            requests.append(dict(family=family, kind='dialogue', cap=256 if i == 0 else 128, messages=messages,
                                 provenance='authored conversation, CC0'))
    return requests


# ---------------------------------------------------------------- assembly

def materialize(request):
    """Return the chat messages for a request, verified against the manifest hash when present."""
    if 'messages' in request:
        messages = request['messages']
    elif request['kind'] == 'code':
        messages = [dict(role='user', content=materialize_code(request))]
    elif request['kind'] == 'prose':
        messages = [dict(role='user', content=materialize_prose(request))]
    else:
        raise ValueError('unknown request kind')
    digest = sha256_text(json.dumps(messages, ensure_ascii=False, sort_keys=True))
    if 'prompt_sha256' in request and request['prompt_sha256'] != digest:
        raise ValueError(f"prompt {request['id']} does not match its frozen hash")
    return messages


def split_families(requests, rng):
    """Stratified by kind: shuffle each kind's families, then cut 10/10/80 by
    family count, so every kind is represented in the sealed test set."""
    by_kind = {}
    for r in requests:
        by_kind.setdefault(r['kind'], {}).setdefault(r['family'], []).append(r)
    assignment = {}
    for kind in KINDS:
        families = sorted(by_kind.get(kind, {}))
        rng.shuffle(families)
        n = len(families)
        n_test = max(1, round(n * 0.1))
        n_val = max(1, round(n * 0.1))
        for i, family in enumerate(families):
            assignment[family] = 'test' if i < n_test else 'validation' if i < n_test + n_val else 'train'
    return assignment


def build_manifest():
    rng = random.Random(SPLIT_SEED)
    requests = (build_code_requests(random.Random(SPLIT_SEED + 1)) + build_reasoning_requests(rng)
                + build_prose_requests(random.Random(SPLIT_SEED + 2)) + build_multilingual_requests()
                + build_structured_requests() + build_dialogue_requests())
    assignment = split_families(requests, random.Random(SPLIT_SEED + 3))
    tokenizer = None
    try:
        from tokenizers import Tokenizer
        tokenizer = Tokenizer.from_file(str(Path.home() / '.slotstream/models/qwen38-flash-next-mlx-4bit/tokenizer.json'))
    except Exception:  # noqa: BLE001 - token estimates are optional planning data
        tokenizer = None
    ordered = []
    for i, r in enumerate(requests):
        r = dict(r)
        r['id'] = f"r{i:04d}"
        r['split'] = assignment[r['family']]
        messages = materialize(r)
        r['prompt_sha256'] = sha256_text(json.dumps(messages, ensure_ascii=False, sort_keys=True))
        text = '\n'.join(m['content'] for m in messages)
        r['prompt_chars'] = len(text)
        if tokenizer is not None:
            r['prompt_tokens_estimate'] = len(tokenizer.encode(text).ids)
        r['expected_outputs'] = int(round(r['cap'] * EXPECTED_OUTPUT_FRACTION))
        ordered.append(r)
    families = sorted({r['family'] for r in ordered})
    return dict(version=CORPUS_VERSION, seed=SPLIT_SEED, git_head=git_head(), kinds=KINDS,
                family_count=len(families), request_count=len(ordered),
                split_counts={s: sum(1 for r in ordered if r['split'] == s) for s in ['train', 'validation', 'test']},
                expected_outputs={s: sum(r['expected_outputs'] for r in ordered if r['split'] == s) for s in ['train', 'validation', 'test']},
                families={f: assignment[f] for f in families}, requests=ordered)


def select_pilot(manifest, rng, train_target=8000, validation_target=2000):
    """Stratified pilot draw from the frozen train and validation splits."""
    picks = []
    for split, target in [('train', train_target), ('validation', validation_target)]:
        pool = [r for r in manifest['requests'] if r['split'] == split]
        by_kind = {k: [r for r in pool if r['kind'] == k] for k in KINDS}
        for rows in by_kind.values():
            rng.shuffle(rows)
        total = 0
        cursors = {k: 0 for k in KINDS}
        while total < target:
            progressed = False
            for kind in KINDS:
                rows = by_kind[kind]
                if cursors[kind] < len(rows):
                    r = rows[cursors[kind]]
                    cursors[kind] += 1
                    picks.append(r['id'])
                    total += r['expected_outputs']
                    progressed = True
                    if total >= target:
                        break
            if not progressed:
                break
    return picks


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    sub = parser.add_subparsers(dest='command', required=True)
    freeze = sub.add_parser('freeze', help='Build and freeze the manifest')
    freeze.add_argument('--out', type=Path, default=FIXTURES / 'corpus.json')
    show = sub.add_parser('materialize', help='Print one request as chat messages JSON')
    show.add_argument('--manifest', type=Path, default=FIXTURES / 'corpus.json')
    show.add_argument('--id', required=True)
    verify = sub.add_parser('verify', help='Re-materialize every prompt and check its frozen hash')
    verify.add_argument('--manifest', type=Path, default=FIXTURES / 'corpus.json')
    pilot = sub.add_parser('pilot', help='Print the stratified pilot request IDs')
    pilot.add_argument('--manifest', type=Path, default=FIXTURES / 'corpus.json')
    a = parser.parse_args()
    if a.command == 'freeze':
        manifest = build_manifest()
        a.out.parent.mkdir(parents=True, exist_ok=True)
        a.out.write_text(json.dumps(manifest, indent=1, ensure_ascii=False) + '\n')
        print(json.dumps({k: v for k, v in manifest.items() if k not in ('requests', 'families')}, indent=2))
        return 0
    manifest = json.loads(a.manifest.read_text())
    if a.command == 'materialize':
        request = next(r for r in manifest['requests'] if r['id'] == a.id)
        print(json.dumps(materialize(request), ensure_ascii=False, indent=1))
        return 0
    if a.command == 'verify':
        for request in manifest['requests']:
            materialize(request)
        print(json.dumps({'verified': len(manifest['requests'])}))
        return 0
    if a.command == 'pilot':
        print(json.dumps(select_pilot(manifest, random.Random(SPLIT_SEED + 4))))
        return 0
    return 1


if __name__ == '__main__':
    sys.exit(main())
