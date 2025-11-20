Config = {}

-- String
Config.Messages = {
    title = "MENU LOBBY",

    -- Info menu
    seiInPub = "Sei nella lobby pubblica",
    seiInPriv = "Sei nella lobby privata numero ", -- Il numero della lobby verrà aggiunto dopo
    indietro = "Torna indietro",

    -- Public menu (quando InLobbyPrivate e InLobbyPrivateInvitato sono entrambi false)
    infoPubM = "Info", 
    entraPubbPubM = "Entra nella lobby pubblica", 
    entraPrivPubM = "Crea/Entra nella tua lobby privata",

    -- Lobby host menu (quando InLobbyPrivate è true)
    infoHostM = "Info", 
    entraPubbHostM = "Torna alla lobby pubblica", 
    invitaHostM = "Invita un giocatore nella tua lobby privata",
    kikkaHostM = "Espelli un giocatore dalla tua lobby privata", -- 'Kikka' sostituito con 'Espelli'
    
    -- Guest/Invited menu (quando InLobbyPrivate è false e InLobbyPrivateInvitato è true - o la logica desiderata)
    infoOspiteM = "Info", 
    entraPubbOspiteM = "Entra in lobby pubblica", 
    entraPrivOspiteM = "Entra nella tua lobby privata (Lasciando quella attuale)",
    
    -- Altre notifiche/messaggi
    idNonValido = "ID Giocatore non valido",
    nonInLobbyPrivata = "Non sei in una lobby privata",
    
    -- Messaggi per dialog
    invitaGiocatore = "Invita un giocatore",
    idGiocatoreInvita = "ID Giocatore Da Invitare",
    espelliGiocatore = "Espelli un giocatore",
    idGiocatoreEspelli = "ID Giocatore Da Espellere",
    
    invitoLobbyTitle = "Invito in lobby",
    invitoLobbyDesc = "ti ha invitato nella sua lobby",
    accetta = "✅Accetta",
    rifiuta = "❌Rifiuta",
    
    seiEntratoInLobby = "Sei entrato nella lobby privata #", -- Il numero della lobby verrà aggiunto dopo
    seiEntratoInPubblica = "Sei entrato nella lobby pubblica",
    giocatoreNellaTuaLobby = "Il giocatore è già nella tua lobby privata!",
    giocatoreKickato = "Giocatore kickato: ",
    seiStatoKickato = "Sei stato kickato dalla lobby!",

}

-- Misc
Config.Lobby = {
    commandName = "menulobby",
    keyMapping = "F7", -- Tasto per il keymapping
    keyMappingDesc = "Apri il menu lobby" -- Descrizione del keymapping

}
