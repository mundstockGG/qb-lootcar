local QBCore = exports['qb-core']:GetCoreObject()
local cooldowns = {} -- Cooldown is temporarily disabled for testing

print("[DEBUG] Server script qb-lootcar is loaded successfully!")

local function getLoot()
    local roll = math.random(1, 100)
    print("[DEBUG] Loot roll: " .. roll)

    for _, loot in ipairs(Config.LootTable) do
        if roll <= loot.chance then
            print("[DEBUG] Selected loot: " .. loot.item)
            return loot.item
        end
    end
    print("[DEBUG] No loot obtained")
    return nil
end

-- Step 1: Client starts looting, server validates and tells the client to proceed
RegisterNetEvent("qb-lootcar:startLooting", function(propCoords)
    local src = source
    local coordsKey = tostring(propCoords)

    print("[DEBUG] Player " .. src .. " is attempting to loot at", coordsKey)

    -- Cooldown is disabled for testing
    -- if cooldowns[coordsKey] and cooldowns[coordsKey] > os.time() then
    --     print("[DEBUG] Loot cooldown active for prop at", coordsKey)
    --     TriggerClientEvent("ox_lib:notify", src, { type = "error", description = "Already looted, come back later!" })
    --     return
    -- end

    TriggerClientEvent("qb-lootcar:startProgress", src, propCoords)
end)

RegisterNetEvent("qb-lootcar:finishLooting", function(propCoords)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if not Player then
        print("[DEBUG] Error: Player " .. src .. " not found!")
        return
    end

    local coordsKey = tostring(propCoords)

    local loot = getLoot()
    if loot then
        print("[DEBUG] Checking if player " .. src .. " can carry item: " .. loot)

        if exports.ox_inventory:CanCarryItem(src, loot, 1) then
            print("[DEBUG] Player " .. src .. " can carry " .. loot .. ", adding item...")

            if exports.ox_inventory:AddItem(src, loot, 1) then
                print("[DEBUG] Successfully added " .. loot .. " to player " .. src)
                TriggerClientEvent("ox_lib:notify", src, { type = "success", description = "You found a " .. loot .. "!" })
            else
                print("[DEBUG] Failed to add item " .. loot .. " to player " .. src)
                TriggerClientEvent("ox_lib:notify", src, { type = "error", description = "Inventory issue: Item not added!" })
            end
        else
            print("[DEBUG] Player " .. src .. " cannot carry " .. loot .. ", inventory full.")
            TriggerClientEvent("ox_lib:notify", src, { type = "error", description = "Your inventory is full!" })
        end
    else
        print("[DEBUG] Player " .. src .. " found nothing")
        TriggerClientEvent("ox_lib:notify", src, { type = "info", description = "You found nothing..." })
    end

    -- Cooldown is disabled for testing
    -- cooldowns[coordsKey] = os.time() + Config.LootCooldown
    -- print("[DEBUG] Applied cooldown for prop at " .. coordsKey)
end)
