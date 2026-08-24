# OGC API starter kit

Utgangspunkt for å sette opp OGC-API-er. Pygeoapi-basert backend og Next-basert frontend.
Mer dokumentasjon her: https://kartverket.github.io/ogcapi-docs/docs

## Lokal kjøring

For å hente interne docker images lokalt må du autentisere deg via Docker.

1. Lag en PAT (Personal Access Token) på https://github.com/settings/tokens med `read:packages` scope
2. Kopier token-streng (denne ser du ikke igjen etter dette steget) og autoriser mot Kartverket via Configure SSO
3. Logg inn med Docker ved f.eks. `echo '<PAT>' | docker login ghcr.io -u <Github-brukernavn> --password-stdin`

Kjør opp appene med
```
docker compose down -v
docker compose build
docker compose up
```

## Pygeoapi-config

Pygeoapi-dokumentasjon: https://docs.pygeoapi.io/en/latest/configuration.html

Eksempel-config [her](/config/pygeoapi-config.yml)

## Nye versjoner

For å få Dependabot-PRer ved nye versjoner av OGC API Frontend og Pygeoapi, følg dokumentasjonen hos SKIP her:
https://skip.kartverket.no/docs/applikasjon-utrulling/github-actions/tilgang-til-interne-pakker-fra-github-actions

## Apps-repo-oppsett

Fullt eksempel: https://github.com/kartverket/datadeling-apps/blob/main/env/atgcp1-dev/datadeling-ogc-api-starter/ogcapi.jsonnet

Man trenger også versjons-filer for docker-imagene, f.eks. `ogcapi-frontend-version` og `ogcapi-backend-version`.

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

## Automatisk deploy til dev-miljø

Automatisk deploy til dev-miljøet skjer via `argo`-jobben i Github Actionsene. Denne trenger chainguard for å fungere.

Hvis man ikke ønsker automatisk deploy så kan man fjerne `argo`-jobben fra Github Actionsene.

### Chainguard

Opprett en mappe som heter `chainguard` i `.github`-mappen i apps-repoet deres. Hvis OGC-API-repoet deres heter `xxx-ogcapi`,
så må dere legge en fil som heter `xxx-ogcapi.sts.yaml` i `chainguard`-mappen. Innholdet i filen skal være som følger:

```yaml
issuer: https://token.actions.githubusercontent.com
subject: repo:kartverket/xxx-ogcapi:ref:refs/heads/main

permissions:
  contents: write
```
