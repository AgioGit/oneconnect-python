#!/usr/bin/env sh
set -e
# Installs the desktop, autostart and wrapper into user locations so the app
# can be launched by double-click from file managers and added to the menu.
DEST_BIN="$HOME/.local/bin"
DEST_APP="$HOME/.local/share/applications"
DEST_AUTOSTART="$HOME/.config/autostart"
PWD="$(dirname "$0")"
mkdir -p "$DEST_BIN" "$DEST_APP" "$DEST_AUTOSTART"

# Install wrapper
install -m 0755 "$PWD/oneconnect-gui-wrapper.sh" "$DEST_BIN/oneconnect-gui"

# Install desktop entries
cp -f "$PWD/oneconnect-gui.desktop" "$DEST_APP/"
cp -f "$PWD/oneconnect-gui-autostart.desktop" "$DEST_AUTOSTART/"

# Mark desktop file executable (File managers treat that as "Allow Launching")
chmod +x "$DEST_APP/oneconnect-gui.desktop"

cat <<'EOF'
Installed oneconnect GUI launcher to:
  - ~/.local/bin/oneconnect-gui
  - ~/.local/share/applications/oneconnect-gui.desktop
  - ~/.config/autostart/oneconnect-gui-autostart.desktop

You may need to log out and back in for autostart to take effect.
If the icon does not appear in Nautilus, right-click the desktop file and choose "Allow Launching".
EOF
