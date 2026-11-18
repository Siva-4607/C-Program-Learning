#!/usr/bin/env bash
# Counts ticked roadmap items in the root README and updates the progress bar.
python3 - << 'PY'
import re
txt = open("README.md", encoding="utf-8").read()
road = txt.split("## Roadmap")[1]
done = len(re.findall(r"^- \[x\] \[", road, re.M | re.I))
total = done + len(re.findall(r"^- \[ \] \[", road, re.M))
pct = round(done * 100 / total) if total else 0
filled = round(pct * 30 / 100)
bar = "█" * filled + "░" * (30 - filled)
block = f"<!-- progress-start -->\n**{pct}%** complete ({done} / {total} folders)\n\n`{bar}`\n<!-- progress-end -->"
txt = re.sub(r"<!-- progress-start -->.*?<!-- progress-end -->", block, txt, flags=re.S)
open("README.md", "w", encoding="utf-8").write(txt)
print(f"{pct}% complete ({done}/{total})")
PY
