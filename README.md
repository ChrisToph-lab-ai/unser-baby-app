# 👶 Unser Baby - Vollständige Schwangerschafts-Begleiter App

Eine Progressive Web App für werdende Eltern in Deutschland - installierbar auf beiden Smartphones mit automatischer Synchronisation.

## 🎉 Alle Features

### ⏰ Basis-Features
- Countdown bis zum Geburtstermin
- Schwangerschaftswoche-Anzeige
- Mutterschutz-Berechnung
- Tipp des Tages
- Täglicher Fokus

### ✅ Checklisten
- 2. Trimester (SSW 13-27) - 9 Aufgaben
- 3. Trimester (SSW 28-40) - 8 Aufgaben
- Behörden-Checkliste Deutschland - 7 Aufgaben
- Fortschrittsbalken für jede Liste

### 📅 Arzttermine
- Termin-Kalender mit Datum & Uhrzeit
- Sortierte Ansicht (chronologisch)
- "HEUTE"-Badge für aktuelle Termine
- Vergangene Termine werden ausgeblendet
- Termine löschen möglich
- **NEU:** Erinnerungen 24h vor Termin

### 🛒 Einkaufsliste Baby-Erstausstattung
- Vordefinierte Liste mit 20 Standard-Artikeln
- Kategorisiert: Kleidung, Möbel, Pflege, Unterwegs, Füttern
- Eigene Artikel hinzufügen
- Erledigte Artikel abhaken
- Artikel aus eigener Liste löschen

### 👕 Baby-Größenrechner
- Automatische Berechnung basierend auf Geburtstermin
- Zeigt Größen für 0-12 Monate
- Mit geschätztem Datum und Gewicht
- Größen: 50/56, 56/62, 62/68, 68/74, 74/80, 80/86

### 🎵 Baby-Namen Generator
- 30 beliebte deutsche Jungennamen
- Mit Bedeutung und Beliebtheitsgrad
- Zufallsgenerator
- Verlauf der letzten 5 Vorschläge
- Namen wie: Leon, Noah, Elias, Paul, Felix, etc.

### ⏱️ Geburtstag-Features
- Wehen-Timer mit 5-1-1 Regel
- Abstands-Berechnung zwischen Wehen
- Automatische Warnung bei kritischen Abständen
- Kliniktaschen-Checkliste

### 👶 Neugeborenen-Tracker
- Fütterungen protokollieren
- Windel-Tracker
- Zeitstempel für alle Einträge
- Wird automatisch nach Geburt aktiviert

### 📚 Entwicklungsinformationen
- Wöchentliche Updates zur Baby-Entwicklung
- Schwangerschaftswochen 14-40
- Babywocheninfo nach Geburt (0-8 Wochen)

### 🔄 Cloud-Synchronisation
- Automatischer Sync zwischen 2 Geräten
- Firebase Realtime Database
- Privater Sync-Code (5-50 Zeichen)
- Echtzeit-Updates
- Bidirektional
- **Sicher:** Siehe [SECURITY.md](SECURITY.md)

### 📱 PWA Features
- Installierbar auf iOS & Android
- Funktioniert offline
- Home-Screen Icon
- Standalone-Modus
- Service Worker Caching

### 💾 Backup & Export
- Daten als JSON exportieren
- JSON-Backup importieren
- Alle Daten enthalten
- Datum im Dateinamen

### ⚙️ Einstellungen
- Konfigurierbarer Geburtstermin
- Sync-Aktivierung
- Install-Button (wenn verfügbar)
- Export/Import-Funktionen

## 📁 Projekt-Struktur

```
Daddy_App/
├── Daddy_App.html          # Haupt-App (alle Features)
├── manifest.json           # PWA Manifest
├── sw.js                   # Service Worker
├── icon-192.png           # App Icon 192x192
├── icon-512.png           # App Icon 512x512
├── generate-icons.html    # Icon-Generator-Tool
├── SETUP.html             # Installationsanleitung (Browser)
├── README.md              # Diese Datei
├── DEPLOYMENT.md          # GitHub Pages Anleitung
├── SECURITY.md            # Sicherheits-Dokumentation
├── IMPLEMENTATION.md      # Feature-Details
├── firebase-rules.json    # Firebase Security Rules
└── start-server.bat       # Lokaler Test-Server
```

## 🚀 Quick Start

### 1. Icons generieren
```bash
# Öffne im Browser:
generate-icons.html
# Downloade beide PNG-Dateien
```

### 2. Online stellen (GitHub Pages)
```bash
# Repository: https://github.com/ChrisToph-lab-ai/unser-baby-app
# Siehe DEPLOYMENT.md für Details
```

### 3. Auf Handys installieren
- **iPhone:** Safari → Teilen → "Zum Home-Bildschirm"
- **Android:** Chrome → Menü → "App installieren"

### 4. Sync aktivieren
- Beide Geräte: Einstellungen → denselben Sync-Code eingeben
- Code mind. 20 Zeichen: `mueller-baby-juli2026-geheim-xyz`

## 🔐 Sicherheit

### Datenschutz
- ✅ Daten lokal auf deinem Gerät (LocalStorage)
- ✅ Optional: Cloud-Sync mit privatem Code
- ✅ HTTPS-Verschlüsselung
- ✅ Keine Registrierung erforderlich
- ✅ Firebase Security Rules aktiv

### Best Practices
1. **Langen Sync-Code wählen** (mind. 20 Zeichen)
2. **Regelmäßige Backups** (wöchentlich empfohlen)
3. **Sync-Code nicht teilen** (außer mit Partner)
4. **Eigenen Firebase-Account** für maximale Sicherheit

**Details:** Siehe [SECURITY.md](SECURITY.md)

## 📖 Dokumentation

| Datei | Beschreibung |
|-------|-------------|
| [SETUP.html](SETUP.html) | Schritt-für-Schritt Installationsanleitung |
| [DEPLOYMENT.md](DEPLOYMENT.md) | GitHub Pages & Firebase Setup |
| [SECURITY.md](SECURITY.md) | Sicherheit & Datenschutz |
| [IMPLEMENTATION.md](IMPLEMENTATION.md) | Feature-Details & Tipps |

## 🛠️ Technologie

- **Frontend:** HTML5, CSS3, JavaScript (Vanilla)
- **PWA:** Manifest, Service Worker
- **Cloud:** Firebase Realtime Database
- **Hosting:** GitHub Pages (HTTPS)
- **Storage:** LocalStorage + Cloud Backup
- **Offline:** Vollständig offline-fähig

## 📱 Kompatibilität

### Getestet auf:
- ✅ iPhone (iOS 14+) - Safari
- ✅ Android (10+) - Chrome
- ✅ Desktop - Chrome, Firefox, Edge

### PWA Installation:
- ✅ iOS Safari (Add to Home Screen)
- ✅ Android Chrome (Install App)
- ⚠️ Desktop Chrome (Eingeschränkt)

## 🎨 Anpassungen

### App-Name ändern
1. [Daddy_App.html:11](Daddy_App.html#L11) - Browser-Titel
2. [Daddy_App.html:158](Daddy_App.html#L158) - Header
3. [manifest.json:2-3](manifest.json#L2-L3) - App-Name

### Firebase-Konfiguration
1. Eigenes Firebase-Projekt erstellen (siehe DEPLOYMENT.md)
2. [Daddy_App.html:731-732](Daddy_App.html#L731-L732) - API Key & Database URL
3. Firebase Rules hochladen (firebase-rules.json)

### Farben anpassen
- Primärfarbe: `#4facfe` (Blau)
- Sekundärfarbe: `#667eea` (Lila)
- Hintergrund: Gradient (#667eea → #764ba2)

## 🐛 Troubleshooting

### App lädt nicht
- Browser-Cache leeren
- Service Worker deregistrieren
- HTTPS prüfen

### Sync funktioniert nicht
- Internet-Verbindung prüfen
- Beide Geräte: Identischer Sync-Code
- Firebase-Konfiguration prüfen
- Browser-Console für Fehler öffnen (F12)

### PWA installiert sich nicht
- HTTPS erforderlich (GitHub Pages OK)
- manifest.json erreichbar prüfen
- Chrome/Safari nutzen (nicht Firefox)

### Daten sind weg
- Backup importieren
- Anderes Gerät prüfen (Sync)
- LocalStorage nicht gelöscht?

## 📊 Daten-Umfang

Die App speichert:
- Geburtstermin
- Checklisten-Status (21 Items)
- Arzttermine (unbegrenzt)
- Einkaufsliste (20 Standard + eigene)
- Generierte Namen (letzte 5)

**Speichergröße:** ~5-10 KB (sehr klein!)

## 🔄 Updates

### Version 2.0 (aktuell)
- ✅ Arzttermin-Kalender
- ✅ Einkaufsliste Baby-Erstausstattung
- ✅ Baby-Größenrechner
- ✅ Baby-Namen Generator (deutsche Jungennamen)
- ✅ Verbesserte Sync-Funktion
- ✅ Sicherheits-Dokumentation
- ✅ Deployment-Guide

### Version 1.0
- Checklisten (2. & 3. Trimester)
- Behörden-Checkliste
- Wehen-Timer
- Neugeborenen-Tracker
- PWA-Funktionalität
- Cloud-Sync

## 💡 Zukünftige Features (optional)

- 📸 Foto-Tagebuch
- 💰 Baby-Budget Tracker
- 🎨 Themenwechsel (Dark Mode)
- 🌍 Mehrsprachigkeit
- 📊 Statistiken & Grafiken
- 🔔 Push-Benachrichtigungen
- 👨‍👩‍👧‍👦 Multi-User (mehr als 2 Personen)

## 🤝 Beitragen

Dies ist ein privates Projekt, aber Feedback ist willkommen:
- Issues auf GitHub erstellen
- Pull Requests sind willkommen
- Verbesserungsvorschläge gerne

## 📜 Lizenz

Privates Projekt für persönliche Nutzung.
Keine kommerzielle Nutzung ohne Genehmigung.

## 💙 Credits

- App-Konzept: Für werdende Eltern
- Design: Material Design inspiriert
- Icons: Emoji (plattformabhängig)
- Daten: Öffentliche Schwangerschaftsinfos

## 📧 Kontakt

Bei Fragen oder Problemen:
- GitHub Issues erstellen
- README & Dokumentation prüfen
- Browser-Console für Debug-Info (F12)

---

**Entwickelt mit ❤️ für werdende Eltern**

**Viel Erfolg auf eurem Weg zum Baby! 👶💙**
