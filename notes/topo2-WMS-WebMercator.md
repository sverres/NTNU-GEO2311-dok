# Noen observasjoner om bruk av Web Mercator-projeksjonen i topo2-WMS fra Kartverket

## UTM sone 32 og Web Mercator på kart over Lille Lungegårdsvann i Bergen

- Se [Oblig 1 - del 4](http://folk.ntnu.no/helenekd/Oblig%201/projeksjon.html) av Helene Konstantine Thømt Dunlop
og legg merke til forskjellen i detaljeringsgraden i de to kartene. Legg også merke til om det er noen deformasjoner/forskjeller i geometrien i de to kartene (her kan det være nyttig å sjekke hvilke egenskaper de to projeksjonene har, for å finne en forklaring på at kartene framstår som relativt like i geometrien.)

- Når det kommer til avstander som kan måles i kartet er det ganske store forskjeller mellom disse.
Her er noen målinger jeg gjorde på min 25 tommers kontor-skjerm:

Projeksjon |Kartbildets **bredde** på min skjerm |Kartbildets bredde målt ut fra koordinatene i kartet | Beregnet målestokk
--- |--- |--- |---
[UTM32/WGS84](http://openwms.statkart.no/skwms1/wms.topo2?VERSION=1.3.0&REQUEST=GetMap&CRS=EPSG:32632&BBOX=296985,6700052,298159,6701304&WIDTH=600&HEIGHT=600&LAYERS=topo2_WMS&FORMAT=image/png) |14,8 cm | 1174 m | 1:7932
[Web Mercator](http://openwms.statkart.no/skwms1/wms.topo2?VERSION=1.3.0&REQUEST=GetMap&CRS=EPSG:3857&BBOX=591648,8486184,594097,8488748&WIDTH=600&HEIGHT=600&LAYERS=topo2_WMS&FORMAT=image/png) |14,8 cm |2449 m | 1:16547

Projeksjon |Kartbildets **høyde** på min skjerm |Kartbildets høyde målt ut fra koordinatene i kartet | Beregnet målestokk
--- |--- |--- |---
[UTM32/WGS84](http://openwms.statkart.no/skwms1/wms.topo2?VERSION=1.3.0&REQUEST=GetMap&CRS=EPSG:32632&BBOX=296985,6700052,298159,6701304&WIDTH=600&HEIGHT=600&LAYERS=topo2_WMS&FORMAT=image/png) |14,8 cm | 1252 m | 1:8459
[Web Mercator](http://openwms.statkart.no/skwms1/wms.topo2?VERSION=1.3.0&REQUEST=GetMap&CRS=EPSG:3857&BBOX=591648,8486184,594097,8488748&WIDTH=600&HEIGHT=600&LAYERS=topo2_WMS&FORMAT=image/png) |14,8 cm |2564 m | 1:17324

- Avstanden målt i Web Mercator i øst-vest-retning blir litt i overkant av det dobbelte av avstander målt i UTM sone 32 (109% større - i nord-sør-retning er den 105% større). Dette medfører igjen at arealer blir mer enn fire ganger større beregnet ut fra Web Mercator-koordinater.

## Et lite eksperiment

Kartverkets topo2-WMS-tjeneste viser forskjellig detaljeringsgrad avhengig av beregnet målestokk i bildet. Ved å øke størrelsen på Web-merkator-bildet til det dobbelte får man skjerm-målestokker som blir ganske like i de to projeksjonene (klikk på lenken under *Projeksjon*):

Projeksjon |Kartbildets **bredde** på min skjerm |Kartbildets bredde målt ut fra koordinatene i kartet | Beregnet målestokk
--- |--- |--- |---
[UTM32/WGS84](http://openwms.statkart.no/skwms1/wms.topo2?VERSION=1.3.0&REQUEST=GetMap&CRS=EPSG:32632&BBOX=296985,6700052,298159,6701304&WIDTH=600&HEIGHT=600&LAYERS=topo2_WMS&FORMAT=image/png) |14,8 cm | 1174 m | 1:7932
[Web Mercator](http://openwms.statkart.no/skwms1/wms.topo2?VERSION=1.3.0&REQUEST=GetMap&CRS=EPSG:3857&BBOX=591648,8486184,594097,8488748&WIDTH=1200&HEIGHT=1200&LAYERS=topo2_WMS&FORMAT=image/png) |29,6 cm |2449 m | 1:8274

Dette viser at når det brukes samme målestokk-områder for en bestemt detaljeringsgrad i kartet får vi i Web Mercator-projeksjonen kart som framstår som svært sparsommelige i sitt innhold. En mulig løsning på dette problemet kunne være at Kartverket opprettet en egen WMS-tjeneste for Web Mercator-projeksjonen med andre målestokk-grenser for hvilket kartinnhold som skal vises.
