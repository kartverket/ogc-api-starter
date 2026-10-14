FROM ghcr.io/kartverket/datadeling-ogcapi-pygeoapi:pygeoapi-v0.6.1@sha256:8233c5b5c5694596bd8f11783311f49cf8c6829509209d731c3c99e2a63f0dab

USER 150

COPY config/pygeoapi-config.yml /pygeoapi/pygeoapi-config.yml

COPY assets/collection-images/ /pygeoapi/data/collection-images/
COPY assets/dataset-images/ /pygeoapi/data/dataset-images/
