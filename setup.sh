#!/usr/bin/env bash
# Creates the C learning repo: 41 numbered folders, each with a README checklist,
# plus a root README.md with a progress tracker.
set -e

# Safe mode: build everything in a temp folder, then copy only files that don't exist yet.
TARGET="$PWD"
TMP=$(mktemp -d)
cd "$TMP"

DATA=$(cat << 'DATA_END'
1|01-basics|History, compilation process, program structure, main(), comments, variables, constants, data types, operators, input/output
1|02-control-flow|if, else-if, nested if, switch, break, continue, goto
1|03-loops|for, while, do-while, nested loops, pattern printing
1|04-functions|Parameters, return types, pass by value, scope
1|05-recursion|Base case, call stack, factorial, Fibonacci
1|06-arrays|1D and 2D arrays, traversal, sorting
1|07-strings|Char arrays, string.h functions, string input
2|08-pointers|Address and dereference, pointer arithmetic, pointers and arrays, pass by reference
2|09-dynamic-memory|malloc, calloc, realloc, free, memory leaks
2|10-structures|struct, union, enum, typedef, nested structs, pointer to struct
3|11-file-handling|fopen, fclose, reading, writing, appending, binary files
3|12-preprocessor-headers|Macros, #include, header files, include guards, storage classes, multi-file projects
3|13-advanced-c|Bit manipulation, function pointers, error handling, command-line arguments, pthreads
4|14-linked-lists|Singly, doubly, circular, insert, delete, reverse
4|15-stacks-queues|Array and list versions, circular queue, applications
4|16-trees-graphs|Binary tree, BST, traversals, BFS, DFS
4|17-searching-sorting|Linear and binary search, bubble, selection, insertion, merge, quick
DATA_END
)

PHASES=("" "Phase 1: Fundamentals" "Phase 2: Pointers and Memory" "Phase 3: Intermediate and Advanced C" "Phase 4: Data Structures and Algorithms")

# ---- per-folder READMEs ----
while IFS='|' read -r phase folder topics; do
  mkdir -p "$folder"
  title=$(echo "$folder" | cut -d- -f2- | tr '-' ' ')
  {
    echo "# $title"
    echo
    echo "## Topics"
    IFS=',' read -ra arr <<< "$topics"
    for t in "${arr[@]}"; do echo "- [ ] $(echo "$t" | sed 's/^ *//')"; done
    echo
    echo "## Practice"
    echo "- [ ] Program 1"
    echo "- [ ] Program 2"
    echo "- [ ] Program 3"
    echo
    echo "## Notes"
    echo "_Write what you learned, mistakes you made, and doubts here._"
  } > "$folder/README.md"
done <<< "$DATA"

# ---- root README ----
{
cat << 'HEAD'
# C Programming: Learning Journey

My path from C basics to advanced, tracked folder by folder.

## Progress

<!-- progress-start -->
**0%** complete (0 / 20 folders)

`░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░` 
<!-- progress-end -->

> Tick a box below when a folder is fully done (topics and practice programs). Then run `./progress.sh` to refresh the bar.

HEAD

echo "## Repository Structure"
echo
echo '```'
echo "c-programming/"
last=0
while IFS='|' read -r phase folder topics; do
  if [ "$phase" != "$last" ]; then echo "│"; last=$phase; fi
  printf "├── %-24s → %s\n" "$folder/" "$topics"
done <<< "$DATA"
echo "│"
printf "├── %-24s → %s\n" "mini-projects/" "Programs combining multiple topics (Calculator, Guessing Game, Contact Book)"
printf "├── %-24s → %s\n" "notes/" "Your own notes and cheat sheets (c_notes.pdf)"
echo "│"
printf "└── %-24s → %s\n" "CHAPTERS.md" "Detailed chapter-by-chapter guide"
echo '```'
echo
echo "## Roadmap"
last=0
while IFS='|' read -r phase folder topics; do
  if [ "$phase" != "$last" ]; then
    echo; echo "### ${PHASES[$phase]}"; echo
    last=$phase
  fi
  echo "- [ ] [$folder](./$folder) - $topics"
done <<< "$DATA"
} > README.md

mkdir -p mini-projects notes
cat > mini-projects/README.md << 'MP'
# Mini Projects

Programs that combine multiple topics.

- [ ] Calculator (after 01-07)
- [ ] Number guessing game (after 01-07)
- [ ] Student record system (after 08-10)
- [ ] Contact book with file saving (after 08-13)
- [ ] Tic-tac-toe (after 08-13)
- [ ] Library management (after 14-17)
- [ ] To-do list with linked lists (after 14-17)
MP
echo "# Notes" > notes/README.md
echo "Keep your own notes and cheat sheets here (for example c_notes.pdf)." >> notes/README.md

{
  echo "# Chapters"
  echo
  echo "Chapter-by-chapter guide. Fill in resources and programs as you go."
  while IFS='|' read -r phase folder topics; do
    echo
    echo "## $folder"
    echo "- **Topics:** $topics"
    echo "- **Resources:** "
    echo "- **Programs written:** "
  done <<< "$DATA"
} > CHAPTERS.md

cat > .gitignore << 'GI'
*.o
*.out
*.exe
a.out
.vscode/
GI

# If a root README already exists, keep it and save the new one as README_new.md
if [ -f "$TARGET/README.md" ]; then mv README.md README_new.md; fi
cp -rn "$TMP"/. "$TARGET"/ 2>/dev/null || true
cd "$TARGET"
rm -rf "$TMP"
echo "Done. 17 folders plus mini-projects/, notes/ and CHAPTERS.md created. Next: git init && git add . && git commit -m 'Initial roadmap' && git push"
