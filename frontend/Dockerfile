FROM ghcr.io/kartverket/datadeling-ogcapi-frontend:frontend-v0.4.0@sha256:725a63e008ed3f91e826883d1821dc904167daadde70e09697b22526244a9eea

USER apprunner

COPY config/pygeoapi-config.yml /apiconfig/config.yml

ENV PYGEOAPI_CONFIG_PATH_FRONTEND=/apiconfig/config.yml
