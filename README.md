# OGC API starter kit

Utgangspunkt for å sette opp OGC-API-er. Pygeoapi-basert backend og Next-basert frontend.

## Apps-repo-oppsett

Fullt eksempel: https://github.com/kartverket/datadeling-apps/blob/main/env/atgcp1-dev/datadeling-ogc-api-starter/ogcapi.jsonnet

Noen miljøvariabler må settes opp i miljøet appene kjører i, typisk via Application-manifestet.

### Backend:

`PYGEOAPI_URL=<backend-ingress>`

Samt noen variabler + secrets for å koble til database:
```
DB_HOST=<IP eller host>
DB_NAME=<databasenavn>
DB_USER=<brukernavn>
```

### Frontend

```
API_BASE_URL=<Kubernetes-ingress til backend>
API_BASE_URL_PUBLIC=<backend-ingress>
```

## Pygeoapi-config

Pygeoapi-dokumentasjon: https://docs.pygeoapi.io/en/latest/configuration.html

Eksempel-config [her](/config/pygeoapi-config.yml)

## Nye versjoner

For å få Dependabot-PRer ved nye versjoner av OGC API Frontend og Pygeoapi, følg dokumentasjonen hos SKIP her:
https://skip.kartverket.no/docs/applikasjon-utrulling/github-actions/tilgang-til-interne-pakker-fra-github-actions
