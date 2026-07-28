FROM mcr.microsoft.com/devcontainers/base:debian

# Install GitHub CLI via apt (the github-cli devcontainer feature fails in
# envbuilder/kaniko because git-remote-https is missing from the build env).
# Uses curl/wget instead of git, so it works in restricted build environments.
RUN mkdir -p /etc/apt/keyrings \
    && curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg \
        -o /etc/apt/keyrings/githubcli-archive-keyring.gpg \
    && chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
        > /etc/apt/sources.list.d/github-cli.list \
    && apt-get update \
    && apt-get install -y gh \
    && apt-get clean && rm -rf /var/lib/apt/lists/*
