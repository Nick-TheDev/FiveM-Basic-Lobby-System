# FiveM-Basic-Lobby-System

A FiveM script built with Ox Lib to manage private and other lobby types in an easy and clean way.

## 🇬🇧 English Readme

### Overview

This script provides a basic, easy-to-use lobby management system for your FiveM server, leveraging the **Routing Bucket** feature to create isolated private spaces. It is built entirely on the **Ox Lib** base for menus and notifications.

### Key Features

  * **Public Lobby (Bucket 0):** The default lobby where all players start.
  * **Private Lobby Creation:** Players can create their own private lobby, automatically using their Server ID as the unique Routing Bucket ID.
  * **Invitation System:** Private lobby hosts can invite other players via their Server ID.
      * Players receive an interactive dialog to accept or reject the invitation.
  * **Kick/Expel Feature:** Hosts can kick players from their private lobby, returning them to the Public Lobby (Bucket 0).
  * **Client Status:** Uses client-side states (`InLobbyPrivate`, `InLobbyPrivateInvitato`) to present context-specific menus (Normal, Host, or Guest/Invited).
  * **Revive Command:** Includes a placeholder `revive` function tied to the `/revivelobby` command, only usable inside a private lobby.

### Requirements

  * **Ox Lib (Required):** Used for all menus, notifications, and callbacks.

### Installation

1.  Ensure you have **Ox Lib** installed in your server resources.
2.  Add the `fivem-basic-lobby-system` folder to your server's resources directory.
3.  Add `ensure fivem-basic-lobby-system` to your server's `server.cfg`.

### Usage

| Command | Key Mapping | Description | Availability |
| :--- | :--- | :--- | :--- |
| `/menulobby` | **F7** (Default) | Opens the main Lobby Management Menu. | Always |
| `/revivelobby` | N/A | Calls the placeholder `revive()` function (requires custom implementation). | Only in Private Lobby |

### Configuration

All strings, key bindings, and the default public bucket ID are configured in `lobby_cfg.lua`:

```lua
Config.Lobby = {
    defaultPublicBucket = 0,
    commandName = "menulobby",
    keyMapping = "F7", // Default key to open the menu
    keyMappingDesc = "Apri il menu lobby" 
}
-- ... Config.Messages contains all localized strings (Italian)
```

-----

## 🇮🇹 Readme in Italiano

### Panoramica

Questo script fornisce un sistema di gestione delle lobby di base e facile da usare per il tuo server FiveM, sfruttando la funzionalità di **Routing Bucket** per creare spazi privati isolati. È interamente costruito sulla base di **Ox Lib** per menu e notifiche.

### Caratteristiche Principali

  * **Lobby Pubblica (Bucket 0):** La lobby predefinita dove iniziano tutti i giocatori.
  * **Creazione Lobby Privata:** I giocatori possono creare la propria lobby privata, utilizzando automaticamente il loro ID del server come ID di Routing Bucket univoco.
  * **Sistema di Invito:** Gli host delle lobby private possono invitare altri giocatori tramite il loro ID del Server.
      * I giocatori ricevono un dialogo interattivo per accettare o rifiutare l'invito.
  * **Funzione di Kick/Espulsione:** Gli host possono espellere i giocatori dalla loro lobby privata, rimandandoli alla Lobby Pubblica (Bucket 0).
  * **Stato Cliente:** Utilizza stati lato client (`InLobbyPrivate`, `InLobbyPrivateInvitato`) per presentare menu specifici in base al contesto (Normale, Host o Ospite/Invitato).
  * **Comando Revive:** Include una funzione placeholder `revive` collegata al comando `/revivelobby`, utilizzabile solo all'interno di una lobby privata.

### Requisiti

  * **Ox Lib (Obbligatorio):** Utilizzato per tutti i menu, le notifiche e le callback.

### Installazione

1.  Assicurati di aver installato **Ox Lib** tra le risorse del tuo server.
2.  Aggiungi la cartella `fivem-basic-lobby-system` nella directory `resources` del tuo server.
3.  Aggiungi `ensure fivem-basic-lobby-system` al file `server.cfg` del tuo server.

### Utilizzo

| Comando | Tasto Mappato | Descrizione | Disponibilità |
| :--- | :--- | :--- | :--- |
| `/menulobby` | **F7** (Predefinito) | Apre il menu principale di gestione della Lobby. | Sempre |
| `/revivelobby` | N/A | Chiama la funzione placeholder `revive()` (richiede implementazione personalizzata). | Solo in Lobby Privata |

### Configurazione

Tutte le stringhe, le associazioni di tasti e l'ID del bucket pubblico predefinito sono configurati in `lobby_cfg.lua`:

```lua
Config.Lobby = {
    defaultPublicBucket = 0,
    commandName = "menulobby",
    keyMapping = "F7", // Tasto per il keymapping
    keyMappingDesc = "Apri il menu lobby" // Descrizione del keymapping
}
-- ... Config.Messages contiene tutti i messaggi localizzati (in Italiano)
```
