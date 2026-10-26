FROM ghcr.io/kartverket/datadeling-ogcapi-frontend:frontend-v0.7.0@sha256:ee46d95c494f5d8999fe10a021a219f57b3519e0f7d7804da826c923a0aea61a

USER 150

COPY config/pygeoapi-config.yml /apiconfig/config.yml

ENV PYGEOAPI_CONFIG_PATH_FRONTEND=/apiconfig/config.yml
