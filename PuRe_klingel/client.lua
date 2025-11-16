local cooldowns = {}

RegisterNetEvent('klingel:playNotify', function(data)
    if Config.Options.Debug then
        print("[Klingel] Benachrichtigung empfangen:", json.encode(data))
    end

    if Config.Options.NotificationSystem == 'ox' or Config.Options.NotificationSystem == 'both' then
        lib.notify({
            type = data.type,
            title = data.title,
            description = data.description,
            duration = 5000
        })
    end
    
    if Config.Options.NotificationSystem == 'esx'  then --  or Config.Options.NotificationSystem == 'both'
        if ESX then
            ESX.ShowNotification(data.description)
        end
    end
    
    -- Sound abspielen (HTML-basiert)
    SetNuiFocus(true, false)
    SendNUIMessage({ type = "playSound" })
    SetNuiFocus(false, false)
    

    SendNUIMessage({ type = "show" })
end)

RegisterNUICallback('close', function(_, cb)
    SetNuiFocus(false, false)
    cb({})
end)

CreateThread(function()
    for _, bell in pairs(Config.Klingeln) do
        exports.ox_target:addBoxZone({
            coords = bell.pos,
            size = vec3(2.0, 2.0, 2.0),
            rotation = 0,
            debug = Config.Options.Debug,
            options = {
                {
                    name = 'klingel_' .. bell.name,
                    label = 'Klingel drücken',
                    icon = 'fas fa-bell',
                    onSelect = function()
                        if cooldowns[bell.name] then
                            lib.notify({ type = 'error', description = 'Klingel im Cooldown!' })
                            return
                        end
                        if Config.Options.Debug then
                            print("[Klingel] Ausgelöst:", bell.name)
                        end
                        TriggerServerEvent('klingel:ring', bell.name)
                        cooldowns[bell.name] = true
                        SetTimeout(Config.Options.CooldownTime * 1000, function()
                            cooldowns[bell.name] = nil
                        end)
                    end
                }
            }
        })

        if Config.Options.Debug then
            print("[Klingel] Zone geladen für:", bell.name)
        end

        if Config.Options.ShowBlip then
            local blip = AddBlipForCoord(bell.pos)
            SetBlipSprite(blip, bell.blip.sprite)
            SetBlipColour(blip, bell.blip.color)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(bell.blip.label)
            EndTextCommandSetBlipName(blip)
        end
    end
end)
