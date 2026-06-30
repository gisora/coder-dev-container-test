#!/usr/bin/env bash
set -euo pipefail

cd "${containerWorkspaceFolder:-/workspaces/coder-dev-container-test}"

# Create the virtual environment (uses Python 3.14 from the base image)
uv venv