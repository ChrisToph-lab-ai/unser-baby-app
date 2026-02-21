@echo off
echo.
echo ========================================
echo   Unser Baby - Lokaler Test-Server
echo ========================================
echo.
echo Starte Server auf Port 8000...
echo App erreichbar unter: http://localhost:8000/Daddy_App.html
echo.
echo WICHTIG: PWA-Features (Installation, Sync) funktionieren
echo nur wenn die App online uber HTTPS erreichbar ist!
echo.
echo Zum Beenden: Strg+C druecken
echo.

python -m http.server 8000

pause
