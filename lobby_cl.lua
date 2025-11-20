InLobbyPrivate = false
InLobbyPrivateInvitato = false

-- Notify
RegisterNetEvent("nick_lobby:notify", function (msg)
    lib.notify({
        description = msg,
        duration = 3000,
    })    
end)
local function lobbynotify(msg)
    lib.notify({
        description = msg,
        duration = 3000,
    })        
end
local function revive()
    print("You didn't fill the revive function, read on github how to do it")
end

-- Menus & commands
local function openInfo()
    local lobby = lib.callback.await('nick_lobby:getPlayerBucket')
    local text = ""
    if lobby == Config.Lobby.defaultPublicBucket then
        text = Config.Messages.seiInPub
    else
        text = Config.Messages.seiInPriv .. lobby
    end
    lib.hideMenu(false)
    lib.registerMenu({
            id = 'menu_info_lobby',
            title = Config.Messages.title,
            position = 'bottom-right',
            options = {
                {
                    label = text,
                    icon = 'users',
                },
                {
                    label = Config.Messages.indietro,
                    icon = 'arrow-left',
                }          
            }
        }, function(selected, scrollIndex, args)
            if selected == 3 then
                lib.hideMenu()
                ExecuteCommand(Config.Lobby.commandName)
            end
        end)

        lib.showMenu('menu_info_lobby')
end

RegisterCommand(Config.Lobby.commandName, function()
    if InLobbyPrivate == false and InLobbyPrivateInvitato == false then
        lib.hideMenu(false)
        lib.registerMenu({
            id = 'menu_lobby',
            title = Config.Messages.title,
            position = 'bottom-right',
            options = {
                {
                    label = Config.Messages.infoPubM,
                    icon = 'info',
                },
                {
                    label = Config.Messages.entraPubbPubM,
                    icon = 'users',
                },
                {
                    label = Config.Messages.entraPrivPubM,
                    icon = 'user-lock',
                }        
            },
        }, function(selected, scrollIndex, args)
            if selected == 1 then
                openInfo()
            elseif selected == 2 then
                TriggerServerEvent('nick_lobby:joinPublic')
                InLobbyPrivate = false
            elseif selected == 3 then
                TriggerServerEvent('nick_lobby:joinPrivate', GetPlayerServerId(PlayerId()))
                InLobbyPrivate = true
            end
        end)

        lib.showMenu('menu_lobby')
    elseif InLobbyPrivate == true then
        lib.hideMenu(false)
        lib.registerMenu({
            id = 'menu_gestione_private',
            title = Config.Messages.title,
            position = 'bottom-right',
            options = {
                {
                    label = Config.Messages.infoHostM,
                    icon = 'info',
                },
                {
                    label = Config.Messages.entraPubbHostM,
                    icon = 'users',
                },
                {
                    label = Config.Messages.invitaHostM,
                    icon = 'user-plus',
                },
                {
                    label =  Config.Messages.kikkaHostM,
                    icon = 'user-minus',
                }
            },
        }, function(selected, scrollIndex, args)
            if selected == 1 then
                openInfo()
            elseif selected == 2 then
                TriggerServerEvent('nick_lobby:joinPublic')
                InLobbyPrivate = false
            elseif selected == 3 then
                local input = lib.inputDialog(Config.Messages.invitaGiocatore, {
                  {type = 'input', label = Config.Messages.idGiocatoreInvita, description = Config.Messages.idGiocatoreInvita, required = true},
                })
                if input then
                    local targetId = tonumber(input[1])
                    if targetId and GetPlayerName(targetId) then
                        print(targetId)
                        TriggerServerEvent('nick_lobby:invitePlayer', targetId)
                    else
                        lobbynotify(Config.Messages.idNonValido)
                    end
                end
            elseif selected == 4 then
                local input = lib.inputDialog(Config.Messages.espelliGiocatore, {
                  {type = 'input', label = Config.Messages.idGiocatoreEspelli, description = Config.Messages.idGiocatoreEspelli, required = true},
                })
                if input then
                    local targetId = tonumber(input[1])
                    if targetId and GetPlayerName(targetId) then
                        TriggerServerEvent('nick_lobby:kickPlayer', targetId)
                    else
                        lobbynotify(Config.Messages.idNonValido)
                    end
                end
            end
        end)

        lib.showMenu('menu_gestione_private')        
    elseif InLobbyPrivateInvitato == true then
        lib.hideMenu(false)
        lib.registerMenu({
            id = 'menu_lobby_ospite',
            title = Config.Messages.title,
            position = 'bottom-right',
            options = {
                {
                    label = Config.Messages.infoOspiteM,
                    icon = 'info',
                },
                {
                    label = Config.Messages.entraPubbOspiteM,
                    icon = 'users',
                },
                {
                    label = Config.Messages.entraPrivOspiteM,
                    icon = 'user-lock',
                }
            },
        }, function(selected, scrollIndex, args)
            if selected == 1 then
                openInfo()
            elseif selected == 2 then
                TriggerServerEvent('nick_lobby:joinPublic')
                InLobbyPrivate = false
                InLobbyPrivateInvitato = false
            elseif selected == 3 then
                TriggerServerEvent('nick_lobby:joinPrivate', GetPlayerServerId(PlayerId()))
                InLobbyPrivate = true
                InLobbyPrivateInvitato = false
            end
        end)

        lib.showMenu('menu_lobby_ospite')
    end 

end)

RegisterCommand('revivelobby', function()
    if InLobbyPrivate == true or InLobbyPrivateInvitato == true then
        revive()
    else
        lobbynotify(Config.Messages.nonInLobbyPrivata)
    end
end)

RegisterKeyMapping(Config.Lobby.commandName, Config.Lobby.keyMappingDesc, 'keyboard', Config.Lobby.keyMapping)

-- Events

RegisterNetEvent('nick_lobby:requestEntrare')
AddEventHandler('nick_lobby:requestEntrare', function(bucketTarget, bucketSource, sourceId)
    local playerName = GetPlayerName(sourceId)
    local input = lib.inputDialog(Config.Messages.invitoLobbyTitle, {
      {
        type = 'select', 
        label = playerName .. Config.Messages.invitoLobbyDesc, 
        description = Config.Messages.invitoLobbyDesc, 
        required = true, 
        options = {
            {value = 'accetta', label = Config.Messages.accetta},
            {value = 'rifiuta', label = Config.Messages.rifiuta},
        }
      },
    })
    if input then
        if input[1] == 'accetta' then
            TriggerServerEvent('nick_lobby:joinLobby', bucketSource)
            InLobbyPrivate = false
            InLobbyPrivateInvitato = true
            lobbynotify(Config.Messages.seiEntratoInLobby .. bucketSource)
        end
    end
end)