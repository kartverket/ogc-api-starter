# OGC API starter kit

Utgangspunkt for å sette opp OGC-API-er. Data + Config -> API!

Mer dokumentasjon her: https://kartverket.github.io/ogcapi-docs/docs

## Lokal kjøring

Kjør opp appene med
```
docker compose down -v
docker compose build
docker compose up
```

## Pygeoapi-config

Pygeoapi-dokumentasjon: https://docs.pygeoapi.io/en/latest/configuration.html

Eksempel-config [her](/config/pygeoapi-config.yml)


## Utrulling på SKIP i Kartverket
### Apps-repo-oppsett

[Fullt eksempel](https://github.com/kartverket/datadeling-apps/blob/main/env/atgcp1-dev/datadeling-ogc-api-starter/ogcapi.jsonnet)

Man trenger også versjons-filer for docker-imagene, f.eks. `ogcapi-frontend-version` og `ogcapi-backend-version`.

Noen miljøvariabler må settes opp i miljøet appene kjører i, typisk via Application-manifestet.

#### Backend:

`PYGEOAPI_URL=<backend-ingress>`

Samt noen variabler + secrets for å koble til database:
```
DB_HOST=<IP eller host>
DB_NAME=<databasenavn>
DB_USER=<brukernavn>
```

#### Frontend

```
API_BASE_URL=<Kubernetes-ingress til backend>
API_BASE_URL_PUBLIC=<backend-ingress>
```

### Automatisk deploy til dev-miljø

Automatisk deploy til dev-miljøet skjer via `argo`-jobben i byggejobbene. Denne trenger OctoSTS for å fungere.

Hvis man ikke ønsker automatisk deploy så kan man fjerne `argo`-jobbene.

#### OctoSTS

OctoSTS brukes for å gi tilgang til å skrive til apps-repoet deres fra Github Actions i dette repoet,
og automatisk deploy fungerer ved å oppdatere versjons-filene i apps-repoet.

Se mer doc fra SKIP for hvordan dette settes opp [her](https://skip.kartverket.no/docs/applikasjon-utrulling/github-actions/tilgang-til-repoer-med-tokens-fra-github-actions).
