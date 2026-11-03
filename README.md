# OGC API starter kit

Utgangspunkt for å sette opp OGC-API-er. Data + Config -> API!

Mer dokumentasjon her: https://kartverket.github.io/ogcapi-docs/docs

I tillegg til standard OGC API-funksjonalitet, har vi lagt til støtte for:
- Nedlasting av hele datasett (collections) som GeoPackage og CSV
- Nedlasting av deler av datasettet omfattet av naturlige inndelinger som fylker og kommuner

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

### Bilder

Du kan konfigurere et bilde for forsiden og egne bilder for hver collection.

Legg collection-bilder i `assets/collection-images/` og referer til dem under
`resources.<collection-id>.links` i `config/pygeoapi-config.yml`. For eksempel:

```yaml
resources:
  fylker:
    links:
      - type: image/png
        rel: preview
        title:
          nb-NO: Forhåndsvisning
          en-US: Preview
        href: /assets/collection-images/fylker.png
```

Her må filen ligge på `assets/collection-images/fylker.png`. Bruk riktig `image/*`-type
for filformatet. `rel: preview` angir at lenken er et forhåndsvisningsbilde;
frontend bruker denne lenken på collection-siden og viser standardbildet hvis
den mangler.

For forsidebildet legges bildefilen i `assets/dataset-images` mappen.

Legg deretter lenken under `metadata.identification.links` i `config/pygeoapi-config.yml`:

```yaml
metadata:
  identification:
    links:
      - type: image/png
        rel: preview
        title:
          nb-NO: Forsidebilde
          en-US: Frontpage image
        href: /assets/dataset-images/dataset-thumbnail.png
```

Filnavnet i `href` må stemme med bildefilen, og `type` må samsvare med filformatet.
Bygg og start backend på nytt etter at du har lagt til eller endret bildefiler.

### Lenke til metadata

For å vise en lenke til metadataposten (f.eks. i Geonorge) legger du til en `links`-oppføring på den aktuelle collectionen i `pygeoapi/pygeoapi-config.yml`:

```yaml
resources:
  fylker:
    type: collection
    links:
      - type: text/html
        rel: related
        title: Geonorge link
        href: https://kartkatalog.geonorge.no/metadata/administrative-enheter-fylker/6093c8a8-fa80-11e6-bc64-92361f002671
```

- Lenken vises som en knapp med teksten fra title, her «Geonorge link»
- `rel` må være nøyaktig `related`, ellers vises ikke knappen
- Lenken er valgfri. Hvis den mangler, vises ingen knapp

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
