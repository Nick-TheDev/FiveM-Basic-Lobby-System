
-- Call Back

lib.callback.register('nick_lobby:getPlayerBucket', function(source)
    local bucketId = GetPlayerRoutingBucket(source)
    return bucketId
end)


-- Events

-- Evento per entrare forzatamente in una lobby
RegisterNetEvent('nick_lobby:joinLobby', function(bucketId)
    local src = source
    SetPlayerRoutingBucket(src, bucketId)
    TriggerClientEvent('nick_lobby:notify', src, Config.Messages.seiEntratoInLobby .. bucketId)
end)

-- Evento per entrare in lobby pubblica
RegisterNetEvent('nick_lobby:joinPublic', function()
    local src = source
    SetPlayerRoutingBucket(src, 0)
    TriggerClientEvent('nick_lobby:notify', src, Config.Messages.seiEntratoInPubblica)
end)

-- Evento per entrare in una lobby privata
RegisterNetEvent('nick_lobby:joinPrivate', function(bucketId)
    local src = source
    SetPlayerRoutingBucket(src, bucketId)
    TriggerClientEvent('nick_lobby:notify', src, Config.Messages.seiEntratoInLobby .. bucketId)
end)

-- Evento per invitare un giocatore
RegisterNetEvent('nick_lobby:invitePlayer', function(targetId)
    print(targetId)
    local src = source
    local bucketTarget = GetPlayerRoutingBucket(targetId)
    local bucketSource = GetPlayerRoutingBucket(src)
    if bucketTarget == bucketSource then
        TriggerClientEvent('nick_lobby:notify', src, Config.Messages.giocatoreNellaTuaLobby)
    else
        TriggerClientEvent('nick_lobby:requestEntrare', targetId, bucketTarget, bucketSource, src)
    end
end)

-- Evento per kickare un giocatore
RegisterNetEvent('nick_lobby:kickPlayer', function(targetId)
    local src = source
    SetPlayerRoutingBucket(targetId, 0) 
    TriggerClientEvent('nick_lobby:notify', src, Config.Messages.giocatoreKickato .. GetPlayerName(targetId))
    TriggerClientEvent('nick_lobby:notify', targetId, Config.Messages.seiStatoKickato)
end)