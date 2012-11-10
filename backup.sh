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

echo "" >> "$target"
echo "==================" >> "$target"
echo "Alfred extensions:" >> "$target"
ls "/Users/xeno_by/Library/Application Support/Alfred/extensions/applescripts" >> "$target"
ls "/Users/xeno_by/Library/Application Support/Alfred/extensions/files" >> "$target"
ls "/Users/xeno_by/Library/Application Support/Alfred/extensions/filters" >> "$target"
ls "/Users/xeno_by/Library/Application Support/Alfred/extensions/scripts" >> "$target"
ls "/Users/xeno_by/Library/Application Support/Alfred/extensions/workflows" >> "$target"

echo "" >> "$target"
echo "==================" >> "$target"
echo "Firefox extensions:" >> "$target"
ls "/Users/xeno_by/Library/Application Support/Firefox/Profiles/zgjntnvs.default/extensions" >> "$target"

echo "" >> "$target"
echo "==================" >> "$target"
echo "KeyRemap4MacBook private.xml:" >> "$target"
cat "/Users/xeno_by/Library/Application Support/KeyRemap4MacBook/private.xml" >> "$target"
