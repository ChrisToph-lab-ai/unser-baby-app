# 🚀 Deployment Guide - GitHub Pages

## Schritt-für-Schritt Anleitung

### 1. Firebase Setup (für Cloud-Sync)

Die App verwendet aktuell einen Demo-Firebase-Account. Für echte Sicherheit solltest du deinen eigenen Firebase-Account erstellen:

#### Option A: Eigenes Firebase-Projekt (empfohlen für volle Sicherheit)

1. Gehe zu https://console.firebase.google.com/
2. Klicke auf "Projekt hinzufügen"
3. Name: z.B. "unser-baby-app"
4. Google Analytics: Optional (kannst du deaktivieren)
5. Projekt erstellen

**Realtime Database aktivieren:**
1. Im linken Menü: "Build" → "Realtime Database"
2. "Datenbank erstellen"
3. Standort: europe-west1 (Frankfurt)
4. Sicherheitsregeln: Im **Testmodus** starten (später ändern wir das)

**Security Rules konfigurieren:**
1. Im "Regeln"-Tab folgende Regeln einfügen:

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

2. "Veröffentlichen" klicken

**API-Schlüssel in App eintragen:**
1. Firebase Console → Projekteinstellungen (Zahnrad-Symbol)
2. Scrolle zu "Deine Apps"
3. Klicke auf "</>" (Web-App)
4. App registrieren: Name "Unser Baby"
5. Kopiere `apiKey` und `databaseURL`
6. In `Daddy_App.html` Zeile 731-732 ersetzen:

```javascript
firebase.initializeApp({
    apiKey: "DEIN-API-KEY-HIER",
    databaseURL: "DEINE-DATABASE-URL-HIER"
});
```

#### Option B: Demo-Account nutzen (schneller, aber weniger sicher)

Die App funktioniert mit dem vorhandenen Demo-Account, aber:
- ⚠️ Andere könnten theoretisch auf eure Daten zugreifen, wenn sie den Sync-Code erraten
- ✅ Für private Nutzung mit einem langen, einzigartigen Sync-Code OK
- ✅ Keine eigene Firebase-Konfiguration nötig

**Wichtig:** Wähle einen langen, einzigartigen Sync-Code wie:
- `mueller-baby-juli2026-geheim-12345` (gut)
- `baby123` (schlecht - zu einfach zu erraten)

### 2. GitHub Repository vorbereiten

**Auf dem richtigen GitHub-Account:**

1. Gehe zu https://github.com/ChrisToph-lab-ai
2. Logge dich ein
3. Klicke auf "New Repository" (grüner Button)
4. Repository-Name: `unser-baby-app`
5. Beschreibung: "Private Schwangerschafts-App für werdende Eltern"
6. **Wichtig:** Wähle "Public" (GitHub Pages funktioniert nur bei Public oder mit GitHub Pro)
7. Haken bei "Add README" NICHT setzen
8. "Create repository" klicken

### 3. Code hochladen

**Option A: Mit Git (empfohlen):**

```bash
# Im Terminal/PowerShell:
cd C:\Users\I526653\Documents\GitHub\personal_cnoetel\Daddy_App

# Git initialisieren (falls noch nicht geschehen)
git init

# Remote hinzufügen (WICHTIG: Deine URL verwenden!)
git remote add origin https://github.com/ChrisToph-lab-ai/unser-baby-app.git

# Alle Dateien hinzufügen
git add .

# Commit erstellen
git commit -m "Initial commit - Unser Baby App mit allen Features"

# Hochladen
git push -u origin main
```

Falls du "main" Branch-Fehler bekommst:
```bash
git branch -M main
git push -u origin main
```

**Option B: Über GitHub Website:**

1. Gehe zu https://github.com/ChrisToph-lab-ai/unser-baby-app
2. Klicke auf "uploading an existing file"
3. Ziehe alle Dateien aus dem Daddy_App Ordner ins Fenster
4. Commit message: "Add all files"
5. "Commit changes"

### 4. GitHub Pages aktivieren

1. Gehe zu deinem Repository: https://github.com/ChrisToph-lab-ai/unser-baby-app
2. Klicke auf "Settings" (oben rechts)
3. Im linken Menü: "Pages"
4. Bei "Source": Wähle "Deploy from a branch"
5. Branch: "main" auswählen
6. Folder: "/ (root)" auswählen
7. "Save" klicken
8. Warte 1-2 Minuten

**Deine App ist jetzt online unter:**
```
https://christoph-lab-ai.github.io/unser-baby-app/Daddy_App.html
```

### 5. Testen

1. Öffne die URL auf deinem Handy
2. Teste die Installation (Safari/Chrome → "Zum Home-Bildschirm hinzufügen")
3. Stelle den Geburtstermin ein
4. Aktiviere Sync mit einem einzigartigen Code
5. Öffne die App auf dem zweiten Handy
6. Gib denselben Sync-Code ein
7. ✅ Teste: Hake eine Aufgabe auf Handy 1 ab → sollte auf Handy 2 erscheinen

### 6. Sicherheits-Checkliste

- [ ] Eigenen Firebase-Account erstellt (oder bewusst Demo-Account gewählt)
- [ ] Firebase Security Rules konfiguriert
- [ ] Langen, einzigartigen Sync-Code gewählt (mind. 20 Zeichen)
- [ ] Sync-Code NUR mit Partner geteilt (nicht öffentlich!)
- [ ] Regelmäßige Backups erstellen (Export-Funktion)
- [ ] GitHub Repository ist Public (für Pages) aber ohne sensible Daten im Code

### 7. Updates veröffentlichen

Wenn du die App änderst:

```bash
cd C:\Users\I526653\Documents\GitHub\personal_cnoetel\Daddy_App
git add .
git commit -m "Beschreibung der Änderung"
git push
```

Die Änderungen sind nach 1-2 Minuten live!

### 8. Custom Domain (optional)

Falls du eine eigene Domain hast (z.B. unser-baby.de):

1. GitHub Pages Settings → Custom domain
2. Trage deine Domain ein
3. Bei deinem Domain-Provider:
   - A-Record auf GitHub Pages IPs (siehe GitHub Docs)
   - CNAME auf `christoph-lab-ai.github.io`
4. Warte auf DNS-Propagierung (kann 24h dauern)

## Troubleshooting

**Problem: 404 Fehler**
- Lösung: Warte 2-3 Minuten nach Aktivierung von Pages
- Prüfe, ob alle Dateien hochgeladen wurden

**Problem: App funktioniert, aber Sync nicht**
- Prüfe Firebase-Konfiguration in Zeile 731-732
- Prüfe, ob beide Geräte denselben Sync-Code verwenden
- Öffne Browser-Console (F12) für Fehler

**Problem: PWA lässt sich nicht installieren**
- Stelle sicher, dass HTTPS aktiv ist (GitHub Pages macht das automatisch)
- Nutze Chrome (Android) oder Safari (iOS)
- Prüfe, ob manifest.json und sw.js erreichbar sind

**Problem: Service Worker Error**
- Ändere in sw.js die CACHE_NAME Version (z.B. 'unser-baby-v2')
- Browser-Cache leeren

## Wichtige URLs

- **Firebase Console:** https://console.firebase.google.com/
- **GitHub Repo:** https://github.com/ChrisToph-lab-ai/unser-baby-app
- **Live App:** https://christoph-lab-ai.github.io/unser-baby-app/Daddy_App.html
- **GitHub Pages Docs:** https://docs.github.com/en/pages

## Kontakt & Support

Bei Problemen:
1. Prüfe Browser-Console (F12 → Console)
2. Exportiere ein Backup deiner Daten
3. Prüfe GitHub Actions für Deployment-Fehler

---

**Viel Erfolg! 👶💙**
