local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('lf-snowball:server:addSnowball', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local amount = 1
    Player.Functions.AddItem('weapon_snowball', amount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['weapon_snowball'], "add", amount)
end)