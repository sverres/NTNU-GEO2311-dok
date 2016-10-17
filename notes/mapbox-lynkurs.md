# Mapbox-lynkurs i å lage kart med egne data og egen style

### Lag et webkart basert på eksempel-kode

1. Opprett bruker på [mapbox.com](https://www.mapbox.com/).
1. Lag tom html-fil og kopier fra eksempel [Display a map with a custom style](https://www.mapbox.com/mapbox-gl-js/example/custom-style-id/).
1. Hent ut egen [Access token](https://www.mapbox.com/studio/) (tilsvarer Google Maps API Key) og legg inn.
1. Tilpass *center* etter eget ønske.
1. Sjekk at websiden virker.

### Lag en geojson-fil, importer som dataset og lag en ny *Style*

1. Bruk karttegne-verktøy på [geojson.io](http://geojson.io/#map=8/60.0/10.0) og lag et polygon.  Lagre polygonet som geojson-fil.
1. Bruk [Mapbox Studio](https://www.mapbox.com/studio/) og importer geojson-fil som *dataset*.
1. Velg *background style* fra høyremenyen.
1. Velg *export*-knappen for å eksportere til et nytt *tileset*.
1. Velg *Tilesets* i venstremenyen og klikk "Add to style*. Velg *New style*.
1. Velg *Create layer*.
1. Tilpass farge, og trykk på *Publish*-knappen. Velg *Publish as new*.

### Ta i bruk ny *Style*

1. Velg *Styles* i venstremenyen og gå inn på den nye *Stylen*.
1. Velg *Share, develop & use* i høyremenyen.
1. Hent ut *Style URL* under overskriften *Develop with this style*.
1. Bytt ut *style* i din html-fil med denne.
1. Sjekk at websiden virker.


