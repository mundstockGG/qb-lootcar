local QBCore = exports["qb-core"]:GetCoreObject()

RegisterNetEvent("qb-lootcar:startProgress")
AddEventHandler("qb-lootcar:startProgress", function(propCoords)
    lib.progressBar({
        duration = 5000,
        label = "Searching...",
        useWhileDead = false,
        canCancel = true,
        disable = {move = true, combat = true},
        anim = {dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", clip = "machinic_loop_mechandplayer"}
    }, function(cancelled)
        if not cancelled then
            TriggerServerEvent("qb-lootcar:finishLooting", propCoords)
        else
            print("[DEBUG] Looting canceled by player")
        end
    end)
end)

CreateThread(function()
    for _, prop in ipairs(Config.LootableProps) do
        print("[DEBUG] Registering prop in ox_target:", prop)
        exports.ox_target:addModel(prop, {
            {
                name = "loot_prop",
                icon = "fa-solid fa-box-open",
                label = "Loot",
                onSelect = function(data)
                    local entity = data.entity
                    if not DoesEntityExist(entity) then
                        return
                    end

                    local propCoords = GetEntityCoords(entity)
                    local roundedCoords = vector3(
                        math.floor(propCoords.x * 100) / 100,
                        math.floor(propCoords.y * 100) / 100,
                        math.floor(propCoords.z * 100) / 100
                    )

                    TriggerServerEvent("qb-lootcar:startLooting", roundedCoords)
                end
            }
        })
    end
end)
