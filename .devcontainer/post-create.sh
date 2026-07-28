#!/usr/bin/env bash

echo "post-create"

set -euo pipefail

# Initialize rootless Podman for the vscode user.
# This runs as the containerUser (vscode), not root.
# podman system init sets up the rootless storage and runtime environment.
if command -v podman >/dev/null 2>&1; then
    echo "Initializing rootless Podman..."
    podman system init
    echo "Podman initialized. Testing with 'podman info'..."
    podman info >/dev/null 2>&1 && echo "Podman is ready." || echo "Podman info failed (may need a shell re-login for subuid/subgid to take effect)."
fi

# cd "${containerWorkspaceFolder:-/workspaces/coder-dev-container-test}"

# # Sync project dependencies into the venv
# uv sync