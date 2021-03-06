# Løsningsforslag til ukeoppgave om Open Layers

- *[oppgavetekst](ukeoppgave-openlayers.html)*

## 2. Beregn målestokk for PC-skjermen.

Målestokk er definert som __*avstand på kartet / avstand i terrenget*__ Dette skrives ofte på denne måten: __*1:50 000*__. 
Tallet etter deletetegnet kalles __*målestokktallet*__ (*Scale Denominator* på engelsk).

Dette vil her si __*avstand på skjermen / avstand i terrenget*__. Som avstand på skjermen bruker vi størrelsen på ett bildepunkt - én pixel. Min PC-skjerm har oppløsningen __*1920x1080*__ (HD) og er __*14 tommer*__ stor målt diagonalt. Jeg fant dette verktøyet på nettet:

- [Pixel size calculator](http://axofiber.no-ip.org/inside/pixel.size.en.htm)

Med mine skjermverdier får jeg en pixelstørrelse på __*0,161 mm*__ og tilsvarende __*157,35 ppi*__.

I oppgaveteksten er det oppgitt __*resolution*__ på __*20 m*__. Med målestokktallet som ukjent kan vi sette opp denne ligningen


$${1 \over x} = {0,000161  \over 20}$$

Løst for x får vi

$$x = {20 \over 0,000161}$$

$$x = 124223,6$$

Målestokken er altså 1:125 000 - hvis vi runder av litt.

## 3. Lag et WMS-kart med målestokk 1:1000.

Nå er det __*resolution*__-verdien som er den ukjente. Vi setter opp følgende ligning:

$${1 \over 1000} = {0,000161  \over x}$$

Løst for x får vi

$$x = {0,000161 \over 1000}$$

$$x = 0,161$$

Ett bildepunkt skal dermed dekke __*16,1 cm*__ for å få målestokken __*1:1000*__ på PC-skjermen.

## 4. Tilpass Open Layers WMTS-eksempel til å vise flere Zoom-nivåer.

Nedenfor er vist kode som gir tre nye zoom-nivåer i tillegg til det opprinnelige eksemplet. Det er gjort endringer på

- var resolutions: 3 nye oppløsninger er lagt til
- var matrixIds: 3 nye *tilematrix*'er er lagt til med deres ID'er:
  - 'EPSG:25832:6'
  - 'EPSG:25832:7'
  - 'EPSG:25832:8'
- var map: for *extent* er variabelen *extent* byttet ut med variabelen *extentKartverket*  
  Den er definert lenger opp i fila, og er standard-utstrekningen for UTM sone 32 / EUREF89 - kartene fra Kartverket.
- var params er slettet. Den hadde ingen funksjon.

```javascript
/*
 *
 * sverre.stikbakke 14.10.2016
 *
 */

var attribution = new ol.Attribution({
  html: 'Kartgrunnlag: <a href="http://kartverket.no">Kartverket</a>'
});

var extent = [
  556183.31, 6765964.20, // lower left:  Easting, Northing
  592522.90, 6791042.64 // upper right: Easting, Northing
];

var center = [579327, 6777480]; // Easting, Northing

var projection = new ol.proj.Projection({
  code: 'EPSG:25832',
  extent: extent
});

// http://wms.geonorge.no/kr/koordsys_res.txt
var resolutions = [
  338.5,
  169.25,
  84.625,
  42.3125,
  21.15625,
  10.578125,
  5.2890625,
  2.64453125,
  1.322265625,
  0.6611328125,
  0.33056640625,
  0.165283203125
];

var zoom = 2;

// http://www.statkart.no/Kart/Gratis-kartdata/Cache-tjenester/
var extentKartverket = [
  -2000000, 3500000, // lower left:  Easting, Northing
  3545984, 9045984 // upper right: Easting, Northing
];

var matrixSet = 'EPSG:25832'; // EUREF89, UTM zone 32

var matrixIds = [
  'EPSG:25832:6',
  'EPSG:25832:7',
  'EPSG:25832:8',
  'EPSG:25832:9',
  'EPSG:25832:10',
  'EPSG:25832:11',
  'EPSG:25832:12',
  'EPSG:25832:13',
  'EPSG:25832:14',
  'EPSG:25832:15',
  'EPSG:25832:16',
  'EPSG:25832:17'
];

var topo2 = new ol.layer.Tile({
  source: new ol.source.WMTS({
    attributions: [attribution],
    url: 'http://opencache.statkart.no/gatekeeper/gk/gk.open_wmts?',
    layer: 'topo2',
    matrixSet: matrixSet,
    format: 'image/png',
    tileGrid: new ol.tilegrid.WMTS({
      extent: extentKartverket,
      resolutions: resolutions,
      matrixIds: matrixIds
    }),
    style: 'default',
  })
});


var map = new ol.Map({
  layers: [topo2],
  target: 'map',
  view: new ol.View({
    projection: projection,
    extent: extentKartverket,
    center: center,
    resolutions: resolutions,
    zoom: zoom
  })
});
```