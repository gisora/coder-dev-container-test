# Simple Python 3.14 dev container with uv
FROM python:3.14-slim

# Install essential development tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    git \
    vim \
    less \
    ca-certificates \
    openssh-client \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root developer user
RUN useradd -m -s /bin/bash vscode \
    && usermod -aG sudo vscode \
    && echo "vscode ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Set up the workspace directory
RUN mkdir -p /workspaces && chown vscode:vscode /workspaces

# Switch to non-root user
USER vscode

# Install uv from the official Astral image (no download script needed)
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /usr/local/bin/

# uv environment
ENV UV_CACHE_DIR=/home/vscode/.cache/uv
ENV UV_LINK_MODE=copy