FROM ghcr.io/kartverket/datadeling-ogcapi-pygeoapi:pygeoapi-v0.8.0@sha256:dba8103c8eb81cb5d467c8497e5599b3e50266901c1aa8f5f6096502bea2b59e

USER 150

COPY config/pygeoapi-config.yml /pygeoapi/pygeoapi-config.yml

COPY assets/collection-images/ /pygeoapi/data/collection-images/
COPY assets/dataset-images/ /pygeoapi/data/dataset-images/
