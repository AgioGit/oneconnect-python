#!/usr/bin/env sh
# Wrapper that exposes a short launcher name for desktop files.
# Install this to ~/.local/bin/oneconnect-gui (or system-wide if desired).
exec uvx --from git+https://github.com/AgioGit/oneconnect-python oneconnect-gui "$@"
