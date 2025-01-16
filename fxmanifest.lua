fx_version "cerulean"
game "gta5"
lua54 "yes"
author "mundstock"
description "Lootable props system with ox_target integration"
version "1.0.0"

shared_scripts {
    "@ox_lib/init.lua",
    "config.lua"
}
server_script "server.lua"
client_script "client.lua"

dependencies {
    "ox_target",
    "ox_lib",
    'ox_inventory',
    "qb-core"
}
