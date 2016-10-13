# Ukeoppgave med Open Layers

## 1. Last ned filer

Filer for denne ukeopppgaven kan lastes ned herfra: [uke-41.zip](./docs/uke-41.zip)

Pakk ut zip-filen og sjekk at filene havner i fire mapper. I hver mappe er det både html-fil og javascript-fil.
Sjekk at du får opp websider med topo2-kart fra alle mappene.

## 2. Beregn målestokk for PC-skjermen.

Målestokk er definert som

`avstand på kartet / avstand i terrenget`

Avstand på kartet kan vi "oversette" til avstand på PC-skjermen. PC-skjermen er delt opp i bildepunkter, pixels på engelsk.
Open Layers resolution-verdier er avstanden i terrenget for en enkelt pixel. I UTM-projeksjonene er denne avstanden oppgitt i meter.
En resolution-verdi på 20 betyr dermed at en pixel dekker 20 meter i terrenget.

Ved hjelp av passende Google-søk - prøv å finn ut hvor store pixlene er på din PC-skjerm.
Hva blir målestokken på din PC-skjerm hvis resolution i Open Layers er satt til 20?

## 3. Lag et WMS-kart med målestokk 1:1000.

Oppgaven består i å finne resolution-verdien som gir målestokken 1:1000. Test ut dette ved å justere på verdiene i wms.js i mappen WMS-resolution.

## 4. Tilpass Open Layers WMTS-eksempel til å vise flere Zoom-nivåer.

I mappen WMTS ligger det et eksempel på webkart som bruker Kartverkets WMTS-tjeneste for topografisk norgeskart. Eksemplet viser bare 9 zoom-nivåer.
For å få vist større deler av Norge må du endre på javascript-filen slik at den viser flere zoom-nivåer.

Selv om du legger inn flere zoom-nivåer, kan du likevel ikke se hele Norge, på grunn av en begrensing i extent.
Gjør nødvendige endringer i extent slik at hele Norge kan vises.

