#!/usr/bin/env bash

set -euo pipefail

# Install VS Code extensions.
# Envbuilder/Coder doesn't process the "customizations.vscode.extensions"
# section of devcontainer.json, so we install extensions here instead.
# The "code" CLI is available after VS Code Server starts.
# Add or remove extensions from this list as needed.
if command -v code >/dev/null 2>&1; then
    echo "Installing VS Code extensions..."
    for ext in \
        "github.vscode-pull-request-github" \
    ; do
        echo "  Installing $ext..."
        code --install-extension "$ext" 2>/dev/null || echo "  WARNING: Failed to install $ext (VS Code Server may not be ready yet)"
    done
    echo "VS Code extensions installed."
else
    echo "WARNING: 'code' CLI not found. VS Code extensions will not be installed automatically."
    echo "You can install them manually with: code --install-extension <extension-id>"
fi