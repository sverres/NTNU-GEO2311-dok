# Ukeoppgave SQL-spørringer mot PostGIS-base med lokale data

## Opprettelse av ny database og import av data

Innholdet i denne delen av ukeoppgaven er demonstrert i [opptak fra 2015 fra ca: 2:45](https://screencast.uninett.no/relay/ansatt/sverreshig.no/2015/16.10/463400/GEO2311_-_Ukeoppgave_geografiske_databaser_-_intro_-_20151016_112253_39.html) (Se også opptakene om geografiske databaser under uke 46 på siden for *Presentasjoner og opptak*, spesielt *Demo av PostGIS (2015) inkl. analyser*)

1. Lag en ny geografisk database og kall den glt ved hjelp av pgadmin. Se hjelpetekster under PostGIS i dashboard for hvordan du gjør dette (Creating a spatial database).

2. Last ned SQL-filer med data over grunnkretser, bygninger, veier og noen sporlogger: [glt.zip](docs/glt.zip)

3. Kjør SQL-kommandoene fra SQL-filene ved å åpne dem i SQL-vinduet i pgadmin.

4. Gjør deg kjent med QGIS og opprett en forbindelse til databasen ved hjelp av OpenGeoExplorer (Vindu inne i QGIS).

5. Prøv ut noen spørringer, f.eks. disse:

```SQL
- ================================================================================
- Spørringen velger ut bygninger helt innenfor grunnkrets Kirkebyskogen
- og lister ut byggnummer
- ================================================================================
-
SELECT bygning.byggnr
FROM bygning, grunnkrets
WHERE grunnkrets.gkretsnavn= 'KIRKEBYSKOGEN'
AND ST_Contains(grunnkrets.wkb_geometry, bygning.wkb_geometry)

- ================================================================================
- Spørringen velger ut bygninger som ligger på grenselinjen for grunnkrets
- Kirkebyskogen og oppretter en egen tabell for disse.
- ================================================================================
-
CREATE TABLE K3 AS
SELECT bygning.*
FROM bygning, grunnkrets
WHERE grunnkrets.gkretsnavn= 'KIRKEBYSKOGEN'
AND ST_Intersects(grunnkrets.wkb_geometry, bygning.wkb_geometry)
AND NOT ST_Contains(grunnkrets.wkb_geometry, bygning.wkb_geometry)
```

## Dictionary

Databasen glt skal nå inneholde seks tabeller med data fra kommunene Gjøvik, Lillehammer, Østre- og Vestre Toten:

Tabell | Innhold
--- | ---
grunnkrets |Dette er data fra Statistisk Sentralbyrå som inneholder befolkningstall.
sentrumssone |Dette er automatisk beregnede soner (polygoner) som viser sentrumssoner i store tettsteder og byer.  Samme beregning er gjort over flere år, så polygonene er derfor overlappende.
bygning |Dette er alle bygninger I en viss radius rundt B-bygget på HIG.
bygning750 |Dette er alle bygninger med størrelse over 750 kvadratmeter i de fire kommunene.
trackpoint |Dette er et punkttema med GPS tracklog (sporlogg) fra noen sykkelturer mellom Totenvika og Gjøvik.
vbase |Dette er europa-, riks, og fylkesveier.

## Del 1:  Enkle SQL-spørringer

Bruk det du har lært om databaser og SQL-spørringer i IMT2261 til å finne svar på følgende spørsmål:

- Hvor mange kvinner og menn bor det i grunnkretsen Tongjordet?
- Hvor mange grunnkretser er det i Gjøvik? Gjøvik har kommunenummer 502.
- Hvor lang er riksvei 4 i Vestre Toten?
- På hvilken dato startet den første sykkelturen?

## Del 2:  Enkle Simple Features-funksjoner

Se på eksempler i Section 9 i Intro to PostGIS og finn svar på spørsmålet nedenfor:

- Hva er areal og omkrets av grunnkretsen Tongjordet?

- Del 3:  Funksjoner for å teste romlige relasjoner  
Se på eksempler i Section 10 og 11 først.

    - Ligger byggnr 7447868 innenfor Maihaugen grunnkrets?
    - Hvor langt er det fra B-bygget til nærmeste sentrumssone? B-bygget har byggnr. 7482434.
    - Hvor mange hus er det i grunnkretsen Kirkebyskogen?

## Del 4:  Spatial Join

Se på eksemplene i Section 12 og 13 og lag en spatial join mellom trackpoint og grunnkretsen Rambekkmoen slik at du kan

- liste ut GPS-punktene innenfor grunnkretsen.  Prøv om du får til å ordne punktene kronologisk.
- Finne ut hvor mange hus det er i grunnkretsen Kirkebyskogen.

## Del 5:  Konstruere ny geometri

Se på eksemplene i Section 18.

- Lag en ny tabell med følgende SQL-kommando:

```SQL
CREATE TABLE rv4utvalg AS
  SELECT FROM vbas
  WHERE datfgstdat = '05.09.2006';
```
- Lag deretter en buffersone på 100 meter rundt denne veistrekningen og beregn arealet av buffersonen.
- Finn deretter ut arealet av bufferet innefor de grunnkretsene som blir berørt.
- Du må lage en ny tabell ved hjelp av intersect for å få til dette.

## Løsningsforslag

Vil bli lagt ut i Blackboard onsdag 30.11 kl. 10:00.
