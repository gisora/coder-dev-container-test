#!/usr/bin/env bash

set -euo pipefail

# Check rootless Podman availability.
# Note: podman system init was added in Podman 5.5+, but Debian trixie ships 5.4.
if command -v podman >/dev/null 2>&1; then
    echo "Podman $(podman --version)"
    if podman info >/dev/null 2>&1; then
        echo "Podman rootless is ready."
    else
        echo "WARNING: Podman rootless is not fully functional in this container."
        echo "This is likely due to security restrictions (no-new-privileges) blocking"
        echo "newuidmap/newgidmap from writing to /proc/self/uid_map."
        echo "Rootless Podman requires the container runtime to allow user namespace creation."
    fi
fi

# cd "${containerWorkspaceFolder:-/workspaces/coder-dev-container-test}"

# # Sync project dependencies into the venv
# uv sync