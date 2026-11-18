
#!/usr/bin/env bash

python - <<'PY'
import re
from pathlib import Path

readme = Path("README.md")
txt = readme.read_text(encoding="utf-8")

# Find the roadmap section
if "## Roadmap" not in txt:
    raise SystemExit("Error: ## Roadmap section not found!")

roadmap = txt.split("## Roadmap", 1)[1]

# Count completed and incomplete folder checkboxes
done = len(re.findall(r"^\s*- \[x\] \[", roadmap, re.M | re.I))
total = len(re.findall(r"^\s*- \[[x ]\] \[", roadmap, re.M | re.I))

pct = round(done * 100 / total) if total else 0

filled = round(pct * 30 / 100)
bar = "█" * filled + "░" * (30 - filled)

block = (
    "<!-- progress-start -->\n"
    f"**{pct}%** complete ({done} / {total} folders)\n\n"
    f"`{bar}`\n"
    "<!-- progress-end -->"
)

pattern = r"<!-- progress-start -->.*?<!-- progress-end -->"

if re.search(pattern, txt, flags=re.S):
    txt = re.sub(pattern, lambda _: block, txt, count=1, flags=re.S)
else:
    raise SystemExit("Error: Progress markers not found in README.md!")

readme.write_text(txt, encoding="utf-8")

print(f"Progress updated: {pct}% complete ({done}/{total})")
PY
