FROM ghcr.io/kartverket/datadeling-ogcapi-frontend:frontend-v0.5.1@sha256:19839664f50b1b8e73aa6514492e047dc1f72ff30a6c492b1341b8db3d289b13

USER 150

COPY config/pygeoapi-config.yml /apiconfig/config.yml

ENV PYGEOAPI_CONFIG_PATH_FRONTEND=/apiconfig/config.yml
