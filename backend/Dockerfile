FROM ghcr.io/kartverket/datadeling-ogcapi-pygeoapi:pygeoapi-v0.7.0@sha256:ffc07ba550079d4bf329266b23fd40fa3c884660b7b8730e1e25adaa310e4c70

USER 150

COPY config/pygeoapi-config.yml /pygeoapi/pygeoapi-config.yml

COPY assets/collection-images/ /pygeoapi/data/collection-images/
COPY assets/dataset-images/ /pygeoapi/data/dataset-images/
