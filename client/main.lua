local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
    while true do
        SetWeaponDamageModifier(`WEAPON_SNOWBALL`, 0.0)
        SetSnowLevel(1.0)
        Citizen.Wait(1)
    end
end)

Citizen.CreateThread(function()
    while true do
        if IsControlJustPressed(0, 74) and GetSnowLevel() > 0.9 and GetInteriorFromEntity(GetPlayerPed(-1)) == 0 then
            QBCore.Functions.Progressbar('pickupsnowball', 'Picking up snowballs...', 5000, false, true, { -- Name | Label | Time | useWhileDead | canCancel
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function() -- Play When Done
                TriggerEvent('animations:client:EmoteCommandStart', {'pickup'})
                -- TriggerEvent('animations:client:EmoteCommandStart', {'c'})
                TriggerServerEvent('lf-snowball:server:addSnowball')
            end, function() -- Play When Cancel
                TriggerEvent('animations:client:EmoteCommandStart', {'c'})
            end)
        end
        Citizen.Wait(1)
    end
end)