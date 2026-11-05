FROM ghcr.io/kartverket/datadeling-ogcapi-frontend:frontend-v0.8.0@sha256:57dae62d58e34c696ef38362f345c38e4d61adc9ffb9892cddf18a5076a0b98f

USER 150

COPY config/pygeoapi-config.yml /apiconfig/config.yml

ENV PYGEOAPI_CONFIG_PATH_FRONTEND=/apiconfig/config.yml
