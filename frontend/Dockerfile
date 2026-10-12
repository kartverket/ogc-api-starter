FROM ghcr.io/kartverket/datadeling-ogcapi-frontend:frontend-v0.6.0@sha256:9e824fdb44b9cabbf9bbca6adcb7ca91c18b735a8d6ddc821a88ba921e7ae8af

USER 150

COPY config/pygeoapi-config.yml /apiconfig/config.yml

ENV PYGEOAPI_CONFIG_PATH_FRONTEND=/apiconfig/config.yml
