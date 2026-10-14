FROM ghcr.io/kartverket/datadeling-ogcapi-frontend:frontend-v0.6.1@sha256:168b391d3d6c72d0303f73d72335498822b67324411ac2203ec00058d34b2f74

USER 150

COPY config/pygeoapi-config.yml /apiconfig/config.yml

ENV PYGEOAPI_CONFIG_PATH_FRONTEND=/apiconfig/config.yml
