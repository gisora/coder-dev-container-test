# Same base as mcr.microsoft.com/devcontainers/base:debian, but without
# pre-baked features — we apply common-utils ourselves to avoid redundancy.
FROM buildpack-deps:trixie-curl

ENV LANG=C.UTF-8

# Security upgrades
RUN apt-get update && apt-get upgrade -y && rm -rf /var/lib/apt/lists/*

# Install rootless Podman and all prerequisites.
# - podman: the container engine
# - uidmap: provides newuidmap/newgidmap (required for user namespaces)
# - slirp4netns: user-space networking for rootless containers
# - fuse-overlayfs: fallback overlay filesystem for rootless mode
# - passt: newer user-space networking (pasta) — optional but recommended
RUN apt-get update && apt-get install -y --no-install-recommends \
    podman \
    uidmap \
    slirp4netns \
    fuse-overlayfs \
    passt \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Configure Podman for rootless mode (system-wide config, doesn't need the
# vscode user which is created later by the common-utils feature).
RUN mkdir -p /etc/containers && \
    printf '[containers]\nnetns = "slirp4netns"\ndefault_rootless_storage_driver = "overlay"\n' \
    > /etc/containers/containers.conf
