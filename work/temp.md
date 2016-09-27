# Ukeoppgave - WMS-kart

- *(Oppdatert 26.09.16 med endrede git-kommandoer. Jeg håper det virker denne gangen.)*

## Målsetting

- laste ned nye filer fra github
- lage eget WMS-kart

## Oppgave

Denne oppgaven forutsetter at du har gjort [git-oppgaven](./git.html) fra uke 35.

Gå til mappen du lagde ved hjelp av GIT (c:\NTNU\NTNU-GEO2311).
Høyreklikk i mappen og velg "GIT Bash here".

I repoet NTNU-GEO2311 har jeg nå opprettet en ny "tråd", i GIT-terminologi kalt "branch". 

Først nullstiller vi ved å gi en kommando som setter GIT til master-branch:

```ini
git checkout master
```

Ved å gi denne kommandoen i Bash GIT-vinduet vil du oppdatere ditt lokale GIT-repo (ligger i en skjult mappe, .git under c:\NTNU\NTNU-GEO2311)

```ini
git fetch origin
```

Filene ligger foreløpig skjult i ditt lokale GIT-repo. Med kommandoen nedenfor vil du
1. opprette en lokal branch, `uke-37`
2. gjøre denne aktiv, og dermed pakke ut filene fra lokalt repo

```ini
git checkout -b uke-37 origin/uke-37
```

Hvis branch `uke-37` er opprettet fra før vil du få feilmelding på denne kommandoen. Da kan du i stedet prøve med denne kommandoen:

```ini
git checkout uke-37
```

Sjekk at mappen og filene er synlige nå.


### Alternativ metode for å laste ned filene uten bruk av GIT-kommandoer

Filene kan lastes ned herfra: [https://github.com/sverres/NTNU-GEO2311/tree/uke-37/2016/uke-37](https://github.com/sverres/NTNU-GEO2311/tree/uke-37/2016/uke-37) ved å:
- først enkelt-klikke på hver enkelt av filene
- trykke på raw-knappen
- høyreklikke og velge «save as» e.l.
***


En av filene er wmskart.html. Den viser et kart over Gjøvik sentrum.
Oppgaven videre går ut på å forandre på koordinatene i BBOX-parameteret i 
denne filen slik at du får et kart over ditt hjemsted.

Bruk [norgeskart.no](https://norgeskart.no) for å finne koordinatene dine
(klikk i kartet, velg deretter i-verktøyet fra den blå sirkelen). Du trenger koordinatparene i UTM32-projeksjonen for nedre venstre og øvre høyre hjørne for kartutsnittet du skal ha. 

Hvis du først finner et punkt som kan være nedre venstre hjørne, kan du deretter legge til f.eks. 500 på både x- og y-koordinatene slik at du får et rektangel på 500x500 meter.

Lykke til!
