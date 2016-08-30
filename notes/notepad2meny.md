# Notepad 2 mod

Notepad 2 mod er en modifisert versjon av tekstbehandleren Notepad 2 som igjen er laget med å være en erstatter for Windows Notepad.

![kontekstmeny](../images/tools/notepad2logo.png)

Gode grunner for å bruke Notepad 2 mod:

- rask
- håndtererer linjeskift på en god måte (viktig ved visning av filer)
- har fargekoding av programkode for å gi god oversikt over strukturen i koden
- har "code folding" - kan skjule deler av koden

Kontektsmeny vil si en meny som er tilpasset situasjonen (konteksten) du er i. For eksempel så kan menyen ha ulike valg avhengig av hvilken filtype du ser på. En type kontekstmeny kommer fram hvis du høyreklikker på en fil i en Windows-mappe.

## Hvordan legge til Notepad2 som et valg i kontekstmenyen?

- Notepad 2 mod må være installert
- Kopier inn teksten nedenfor i en tom fil i Notepad 2 mod

```
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\Classes\*\shell\Notepad2]
@="&Notepad2"

[HKEY_LOCAL_MACHINE\SOFTWARE\Classes\*\shell\Notepad2\command]
@="\"C:\\Program Files\\Notepad2\\notepad2.exe\" \"%1\" %*"
```

- lagre filen som notepad-meny.reg
- klikk på filen og kjør notepad-meny.reg (du vil få en advarsel, men du kan kjøre denne filen)
- høyreklikk på noen ulike filtyper og sjekk at du har valget Notepad2 på kontekstmenyen (Det skal normalt vises på alle filtyper).

Slik kan kontekstmenyen se ut:

![kontekstmeny](../images/tools/notepad2meny.png)
