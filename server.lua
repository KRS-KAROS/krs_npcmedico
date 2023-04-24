ESX = exports["es_extended"]:getSharedObject()


RegisterServerEvent('krs:acquista')
AddEventHandler('krs:acquista', function(value)
    local xPlayer = ESX.GetPlayerFromId(source)
    local prezzoMedikit = 2000 -- Prezzo del Medikit
    local prezzoBandage = 1000 -- Prezzo delle Bende

    if value == 'medikit' then
        if xPlayer.getMoney() >= prezzoMedikit then
            xPlayer.removeMoney(prezzoMedikit)
            xPlayer.addInventoryItem('medikit', 1)
            TriggerClientEvent('ox_lib:notify', xPlayer.source, {type = 'success', description = 'Hai comprato un Medikit per ' .. prezzoMedikit .. '$'})
        else
            TriggerClientEvent('ox_lib:notify', xPlayer.source, {type = 'error', description = 'Non hai abbastanza soldi!'})
        end
    elseif value == 'bandage' then
        if xPlayer.getMoney() >= prezzoBandage then
            xPlayer.removeMoney(prezzoBandage)
            xPlayer.addInventoryItem('bandage', 1)
            TriggerClientEvent('ox_lib:notify', xPlayer.source, {type = 'success', description = 'Hai comprato una Benda per ' .. prezzoBandage .. '$'})
        else
            TriggerClientEvent('ox_lib:notify', xPlayer.source, {type = 'error', description = 'Non hai abbastanza soldi!'})
        end
    end
end)

