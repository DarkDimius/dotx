#!/usr/bin/env bash

target="$(dirname $0)/backup.list"
if [[ -f "$target" ]]; then rm "$target"; fi
touch "$target"

echo "Apps:" >> "$target"
ls -1A /Applications >> "$target"

echo "" >> "$target"
echo "==================" >> "$target"
echo "Homebrew packages:" >> "$target"
/usr/local/bin/brew list >> "$target" 2>&1

echo "" >> "$target"
echo "==================" >> "$target"
echo "Macports packages:" >> "$target"
/opt/local/bin/port installed >> "$target" 2>&1

echo "" >> "$target"
echo "==================" >> "$target"
echo "Python packages:" >> "$target"
/usr/local/bin/pip freeze >> "$target" 2>&1

echo "" >> "$target"
echo "==================" >> "$target"
echo "Ruby gems:" >> "$target"
gem list >> "$target" 2>&1

echo "" >> "$target"
echo "==================" >> "$target"
echo "Perl modules:" >> "$target"
cpan -l >> "$target" 2>&1