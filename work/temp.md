# Ukeoppgave - WMS-kart

## Målsetting

- laste ned nye filer fra github
- lage eget WMS-kart

## Oppgave

Denne oppgaven forutsetter at du har gjort [git-oppgaven](./git.html) fra uke 35.

Gå til mappen du lagde ved hjelp av GIT (c:\NTNU\NTNU-GEO2311).
Høyreklikk i mappen og velg "GIT Bash here".

I repoet NTNU-GEO2311 har jeg nå opprettet en ny "tråd", i GIT-terminologi kalt "branch". 
Ved å gi denne kommandoen i Bash GIT-vinduet vil du laste ned mappen uke-37 med 5 filer:

```ini
git fetch https://github.com/sverres/NTNU-GEO2311.git uke-37
```

Filene er foreløpig ikke synlige. Men de blir synlige når du bytter over til branch "uke-37":

**Jeg beklager, men koden nedenfor virker ikke som tenkt. Jeg ser på saken og oppdaterer når jeg finner ut av det.**

(I mellomtiden kan filene lastes ned ved herfra: [https://github.com/sverres/NTNU-GEO2311/tree/uke-37/2016/uke-37](https://github.com/sverres/NTNU-GEO2311/tree/uke-37/2016/uke-37) ved å:
- først enkelt-klikke på hver enkelt av filene
- trykke på raw-knappen
- høyreklikke og velge «save as» e.l.
)

```ini
git checkout uke-37
```

Sjekk at mappen og filene er synlige nå.

En av filene er wmskart.html. Den viser et kart over Gjøvik sentrum.
Oppgaven videre går ut på å forandre på koordinatene i BBOX-parameteret i 
denne filen slik at du får et kart over ditt hjemsted.

Bruk [norgeskart.no](https://norgeskart.no) for å finne koordinatene dine
(klikk i kartet, velg deretter i-verktøyet fra den blå sirkelen). Du trenger koordinatparene i UTM32-projeksjonen for nedre venstre og øvre høyre hjørne for kartutsnittet du skal ha. 

Hvis du først finner et punkt som kan være nedre venstre hjørne, kan du deretter legge til f.eks. 500 på både x- og y-koordinatene slik at du får et rektangel på 500x500 meter.

Lykke til!
