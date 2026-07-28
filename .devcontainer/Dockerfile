# Same base as mcr.microsoft.com/devcontainers/base:debian, but without
# pre-baked features — we apply common-utils ourselves to avoid redundancy.
FROM buildpack-deps:trixie-curl

ENV LANG=C.UTF-8

# Security upgrades
RUN apt-get update && apt-get upgrade -y && rm -rf /var/lib/apt/lists/*
