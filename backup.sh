#!/usr/bin/env bash

target="$(dirname $0)/backup.list"
if [[ -f "$target" ]]; then rm "$target"; fi
touch "$target"

echo "Apps:" > "$target"
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
echo "Alfred 2 extensions:" >> "$target"
ls "/Users/xeno_by/Library/Application Support/Alfred 2/Alfred.alfredpreferences/workflows/" >> "$target"

echo "" >> "$target"
echo "==================" >> "$target"
echo "Firefox extensions:" >> "$target"
ls "/Users/xeno_by/Library/Application Support/Firefox/Profiles/zgjntnvs.default/extensions" >> "$target"

echo "" >> "$target"
echo "==================" >> "$target"
echo "KeyRemap4MacBook private.xml:" >> "$target"
cat "/Users/xeno_by/Library/Application Support/KeyRemap4MacBook/private.xml" >> "$target"

src="/Users/xeno_by/Library/Application Support/Alfred 2/Alfred.alfredpreferences/workflows"
dest="$(dirname $0)/configs/Library/Application Support/Alfred 2/Alfred.alfredpreferences/workflows"
if [[ -d "$dest" ]]; then rm -rf "$dest"; fi
cp -r "$src" "$dest"

src="/Users/xeno_by/Library/Application Support/iTerm"
dest="$(dirname $0)/configs/Library/Application Support/iTerm"
if [[ -d "$dest" ]]; then rm -rf "$dest"; fi
cp -r "$src" "$dest"

src="/Users/xeno_by/Library/Application Support/KeyRemap4MacBook"
dest="$(dirname $0)/configs/Library/Application Support/KeyRemap4MacBook"
if [[ -d "$dest" ]]; then rm -rf "$dest"; fi
cp -r "$src" "$dest"

src="/Users/xeno_by/Library/Application Support/Witch"
dest="$(dirname $0)/configs/Library/Application Support/Witch"
if [[ -d "$dest" ]]; then rm -rf "$dest"; fi
cp -r "$src" "$dest"

src="/Users/xeno_by/Library/Preferences/muCommander"
dest="$(dirname $0)/configs/Library/Preferences/muCommander"
if [[ -d "$dest" ]]; then rm -rf "$dest"; fi
cp -r "$src" "$dest"

cp "/Users/xeno_by/Library/Preferences/com.Logitech.Control Center.Assignments.registry" "$(dirname $0)/configs/Library/Preferences/com.Logitech.Control Center.Assignments.registry"
cp "/Users/xeno_by/Library/Preferences/com.Logitech.Control Center.Daemon.plist" "$(dirname $0)/configs/Library/Preferences/com.Logitech.Control Center.Daemon.plist"
cp "/Users/xeno_by/Library/Preferences/com.Logitech.Control Center.Device Manager.plist" "$(dirname $0)/configs/Library/Preferences/com.Logitech.Control Center.Device Manager.plist"
cp "/Users/xeno_by/Library/Preferences/com.Logitech.Control Center.Device Settings.registry" "$(dirname $0)/configs/Library/Preferences/com.Logitech.Control Center.Device Settings.registry"
cp "/Users/xeno_by/Library/Preferences/com.Logitech.Updater.plist" "$(dirname $0)/configs/Library/Preferences/com.Logitech.Updater.plist"
cp "/Users/xeno_by/Library/Preferences/com.alfredapp.Alfred.plist" "$(dirname $0)/configs/Library/Preferences/com.alfredapp.Alfred.plist"
cp "/Users/xeno_by/Library/Preferences/com.apple.ActivityMonitor.plist" "$(dirname $0)/configs/Library/Preferences/com.apple.ActivityMonitor.plist"
cp "/Users/xeno_by/Library/Preferences/com.apple.dock.plist" "$(dirname $0)/configs/Library/Preferences/com.apple.dock.plist"
cp "/Users/xeno_by/Library/Preferences/com.apple.driver.AppleBluetoothMultitouch.mouse.plist" "$(dirname $0)/configs/Library/Preferences/com.apple.driver.AppleBluetoothMultitouch.mouse.plist"
cp "/Users/xeno_by/Library/Preferences/com.apple.driver.AppleBluetoothMultitouch.trackpad.plist" "$(dirname $0)/configs/Library/Preferences/com.apple.driver.AppleBluetoothMultitouch.trackpad.plist"
cp "/Users/xeno_by/Library/Preferences/com.apple.driver.AppleHIDMouse.plist" "$(dirname $0)/configs/Library/Preferences/com.apple.driver.AppleHIDMouse.plist"
cp "/Users/xeno_by/Library/Preferences/com.apple.loginitems.plist" "$(dirname $0)/configs/Library/Preferences/com.apple.loginitems.plist"
cp "/Users/xeno_by/Library/Preferences/com.googlecode.iterm2.plist" "$(dirname $0)/configs/Library/Preferences/com.googlecode.iterm2.plist"
cp "/Users/xeno_by/Library/Preferences/org.pqrs.KeyRemap4MacBook.plist" "$(dirname $0)/configs/Library/Preferences/org.pqrs.KeyRemap4MacBook.plist"
