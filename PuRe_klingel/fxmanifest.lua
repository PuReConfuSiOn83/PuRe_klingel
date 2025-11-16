

fx_version 'cerulean'
lua54 'yes'
game 'gta5'

author 'PuReConfuSiOn'
description 'Klingel-System nur mit ox_lib Benachrichtigungen, Sound, Webhook und Debug-Option'

client_scripts {
   -- '@ox_lib/init.lua',
    'config.lua',
    'client.lua'
}

server_scripts {
    'config.lua',
    'server.lua'
}

shared_script '@ox_lib/init.lua'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/sounds/doorbell.ogg'
}
