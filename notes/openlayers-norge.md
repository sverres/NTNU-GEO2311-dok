# Open Layers med norske WMS-tjenester

Koden er delt i to, med HTML og CSS i en fil, og javascript-koden i en annen fil.

## HTML-fil

```HTML

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://openlayers.org/en/v3.14.2/css/ol.css" type="text/css">
  <style>
    #map {
      height: 500px;
      width: 100%;
      border: solid 1px;
    }
  </style>
  <title>B-bygget</title>
</head>

<body>

  <div id="map"></div>

  <script src="http://openlayers.org/en/v3.18.2/build/ol-debug.js" type="text/javascript"></script>
  <script src="wms.js" type="text/javascript"></script>

</body>

```

## Javascript for UTM sone 32/ EUREF89 med oppgitte resolutions-verdier.

Legg spesielt merke til bruken av variabelen `resolutionsKartverket`. Dette definerer målestokken på hvert zoom-nivå. Verdiene angir hvor mange meter en pixel i kartet tilsvarer på bakken.

Legg også merke til variabelen `projection`, og hvordan den setter opp EPSG-koden.

`extentKartverketWMS25832` setter opp yttergrensene for kartet.

```javascript
/*
 * http://github.com/sverres
 *
 * sverre.stikbakke 04.04.2016
 *
 */

/*
http://kartverket.no/Kart/Gratis-kartdata/WMS-tjenester/
http://status.kartverket.no/tjenester/openwms.py?
http://openwms.statkart.no/skwms1/wms.topo2?request=GetCapabilities&Service=WMS
http://wms.geonorge.no/kr/koordsys_res.txt
*/

var attribution = new ol.Attribution({
  html: 'Kartgrunnlag: <a href="http://kartverket.no">Kartverket</a>'
});

var extentKartverketWMS25832 = [234068, 6338450, 1351516, 8051673];

var projection = new ol.proj.Projection({
  code: 'EPSG:25832',
  extent: extentKartverketWMS25832
});

var resolutionsKartverket = [
  21664,
  10832,
  5416,
  2708,
  1354,
  677,
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
  0.165283203125,
  0.0826416015625
];

var topo2 = new ol.layer.Tile({
  extent: extentKartverketWMS25832,
  source: new ol.source.TileWMS({
    attributions: [attribution],
    url: 'http://openwms.statkart.no/skwms1/wms.topo2?',
    params: {
      'LAYERS': 'topo2_WMS',
      'STYLES': 'default'
    },
  })
});

var map = new ol.Map({
  layers: [topo2],
  target: 'map',
  view: new ol.View({
    projection: projection,
    center: [591500, 6740500],
    resolutions: resolutionsKartverket,
    zoom: 15
  })
});
```

## Javascript for UTM sone 32/ EUREF89 med min- og max-verdier for resolutions.


```javascript
/*
 * http://github.com/sverres
 *
 * sverre.stikbakke 03.04.2016
 *
 */

/*
http://kartverket.no/Kart/Gratis-kartdata/WMS-tjenester/
http://status.kartverket.no/tjenester/openwms.py?
http://openwms.statkart.no/skwms1/wms.topo2?request=GetCapabilities&Service=WMS
*/

var attribution = new ol.Attribution({
  html: 'Kartgrunnlag: <a href="http://kartverket.no">Kartverket</a>'
});

var extentKartverketWMS25832 = [234068, 6338450, 1351516, 8051673];

var projection = new ol.proj.Projection({
  code: 'EPSG:25832',
  extent: extentKartverketWMS25832
});

var topo2 = new ol.layer.Tile({
  extent: extentKartverketWMS25832,
  source: new ol.source.TileWMS({
    attributions: [attribution],
    url: 'http://openwms.statkart.no/skwms1/wms.topo2?',
    params: {
      'LAYERS': 'topo2_WMS',
      'STYLES': 'default'
    },
  })
});

var map = new ol.Map({
  layers: [topo2],
  target: 'map',
  view: new ol.View({
    projection: projection,
    center: [591500, 6740500],
    minResolution: 2,
    maxResolution: 200,
    resolution: 20,
  })
});
```


## Javascript for Web Mercator-projeksjonen

Web Mercator er Open Layers standard-projeksjon. Vi kan derfor droppe å ta med både projeksjon og extent. 
I stedet for resolution-verdier har vi her brukt zoom. Disse to er avhengige av hverandre, så man kan velge å bruke en av dem.


```javascript
/*
 * http://github.com/sverres
 *
 * sverre.stikbakke 03.04.2016
 *
 */

/*
http://kartverket.no/Kart/Gratis-kartdata/WMS-tjenester/
http://status.kartverket.no/tjenester/openwms.py?
http://openwms.statkart.no/skwms1/wms.topo2?request=GetCapabilities&Service=WMS
*/

var attribution = new ol.Attribution({
  html: 'Kartgrunnlag: <a href="http://kartverket.no">Kartverket</a>'
});

var topo2 = new ol.layer.Tile({
  source: new ol.source.TileWMS({
    attributions: [attribution],
    url: 'http://openwms.statkart.no/skwms1/wms.topo2?',
    params: {
      'LAYERS': 'topo2_WMS',
      'STYLES': 'default'
    },
  })
});

var map = new ol.Map({
  layers: [topo2],
  target: 'map',
  view: new ol.View({
    center: [1188977.37, 8577622.42],
    zoom: 0,
  })
});