FROM ghcr.io/kartverket/datadeling-ogcapi-pygeoapi:pygeoapi-v0.6.0@sha256:03246d1dd3d081aabdf4b633ef5e6c26b88f640e7bdc6964a4cf37dc4bd6e721

USER 150

COPY config/pygeoapi-config.yml /pygeoapi/pygeoapi-config.yml

COPY config/collection-images/ /pygeoapi/data/collection-images/
COPY config/dataset-images/ /pygeoapi/data/dataset-images/