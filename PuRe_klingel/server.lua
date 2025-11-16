ESX = exports['es_extended']:getSharedObject()

RegisterServerEvent('klingel:ring')
AddEventHandler('klingel:ring', function(bellName)
    local src = source
    local bell = nil

    --------------------------------------------------------------
    -- 🔍 passende Klingel aus Config finden
    --------------------------------------------------------------
    for _, b in pairs(Config.Klingeln) do
        if b.name == bellName then
            bell = b
            break
        end
    end

    if not bell then
        if Config.Options.Debug then
            print(("[Klingel] ⚠️ Unbekannte Klingel: %s"):format(tostring(bellName)))
        end
        return
    end

    local playerName = GetPlayerName(src)
    local label = bell.label or "Unbekannter Ort"
    local timestamp = os.date('%d.%m.%Y %H:%M:%S')

    local playerNotifyMessage = ('Du hast bei der %s geklingelt\n🕓 %s'):format(label, timestamp)
    local jobNotifyMessage = ('🔔 Jemand hat bei der %s geklingelt\n🕓 %s'):format(label, timestamp)

    if Config.Options.Debug then
        print(("[Klingel] %s hat bei %s geklingelt (%s)"):format(playerName, label, timestamp))
    end

    --------------------------------------------------------------
    -- 👷 Benachrichtigung an alle passenden Job-Spieler
    --------------------------------------------------------------
    for _, playerId in ipairs(GetPlayers()) do
        local xPlayer = ESX.GetPlayerFromId(playerId)
        if xPlayer and xPlayer.job then
            local playerJob = xPlayer.job.name

            -- Mehrere Jobs unterstützt
            if bell.jobs then
                for _, allowedJob in ipairs(bell.jobs) do
                    if playerJob == allowedJob then
                        TriggerClientEvent('klingel:playNotify', playerId, {
                            type = 'info',
                            title = 'Klingel',
                            description = jobNotifyMessage
                        })
                        break
                    end
                end

            -- Fallback für alte Configs mit "job"
            elseif bell.job and playerJob == bell.job then
                TriggerClientEvent('klingel:playNotify', playerId, {
                    type = 'info',
                    title = 'Klingel',
                    description = jobNotifyMessage
                })
            end
        end
    end

    --------------------------------------------------------------
    -- 👂 Spieler in der Nähe hören die Klingel
    --------------------------------------------------------------
    for _, playerId in ipairs(GetPlayers()) do
        if tonumber(playerId) ~= src then
            local ped = GetPlayerPed(playerId)
            if ped then
                local pos = GetEntityCoords(ped)
                if #(pos - bell.pos) <= Config.Options.HearingDistance then
                    TriggerClientEvent('klingel:playNotify', playerId, {
                        type = 'inform',
                        title = 'Klingel in der Nähe',
                        description = 'Du hörst eine Klingel in der Nähe.'
                    })
                end
            end
        end
    end

    --------------------------------------------------------------
    -- ✅ Spieler selbst bekommt Erfolgsmeldung
    --------------------------------------------------------------
    TriggerClientEvent('klingel:playNotify', src, {
        type = 'success',
        title = 'Klingel',
        description = playerNotifyMessage
    })

    --------------------------------------------------------------
    -- 🌐 Discord Webhook Logging (optional)
    --------------------------------------------------------------
    if Config.Options.EnableWebhook and Config.Options.WebhookURL ~= '' then
        PerformHttpRequest(Config.Options.WebhookURL, function(err)
            if Config.Options.Debug then
                print("[Klingel] Webhook-Statuscode:", err)
            end
        end, 'POST', json.encode({
            username = Config.Options.WebhookName or 'Klingel-System',
            avatar_url = Config.Options.WebhookAvatar or '',
            embeds = {{
                title = "🔔 Klingel wurde betätigt",
                description = ("**Spieler:** %s\n**Ort:** %s\n**Zeit:** %s")
                    :format(playerName, label, timestamp),
                color = 16753920,
                timestamp = os.date('!%Y-%m-%dT%H:%M:%SZ'),
                footer = { text = "FiveM Klingel-System" }
            }}
        }), { ['Content-Type'] = 'application/json' })
    end
end)
