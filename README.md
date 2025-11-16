# 🔔 PuRe_Klingel – ESX / ox_lib Doorbell System  
**Autor:** PuReConfuSiOn (Community RP)  
**Framework:** ESX Legacy 1.13.0  
**Abhängigkeiten:** ox_lib, ox_target, es_extended  
**Version:** 1.0.0

Ein leistungsstarkes, standalone klingel-basiertes Interaktionssystem für Häuser, Firmen, Gangs und Fraktionen.  
Unterstützt **beliebig viele Klingeln**, **Job-Benachrichtigungen**, **Discord-Webhooks** und **ox_target-Zonen**.

---

## ✨ Features

- 🔔 **Unbegrenzte Klingeln**  
  Jede Klingel wird in der `config.lua` definiert.

- 🎯 **Interaktion über ox_target**  
  Kein Tastendruck – saubere Integration in das moderne CRP-Zielsystem.

- 🛠️ **Standalone ESX-Ressource**  
  Keine Datenbank notwendig, läuft ohne zusätzliche Scripte.

- 🧩 **Job-Restriktion**  
  Nur bestimmte Jobs erhalten Meldungen (z. B. police, mechanic, burgshot, ambulance …)

- 📡 **Discord Webhook Logging**  
  Jede Nutzung kann optional im Discord protokolliert werden.

- 🔔 **Individueller Klingelton**  
  Pro Klingel ein eigener Sound.

- 📍 **Mehrere Klingeln pro Gebäude**  
  Praktisch für Firmen oder Apartment-Eingänge.

- ▶️ **Perfekt kommentierter Code**  
  Ideal für Weiterentwicklung & Anpassungen.

---

## 📦 Installation

1. Ordner in dein FiveM Ressourcenverzeichnis legen:





2. In der `server.cfg` / `resources.cfg`:


3. Stelle sicher, dass folgende Ressourcen laufen:

- `ox_lib`
- `ox_target`
- `es_extended` (ESX Legacy 1.13.0)

---

## ⚙️ Konfiguration (`config.lua`)

```lua
Config = {}

-- Aktiviert Debugmeldungen
Config.Debug = false

-- Optionaler Discord Webhook für Logs
Config.Webhook = ""

Config.Klingeln = {
    {
        label = "Hauseingang vorne",
        coords = vec3(-810.12, 175.33, 76.74),
        jobs = { "police", "ambulance" }, -- Wer pingt?
        sound = "doorbell.ogg"
    },

    {
        label = "Burgershot Hintereingang",
        coords = vec3(-1183.2, -888.1, 13.9),
        jobs = {},
        sound = "burgerbell.ogg"
    }
}


| Feld     | Beschreibung                                                  |
| -------- | ------------------------------------------------------------- |
| `label`  | Name der Klingel                                              |
| `coords` | Position der Klingel                                          |
| `jobs`   | Liste der Jobs, die die Meldung bekommen sollen (leer = alle) |
| `sound`  | Datei im `html/sounds/` Ordner                                |


🎮 Nutzung (Ingame)

Spieler gehen an eine Klingel und im ox_target erscheint:

🔔 Klingeln


Nach Aktivierung erhalten definierte Jobs eine Benachrichtigung:

Jemand hat an der Klingel "Burgershot" gedrückt!


Optional erscheint ein Webhook-Eintrag auf deinem Discord:

🔔 PuRe_Klingel Log:
Spieler: Max Mustermann (ID: 34)
Klingel: Burgershot
Zeit: 22:14 Uhr

📡 Discord Webhook Setup

Wenn du Logs willst, trage in der config.lua ein:

Config.Webhook = "https://discord.com/api/webhooks/XXXXXXXX"


Das Script sendet automatisch:

Spielername

Server-ID

Position

Geläutete Klingel

Datum / Uhrzeit

🧩 Dependencies
Name	Link
ox_lib	https://github.com/overextended/ox_lib

ox_target	https://github.com/overextended/ox_target

es_extended	https://github.com/esx-framework/esx_core
🧪 Debug Mode

Aktiviere Debug:

Config.Debug = true


Zeigt:

Console-Ausgaben

Target-Registrierungen

Klingel-Zonen

Webhook-Status

📜 Lizenz

PuReConfuSiOn – Community RP
Nutzung auf CRP erlaubt.
Weitergabe mit Credits.