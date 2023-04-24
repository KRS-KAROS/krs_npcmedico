fx_version 'cerulean'
game 'gta5'
lua54 'yes'

Nome 'Sistema Medico Ped krs'
Autore '𝗞𝗥𝗦®'
Discord 'https://discord.gg/wM4XDaXfU8' -- 𝗞𝗥𝗦® --

shared_script "@es_extended/imports.lua"
shared_script '@ox_lib/init.lua'

client_scripts {
    'client.lua'
} 

server_scripts {
    'server.lua'
}

dependencies {
    'PolyZone',
    'ox_target',
    'ox_lib',
    'ox_inventory'
}