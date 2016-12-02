# Løsningsforslag til ukeoppgave i geografiske databaser

```SQL
-- Løsningsforslag til Øvingsoppgave – Geografiske databaser 
-- 29.10.2015 Sverre Stikbakke
-- ================================================================================
-- Del 1 Enkle SQL-spørringer
-- ================================================================================
-- Hvor mange kvinner og menn bor det i grunnkretsen Tongjordet?

SELECT i_alt_2009
FROM grunnkrets
WHERE gkretsnavn = 'TONGJORDET';

-- Svar: 226
-- ================================================================================
-- Hvor mange grunnkretser er det i Gjøvik? Gjøvik har kommunenummer 502.

SELECT count(*)
FROM grunnkrets
WHERE komm = 502;

-- Svar: 129
-- ================================================================================
-- Hvor lang er riksvei 4 i Vestre Toten?

SELECT sum(length)
FROM vbase
WHERE komm = 529 
AND vegkategor = 'R'
AND vegnummer = 4;

-- Svar: 34016.22001
-- ================================================================================
-- På hvilken dato startet den første sykkelturen?

SELECT MIN(DATE(time))
FROM trackpoint;

-- Svar: 2009-05-28
-- ================================================================================
-- Del 2 Enkle Simple Features-funksjoner
-- ================================================================================
-- Hva er areal og omkretsen av grunnkretsen Tongjordet?

SELECT gkretsnavn AS grunnkrets, 
        ST_AREA(wkb_geometry) AS areal, 
        ST_PERIMETER(wkb_geometry) AS omkrets
FROM grunnkrets
WHERE gkretsnavn = 'TONGJORDET';

-- Svar: TONGJORDET  143356.814453125	1693.09750075949
-- ================================================================================
-- Del 3 Funksjoner for å teste romlige relasjoner
-- ================================================================================
-- Ligger byggnr 7447868 innenfor Maihaugen grunnkrets?

SELECT ST_CONTAINS(g1.wkb_geometry, b1.wkb_geometry)
FROM grunnkrets AS g1, bygning750 AS b1
WHERE g1.gkretsnavn = 'MAIHAUGEN' AND b1.byggnr = 7447868;

-- Svar: f  (som betyr false)
-- ================================================================================
-- Hvor langt er det fra B-bygget til nærmeste sentrumssone? B-bygget har byggnr. 7482434.

SELECT MIN(ST_DISTANCE(b1.wkb_geometry, s1.wkb_geometry))
FROM bygning AS b1, sentrumssone AS s1
WHERE b1.byggnr = 7482434;

-- Svar: 214.686394771598
-- ================================================================================
-- Hvor mange hus er det i grunnkretsen Kirkebyskogen?

SELECT count(*) AS antall_hus
FROM grunnkrets AS g1, bygning AS b1
WHERE gkretsnavn = 'KIRKEBYSKOGEN'
AND ST_CONTAINS(g1.wkb_geometry, b1.wkb_geometry);

-- Svar: 382
-- ================================================================================
-- Del 4 Spatial Join
-- ================================================================================
-- GPS-punktene innenfor grunnkretsen Rambekkmoen (de 5 første):

SELECT time
FROM trackpoint AS t1
JOIN grunnkrets AS g1
ON ST_WITHIN(t1.wkb_geometry, g1.wkb_geometry)
WHERE g1.gkretsnavn= 'RAMBEKKMOEN'
ORDER BY time
LIMIT 5;

-- Svar:
-- 2009-05-28 07:59:28+02
-- 2009-05-28 07:59:29+02
-- 2009-05-28 07:59:30+02
-- 2009-05-28 07:59:31+02
-- 2009-05-28 07:59:32+02
-- ================================================================================
-- Hvor mange hus er det i grunnkretsen Kirkebyskogen?

SELECT count(*) AS antall_hus
FROM grunnkrets AS g1
JOIN bygning AS b1
ON ST_Contains(g1.wkb_geometry, b1.wkb_geometry)
WHERE g1.gkretsnavn= 'KIRKEBYSKOGEN';

-- Svar: 382
-- ================================================================================
-- Del 5 Konstruere ny geometri
-- ================================================================================
-- Lag en ny tabell med følgende SQL-kommando:

CREATE TABLE rv4 AS
SELECT *
FROM vbase
WHERE datfgstdat = '05.09.2006';

-- ================================================================================
-- Lag deretter en buffersone på 100 meter rundt denne veistrekningen og beregn arealet av buffersonen.

CREATE TABLE rv4buffer AS
SELECT ST_BUFFER(wkb_geometry, 100) AS wkb_geometry
FROM rv4;

-- Dette ble mange buffersoner som delvis overlapper hverandre
-- ================================================================================
-- Samler alle polygoner til ett med denne kommandoen:

CREATE TABLE rv4single_buffer AS
SELECT ST_UNION(wkb_geometry) AS wkb_geometry
FROM rv4buffer;

-- ================================================================================
-- Beregner arealet av hele bufferet:

SELECT ST_AREA(wkb_geometry) AS areal
FROM rv4single_buffer;

-- Svar: 926825.853271484 m2
-- ================================================================================
-- Bruker intersection for å få inn grunnkretsgrensene i buffersonen
-- Legg merke til bruken av både ST_INTERSECTION og ST_INTERSECT

CREATE TABLE rv4grunnkrets AS
SELECT ST_INTERSECTION(b1.wkb_geometry, g1.wkb_geometry) AS wkb_geometry,
        g1.gkretsnavn	
FROM rv4single_buffer AS b1, grunnkrets AS g1
WHERE ST_INTERSECTS(b1.wkb_geometry, g1.wkb_geometry);

-- ================================================================================
-- Areal i hver grunnkrets:

SELECT gkretsnavn AS grunnkrets, 
        ST_AREA(wkb_geometry) AS areal
FROM rv4grunnkrets;

-- Svar:
-- DJUPDALSBAKKEN                	4837.7958984375
-- SYREHAUGEN                    	297328.273681641
-- NYGARD                        	9800.1708984375
-- HOLMEN-KALLERUD               	23083.7705078125
-- ØYKÅSEN                       	414597.080566406
-- GØTTHAUG                      	177178.762695312
-- ================================================================================
```