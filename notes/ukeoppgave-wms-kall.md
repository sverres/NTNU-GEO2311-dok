# Ukeoppgave - WMS-kall

- *(Vi prøver igjen med GIT-kommandoer. Jeg håper disse virker. Gi beskjed hvis de ikke gjør det.)*

## Målsetting

- laste ned nye filer fra github
- prøv ut WMS-kall fra nedlastet fil

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
1. opprette en lokal branch, `uke-39`
2. gjøre denne aktiv, og dermed pakke ut filene fra lokalt repo

```ini
git checkout -b uke-39 origin/uke-39
```

Hvis branch `uke-39` er opprettet fra før vil du få feilmelding på denne kommandoen. Da kan du i stedet prøve med denne kommandoen:

```ini
git checkout uke-39
```

Sjekk at mappen og filen er synlige nå.

Du skal nå ha mappen uke-39 under 2016-mappen.  Finn filen med WMS-kallene og test ut disse i nettleseren - slik som vist på demoen.

### Alternativ metode for å laste ned fil uten bruk av GIT-kommandoer

Filene kan lastes ned herfra: [https://github.com/sverres/NTNU-GEO2311/tree/uke-39/2016/uke-39](https://github.com/sverres/NTNU-GEO2311/tree/uke-39/2016/uke-39) ved å:
- først enkelt-klikke på hver enkelt av filene
- trykke på raw-knappen
- høyreklikke og velge «save as» e.l.
***


Lykke til!
