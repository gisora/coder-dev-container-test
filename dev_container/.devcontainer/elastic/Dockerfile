# Elasticsearch 6.8.20 for DSP IDS local development.
# Self-contained devcontainer image — does not reference docker/elastic.
#
# The base image already ships the analysis-icu plugin, so remove it first
# to avoid the "plugin directory already exists" error, then reinstall it.

FROM docker.elastic.co/elasticsearch/elasticsearch:6.8.20
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin remove analysis-icu --purge || true
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-icu