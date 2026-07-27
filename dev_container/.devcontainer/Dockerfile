FROM mcr.microsoft.com/devcontainers/base:debian

# Java 21 and Maven are installed via the java feature in devcontainer.json.
# This Dockerfile only adds OS-level dependencies that may be useful for
# building and running the DSP IDS Base Spring Boot shared library modules.

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
        ca-certificates \
        curl \
        git \
        gnupg \
        jq \
        openssh-client \
        podman \
        procps \
        skopeo \
        uidmap \
        unzip \
        vim \
        wget \
        zip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install syft (Anchore SBOM tool) — not packaged in Debian apt, so use the
# official install script which downloads the static binary into /usr/local/bin.
RUN curl -fsSL https://raw.githubusercontent.com/anchore/syft/main/install.sh \
        | sh -s -- -b /usr/local/bin

# Install Docker CLI (no daemon) so the host Podman socket can be used
# via the bind mount in devcontainer.json. The docker-outside-of-docker
# devcontainer feature hardcodes a bind mount from /var/run/docker.sock
# on the host, which does not exist when using Podman as the container
# runtime. Installing the CLI here and forwarding the Podman socket via
# a custom mount avoids that incompatibility.
RUN . /etc/os-release \
    && install -d -m 0755 /etc/apt/keyrings \
    && curl -fsSL "https://download.docker.com/linux/debian/gpg" \
        | gpg --dearmor -o /etc/apt/keyrings/docker.gpg \
    && chmod a+r /etc/apt/keyrings/docker.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian ${VERSION_CODENAME} stable" \
        > /etc/apt/sources.list.d/docker.list \
    && apt-get update \
    && apt-get -y install --no-install-recommends \
        docker-ce-cli \
        docker-compose-plugin \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Add the vscode user to the root group (gid 0) so it can access the
# host Podman socket bind-mounted at /var/run/docker.sock, which is owned
# by root:root with mode 0660. Without this, the Docker CLI and the VS Code
# Docker extension get "permission denied" when talking to the socket.
RUN usermod -aG 0 vscode

USER vscode