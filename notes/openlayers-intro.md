# Introduksjon til Open Layers

## Sentrale Open Layers-komponenter (Javascript-objekter)

Koden nedenfor er fra [Basic Concepts](http://openlayers.org/en/latest/doc/tutorials/concepts.html)-siden hos Open Layers. Der kan du lese om oppgaven/funksjonen til dem. Dette er viktig lesning - kortfattet og konsist!

### Map

```HTML,XML
<div id="map" style="width: 100%, height: 400px">
</div>
<script>
  var map = new ol.Map({target: 'map'});
</script>
```

### View

```javascript
  map.setView(new ol.View({
    center: [0, 0],
    zoom: 2
  }));
```

### Source

```javascript
var osmSource = new ol.source.OSM();
```

### Layer

- ```ol.layer.Tile``` is for layer sources that provide pre-rendered, tiled images in grids that are organized by zoom levels for specific resolutions.

- ```ol.layer.Image``` is for server rendered images that are available for arbitrary extents and resolutions.

- ```ol.layer.Vector``` is for vector data that is rendered client-side.

```javascript
var osmLayer = new ol.layer.Tile({source: osmSource});
map.addLayer(osmLayer);
```

### Komplett eksempel

[basic-concepts.html](./docs/openlayers/basic-concepts.html)

