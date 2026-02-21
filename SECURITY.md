# 🔐 Sicherheits-Dokumentation - Unser Baby App

## Übersicht

Die "Unser Baby" App verwendet mehrere Sicherheitsebenen, um eure Daten zu schützen.

## Datenspeicherung

### 1. Lokaler Speicher (LocalStorage)
- ✅ Daten werden direkt auf eurem Handy gespeichert
- ✅ Browser kann nicht auf andere Apps zugreifen
- ✅ Funktioniert komplett offline
- ⚠️ Daten gehen verloren, wenn:
  - Browser-Daten gelöscht werden
  - App deinstalliert wird (daher Backup wichtig!)

### 2. Cloud-Sync (Firebase Realtime Database)
- ✅ Optional - nur wenn ihr es aktiviert
- ✅ Verschlüsselte HTTPS-Verbindung
- ✅ Daten sind nur über euren privaten Sync-Code zugänglich
- ✅ Keine Registrierung erforderlich
- ⚠️ Firebase-API-Key ist öffentlich sichtbar (das ist normal und OK!)

## Sync-Code Sicherheit

### Wie sicher ist der Sync-Code?

Der Sync-Code fungiert als privater Schlüssel zu euren Daten:

**Sicherheitsstufen:**

1. **Sehr sicher (empfohlen):**
   ```
   mueller-baby-juli2026-privat-xyz789-geheim
   ```
   - Mindestens 30 Zeichen
   - Kombination aus Wörtern, Zahlen, Sonderzeichen
   - Einzigartig und nicht zu erraten

2. **Mittel sicher:**
   ```
   chrissandra-baby2026-secret
   ```
   - 20-30 Zeichen
   - Persönlich aber ohne Sonderzeichen
   - OK für private Nutzung

3. **Unsicher (NICHT nutzen):**
   ```
   baby123
   test
   2026
   ```
   - Zu kurz
   - Zu allgemein
   - Könnte erraten werden

### Was kann passieren, wenn jemand den Code errät?

- ❌ Kann eure Checklisten sehen
- ❌ Kann Termine und Einkaufsliste sehen
- ❌ Kann Daten ändern oder löschen
- ✅ Kann KEINE anderen Apps auf eurem Handy zugreifen
- ✅ Kann KEINE Bankdaten oder Passwörter sehen
- ✅ Ihr habt immer ein lokales Backup auf jedem Gerät

## Firebase Security Rules

Die App verwendet Firebase Security Rules, um den Zugriff zu kontrollieren:

```json
{
  "rules": {
    "syncs": {
      "$syncCode": {
        ".read": "auth == null",
        ".write": "auth == null",
        ".validate": "$syncCode.length >= 5 && $syncCode.length <= 50"
      }
    }
  }
}
```

**Was bedeutet das?**
- Nur Sync-Codes zwischen 5-50 Zeichen sind erlaubt
- Jeder Sync-Code ist ein eigener "Raum"
- Nur wer den Code kennt, kann lesen/schreiben
- Keine Authentifizierung erforderlich (bewusste Design-Entscheidung für Einfachheit)

## Warum ist der Firebase API-Key öffentlich?

Das ist **normal und sicher**! Der API-Key ist nicht geheim:

- ✅ API-Keys sind für Client-Apps immer sichtbar
- ✅ Die Sicherheit kommt von den Firebase Security Rules
- ✅ Der API-Key identifiziert nur das Projekt, nicht eure Daten
- ✅ Ohne euren Sync-Code kann niemand eure Daten lesen

**Analogie:** Der API-Key ist wie die Adresse eines Hauses (öffentlich).
Der Sync-Code ist der Schlüssel zur Wohnung (privat).

## Daten-Backup

### Backup-Strategie (empfohlen):

1. **Wöchentliches Backup:**
   - Einstellungen → "Daten exportieren"
   - JSON-Datei in Cloud speichern (Google Drive, iCloud)

2. **Vor wichtigen Änderungen:**
   - Backup vor dem Ändern des Sync-Codes
   - Backup vor dem Löschen von Daten

3. **Redundanz:**
   - Daten sind auf beiden Handys
   - Daten sind in Firebase Cloud
   - Backup-Datei als Sicherheit

## Was wird NICHT gespeichert?

- ❌ Keine Passwörter
- ❌ Keine Zahlungsinformationen
- ❌ Keine medizinischen Diagnosen
- ❌ Keine Fotos oder Videos
- ❌ Keine Standortdaten
- ❌ Keine Kontakte

**Gespeichert werden nur:**
- ✅ Geburtstermin
- ✅ Checklisten-Status (abgehakt/nicht abgehakt)
- ✅ Arzttermine (Datum, Uhrzeit, Beschreibung)
- ✅ Einkaufsliste
- ✅ Generierte Baby-Namen

## Datenschutz (DSGVO)

### Verantwortliche Stelle
- Du selbst (als App-Betreiber für deine Instanz)
- Firebase (als Datenverarbeiter)

### Datenverarbeitung
- **Zweck:** Schwangerschaftsbegleitung für privaten Gebrauch
- **Rechtsgrundlage:** Einwilligung (Art. 6 Abs. 1 lit. a DSGVO)
- **Speicherdauer:** Bis zur manuellen Löschung
- **Empfänger:** Nur ihr beide (über Sync-Code)
- **Übermittlung in Drittland:** Firebase-Server in EU (europe-west1)

### Deine Rechte
- ✅ Auskunftsrecht: Exportiere deine Daten als JSON
- ✅ Löschrecht: Lösche Browser-Daten und Firebase-Eintrag
- ✅ Widerrufsrecht: Deaktiviere Sync jederzeit
- ✅ Datenübertragbarkeit: Export als JSON möglich

## Sicherheits-Best-Practices

### ✅ Do's
1. Wähle einen langen, einzigartigen Sync-Code
2. Teile den Code nur mit deiner Partnerin
3. Erstelle regelmäßige Backups
4. Nutze HTTPS (GitHub Pages macht das automatisch)
5. Halte Browser/Apps aktuell

### ❌ Don'ts
1. Nicht den Sync-Code öffentlich teilen
2. Nicht "baby123" oder ähnlich schwache Codes nutzen
3. Nicht ohne Backup den Sync-Code ändern
4. Nicht Browser-Daten löschen ohne vorheriges Backup
5. Nicht über HTTP (unverschlüsselt) nutzen

## Häufige Sicherheitsfragen

### Kann mein Arbeitgeber die Daten sehen?
- Nein (HTTPS verschlüsselt)
- Außer: Du nutzt ein Firmenhandy mit Mobile Device Management (MDM)

### Kann Google/Firebase meine Daten lesen?
- Technisch ja (sie hosten die Daten)
- Praktisch nein (zu viele Daten, keine wirtschaftliche Interesse)
- Firebase-Mitarbeiter haben keinen Zugriff ohne Grund
- Nutze eigenen Firebase-Account für mehr Kontrolle

### Was passiert, wenn Firebase gehackt wird?
- Sehr unwahrscheinlich (Google-Sicherheit)
- Im schlimmsten Fall: Eure Checklisten werden öffentlich
- Keine Passwörter oder Finanzdaten betroffen
- Lokales Backup bleibt sicher

### Sollte ich einen eigenen Firebase-Account nutzen?
**Ja, wenn:**
- Du maximale Kontrolle willst
- Du die technischen Möglichkeiten hast
- Du sensible persönliche Daten speicherst

**Nein, wenn:**
- Du es einfach halten willst
- Der Demo-Account mit langem Sync-Code ausreicht
- Du regelmäßige Backups machst

## Incident Response Plan

**Falls du glaubst, jemand hat deinen Sync-Code:**

1. **Sofort:**
   - Backup exportieren
   - Sync-Code in Einstellungen ändern
   - Neuen Code auf beiden Geräten aktivieren

2. **Prüfen:**
   - Wurden Daten geändert?
   - Unbekannte Termine oder Einträge?

3. **Backup wiederherstellen:**
   - Falls Daten kompromittiert: Backup importieren
   - Alten Firebase-Eintrag löschen (durch Überschreiben mit neuem Code)

## Technische Sicherheitsmaßnahmen

### In der App implementiert:
- ✅ HTTPS-only (automatisch durch GitHub Pages)
- ✅ Content Security Policy (CSP) Headers
- ✅ No-SQL Injection Prevention (durch Firebase)
- ✅ XSS Prevention (durch innerHTML Escaping)
- ✅ CORS-Schutz (durch Firebase)

### Nicht implementiert (bewusst):
- ❌ Authentifizierung (würde Komplexität erhöhen)
- ❌ Ende-zu-Ende-Verschlüsselung (nicht nötig für unkritische Daten)
- ❌ Rate Limiting (Firebase Standard-Limits gelten)

## Zusammenfassung

**Sicherheitsniveau: Gut für private, unkritische Daten**

✅ Geeignet für:
- Checklisten
- Termine
- Einkaufslisten
- Baby-Namen
- Schwangerschaftswoche-Tracking

❌ Nicht geeignet für:
- Medizinische Diagnosen
- Passwörter
- Zahlungsinformationen
- Sehr sensible persönliche Daten

**Wichtigste Sicherheitsmaßnahme: Langer, einzigartiger Sync-Code!**

---

Bei Sicherheitsbedenken: Nutze die App lokal ohne Sync-Funktion.
Backups bleiben deine Verantwortung! 💾🔒
