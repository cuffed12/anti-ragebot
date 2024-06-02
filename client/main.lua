local shootCount = 0
CreateThread(function()
    while true do
        local slp = 1600
        if GetSelectedPedWeapon(PlayerPedId()) ~= GetHashKey('WEAPON_UNARMED') then
            slp = 7
            if IsPedShooting(PlayerPedId()) then
                shootCount = shootCount + 1
                CreateThread(function()
                    Wait(1000)
                    shootCount = shootCount - 1
                end)
                if shootCount > 11 then
                    TriggerServerEvent('Veuqx:Event', 'Too many shots: ' ..shootCount)
                end
            end
        end
        Wait(slp)
    end
end)