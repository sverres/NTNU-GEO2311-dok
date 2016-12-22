# GeoJSON-eksempler

## Fra [rfc7946 - The GeoJSON Format:](https://tools.ietf.org/html/rfc7946#section-3.1.1)

## Appendix A.  Geometry Examples

   Each of the examples below represents a valid and complete GeoJSON
   object.

### A.1.  Points

Point coordinates are in x, y order (easting, northing for projected
coordinates, longitude, and latitude for geographic coordinates):

```javascript
{
   "type": "Point",
   "coordinates": [100.0, 0.0]
}
```

### A.2.  LineStrings

Coordinates of LineString are an array of positions (see
Section 3.1.1):

```javascript
{
   "type": "LineString",
   "coordinates": [
       [100.0, 0.0],
       [101.0, 1.0]
   ]
}
```

### A.3.  Polygons

Coordinates of a Polygon are an array of linear ring (see
Section 3.1.6) coordinate arrays.  The first element in the array
represents the exterior ring.  Any subsequent elements represent
interior rings (or holes).

No holes:

```javascript
{
   "type": "Polygon",
   "coordinates": [
       [
           [100.0, 0.0],
           [101.0, 0.0],
           [101.0, 1.0],
           [100.0, 1.0],
           [100.0, 0.0]
       ]
   ]
}
```

With holes:

```javascript
{
   "type": "Polygon",
   "coordinates": [
       [
           [100.0, 0.0],
           [101.0, 0.0],
           [101.0, 1.0],
           [100.0, 1.0],
           [100.0, 0.0]
       ],
       [
           [100.8, 0.8],
           [100.8, 0.2],
           [100.2, 0.2],
           [100.2, 0.8],
           [100.8, 0.8]
       ]
   ]
}
```

### 1.5.  Example

A GeoJSON FeatureCollection:

```javascript
{
   "type": "FeatureCollection",
   "features": [{
       "type": "Feature",
       "geometry": {
           "type": "Point",
           "coordinates": [102.0, 0.5]
       },
       "properties": {
           "prop0": "value0"
       }
   }, {
       "type": "Feature",
       "geometry": {
           "type": "LineString",
           "coordinates": [
               [102.0, 0.0],
               [103.0, 1.0],
               [104.0, 0.0],
               [105.0, 1.0]
           ]
       },
       "properties": {
           "prop0": "value0",
           "prop1": 0.0
       }
   }, {
       "type": "Feature",
       "geometry": {
           "type": "Polygon",
           "coordinates": [
               [
                   [100.0, 0.0],
                   [101.0, 0.0],
                   [101.0, 1.0],
                   [100.0, 1.0],
                   [100.0, 0.0]
               ]
           ]
       },
       "properties": {
           "prop0": "value0",
           "prop1": {
               "this": "that"
           }
       }
   }]
}
```
