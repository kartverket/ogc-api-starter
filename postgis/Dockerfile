FROM postgis/postgis:18-3.6-alpine

COPY initdb.sh /docker-entrypoint-initdb.d/initdb.sh

RUN apk --update add --no-cache gdal-tools \
    && chmod +x /docker-entrypoint-initdb.d/initdb.sh

WORKDIR /

USER postgres

EXPOSE 5432

HEALTHCHECK --interval=5s --timeout=5s --retries=5 --start-period=20s \
    CMD ["pg_isready", "-U", "$${DB_USER}", "-d", "$${DB_NAME}", "-h", "127.0.0.1"]
