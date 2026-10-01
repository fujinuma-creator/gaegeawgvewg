#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Rebuild the TopicSeed raw block in SeedData.swift from tools/topics/*.txt.

Source format (one topic after another, blank lines ignored):
    T|emoji|title|category|key1, key2, ...
    S|                      <- section break (the --- in the source text)
    A|English line|日本語訳
    B|English line|日本語訳

Every file in this directory is read in name order, validated, and written
into the Swift seed as tab-separated rows. Run from anywhere:
    python3 tools/topics/build.py
"""
import glob
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(os.path.dirname(HERE))
SWIFT = os.path.join(ROOT, "EnglishVocabApp", "EnglishVocabApp", "SeedData.swift")

MIN_LINES = 12
MIN_SECTIONS = 2


def fail(msg):
    print("ERROR:", msg)
    sys.exit(1)


def parse_file(path):
    topics = []
    cur = None
    with open(path, encoding="utf-8") as fh:
        for n, raw in enumerate(fh, 1):
            ln = raw.rstrip("\n").rstrip()
            if not ln:
                continue
            where = f"{os.path.basename(path)}:{n}"
            if "\t" in ln:
                fail(f"{where}: tab character in line")
            if '"""#' in ln:
                fail(f"{where}: raw-string terminator in line")
            if "**" in ln:
                fail(f"{where}: markdown bold in line")
            f = ln.split("|")
            k = f[0]
            if k == "T":
                if len(f) != 5:
                    fail(f"{where}: T needs 5 fields, got {len(f)}")
                cur = {"emoji": f[1], "title": f[2], "cat": f[3], "keys": f[4],
                       "sections": [], "where": where}
                topics.append(cur)
            elif k == "S":
                if cur is None:
                    fail(f"{where}: S before any T")
                cur["sections"].append([])
            elif k in ("A", "B"):
                if cur is None:
                    fail(f"{where}: line before any T")
                if len(f) != 3:
                    fail(f"{where}: dialogue line needs 3 fields, got {len(f)}")
                if not f[1].strip() or not f[2].strip():
                    fail(f"{where}: empty English or Japanese")
                if not cur["sections"]:
                    cur["sections"].append([])
                cur["sections"][-1].append((k, f[1].strip(), f[2].strip()))
            else:
                fail(f"{where}: unknown row type {k!r}")
    return topics


def validate(topics):
    seen = {}
    for t in topics:
        n = sum(len(s) for s in t["sections"])
        if not t["emoji"] or not t["title"] or not t["cat"]:
            fail(f"{t['where']}: emoji/title/category missing")
        if len(t["sections"]) < MIN_SECTIONS:
            fail(f"{t['where']} {t['title']}: only {len(t['sections'])} section(s)")
        if n < MIN_LINES:
            fail(f"{t['where']} {t['title']}: only {n} lines")
        if t["title"] in seen:
            fail(f"{t['where']}: duplicate title {t['title']!r} (also {seen[t['title']]})")
        seen[t["title"]] = t["where"]
        for s in t["sections"]:
            if not s:
                fail(f"{t['where']} {t['title']}: empty section")


def rows_for(topics):
    rows = []
    for t in topics:
        rows.append("\t".join(["T", t["emoji"], t["title"], t["cat"], t["keys"]]))
        for s in t["sections"]:
            rows.append("S\t")
            for sp, en, ja in s:
                rows.append("\t".join([sp, en, ja]))
    return rows


def main():
    files = sorted(glob.glob(os.path.join(HERE, "*.txt")))
    topics = []
    for p in files:
        topics.extend(parse_file(p))
    validate(topics)
    rows = rows_for(topics)
    raw = "\n".join(rows)

    s = open(SWIFT, encoding="utf-8").read()
    head_i = s.index("enum TopicSeed {")
    i = s.index('private static let raw = #"""', head_i)
    start = i + len('private static let raw = #"""\n')
    end = s.index('\n"""#', start)
    s = s[:start] + raw + s[end:]
    open(SWIFT, "w", encoding="utf-8").write(s)

    code = re.sub(r'#""".*?"""#', "RAW", s, flags=re.S)
    if code.count("{") != code.count("}"):
        fail("brace imbalance in SeedData.swift after rebuild")

    cats = {}
    for t in topics:
        cats[t["cat"]] = cats.get(t["cat"], 0) + 1
    lines = sum(len(s) for t in topics for s in t["sections"])
    print(f"files {len(files)}  topics {len(topics)}  lines {lines}")
    print("  ".join(f"{c}:{n}" for c, n in cats.items()))


if __name__ == "__main__":
    main()
