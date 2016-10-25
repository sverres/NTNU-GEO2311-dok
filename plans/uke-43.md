# GEO2311 - Høst 2016 - uke 43

## Målsetting

Målet for arbeidet denne uka er å bli mer kjent med Mapbox GL JS og hvilke muligheter 
og begrensninger vi har der. På planen for denne uka står __#hack4no__-arrangementet på 
Hønefoss. Dette er en frivillig aktivitet, og så vidt jeg vet, så er det bare én
(nett-)student som har meldt seg på hele arrangementet fra torsdag til lørdag.
Jeg tror også at det er noen studenter fra spillprogrammeringsstudiet som 
reiser.

Noen campus-studenter drar på dagsbesøk på torsdag. God tur til dere alle!

Jeg har valgt å ikke reise ettersom det er få som har meldt seg på hele 
arrangementet.

## Litt om Mapbox og geojson-filer

Eksemplene som jeg viste på forelesning i uke 42 kan lastes ned herfra: [uke-42.zip](./docs/uke-42.zip)

Disse eksemplene er bl.a.:
- *2015/grunnkretser-farge-topo2.htm*: Dette viser teknologien vi brukte i  
fjor. Det vil si bruk av javascript-biblioteket *Mapbox JS*. Dette benytter seg 
av bildefliser - raster tiles, og er altså *ikke* vector tiles. Mapbox JS bygger 
i stor grad på Leaflet-biblioteket. Leaflet kan også brukes som et eget, 
frittstående bibliotek på linje med Open Layers.

- *grunnkretser/mapbox-geojson-polygon.html* er et eksempel hentet rett fra 
eksempelsamlingen (se linker nederst). I dette eksemplet er geojson-data lagt
rett inn i html-fila.

- *grunnkretser/mapbox-geojson-1.html* er en modifisert versjon av foregående  
eksempel. Forskjellen er at "inline geojson" er byttet ut med en referanse til
fila *grunnkretser.geojson*. Videre er center-koordinatene og zoom-nivå endret.
For at det skal virke med en ekstern geojson-fil, holder det ikke å bare klikke 
på html-fila i en mappe. Fila må presenteres gjennom en webserver. Og det er  
det som gjøres ved hjelp av fila *startWebServerHer.py*. Dette er et lite
python-program som starter en webserver for filene i mappen den startes fra 
(ved å dobbelklikke på den). Du kobler deg til denne webserveren ved url'en
[http://localhost:8000](http://localhost:8000). På opptaket fra tordag kan du 
se hvordan jeg gjorde dette (jeg kommenterte det ikke da).

## Litt om Mapbox og WMS

I mappen *WMS* ligger det to eksempler med bruk av WMS-tjenester som kartlag 
over et bakgrunnskart. Det ene er rett fra eksempelsamlingen, og det andre 
(*mapbox-wms-topo2.html*) bygger på det første, men det er byttet ut url til 
WMS-tjenesten, lagnavn og center-koordinater. I begge tilfeller får vi dermed 
en kombinasjon vector-tiles (bakgrunnskartet) og raster-tiles (WMS-laget).

Jeg har prøvd å finne ut om vi kan bruke WMTS-tjenester på tilsvarende måte,
men jeg har ikke funnet noe om det så langt.

## Litt om Mapbox og kartografiske muligheter

I mappen *style* har jeg lagt en versjon av en fil som henter vector-tiles fra 
Mapbox (i form av en *style*). Dette vector-tiles laget består av et standard 
Mapbox bakgrunnskart og 
grunnkretser som er importert til Mapbox Studio. Siden torsdag er eksemplet 
litt utvidet ved at jeg har lagt på to forskjellige farger på grunnkretsene
(noen er også uten farge, og dermed usynlige). For å få til dette har jeg 
laget en kopi av grunnkrets-laget slik at jeg hadde to grunnkrets-lag. Hvert
av lagene er deretter filtert på egenskapsdata og gitt en farge. Jeg har ikke 
funnet noen annen måte å gi ulik farge til polygoner i samme kartlag i Mapbox 
Studio.

Det er derimot mulig å gi farge til polygoner basert på egenskapsverdier hvis 
man legger geojson-filen som ekstern fil sammen med html-filen.
Det er gjort i vedlagt eksempel *grunnkretser/mapbox-geojson-2.html*. 

```javascript
mapboxgl.accessToken = 'pk.eyJ1Ijoic3ZlcnJlc .. WVVwjZiuBg';
var map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v9',
    center: [10.7,60.8],
    zoom: 9
});

map.on('load', function () {
    map.addSource('maine', {
        'type': 'geojson',
        'data': 'grunnkretser.geojson'
    });

    map.addLayer({
        'id': 'maine',
        'type': 'fill',
        'source': 'maine',
        'layout': {},
        'paint': {
            'fill-opacity': 0.7,
            'fill-outline-color': '#044',
            'fill-color': {
                "property": "i_alt_2008",
                "stops": [
                    [282.000, '#999'],
                    [299.000, '#ddd'],
                    [336.000, '#111']
                ],
            }
        }
    });
});
```

Legg merke til koden for `fill-color`. Dette er forklart i en viss grad i 
[Style reference](https://www.mapbox.com/mapbox-gl-style-spec/), under 
[Types og function](https://www.mapbox.com/mapbox-gl-style-spec/#types-function).
 Men det er ikke veldig utførlig forklart, så her trengs det litt utforsking for å finne ut 
 hvordan dette virker.  Det er verd å merke seg at de skriver *Note that support for property functions is not yet complete.*
 
## Dagsaktuelt eksempel

Dette er ikke laget med Mapbox, men Leaflet. Det viser samme type kart som vi skal lage.
Se VG-artikkel fra 24.10: 
[Sjekk om din kommune blir en «gamliskommune»](http://www.vg.no/nyheter/innenriks/ssb/sjekk-om-din-kommune-blir-en-gamliskommune/a/23818705/)

## Aktiviteter

- last ned kodeeksempler og forklar hvordan koden virker for medstudent.
- modifiser eksemplet ovenfor slik at det viser 5 farger. Hent fargepalett fra [Colorbrewer](http://colorbrewer2.org/).
- prøv å finne ut hvordan du kan få opp informasjon om polygoner når du klikker på dem.
- videre arbeid med Oblig 2.

## Forelesning/fellesaktivitet på torsdag

Det blir ikke noen forelesning, men jeg er tilgjengelig for veiledning deler av tiden.

## Ressurser

### Mapbox

- [Hovedsiden for Mapbox](https://www.mapbox.com/)
- [Mapbox studio](https://www.mapbox.com/mapbox-studio/)
- [Massevis av kodeeksempler](https://www.mapbox.com/mapbox-gl-js/examples/)
- [Gallery - kart-inspirasjon](https://www.mapbox.com/gallery/)
- [Mapbox token - kodenøkkelen](https://www.mapbox.com/studio/account/tokens/)
- [Mapbox GL JS fundamentals](https://www.mapbox.com/help/mapbox-gl-js-fundamentals/)
- [Mapbox GL JS](https://www.mapbox.com/mapbox-gl-js/api/)
- [Mapbox konto-alternativer](https://www.mapbox.com/pricing/)



