FROM mcr.microsoft.com/devcontainers/base:debian

# common-utils feature handles: curl, git, jq, wget, vim-tiny, nano, unzip, zip,
# openssh-client, gnupg2, procps, htop, less, tree, sudo, locales, ca-certificates, etc.
# Only install what the features don't provide:
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends podman vim \
#     && apt-get clean && rm -rf /var/lib/apt/lists/*

# # Create a non-root developer user
# RUN useradd -m -s /bin/bash vscode \
#     && usermod -aG sudo vscode \
#     && echo "vscode ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# # Set up the workspace directory
# RUN mkdir -p /workspaces && chown vscode:vscode /workspaces

# Switch to non-root user
# USER vscode

# # Install uv from the official Astral image (no download script needed)
# COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /usr/local/bin/

# # uv environment
# ENV UV_CACHE_DIR=/home/vscode/.cache/uv
# ENV UV_LINK_MODE=copy