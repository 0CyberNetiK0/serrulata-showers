fx_version   'cerulean'
use_experimental_fxv2_oal 'yes'
lua54        'yes'
game         'gta5'

name 'Serrulata-Shower'
description 'Serrulata-Shower'
author 'Serrulata-Studios'
version '1.0.0'

shared_scripts {
    'config.lua',
    '@ox_lib/init.lua'
}

client_script {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/main.lua'
}