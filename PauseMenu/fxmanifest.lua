shared_script "@vrp/lib/lib.lua" --Para remover esta pendencia de todos scripts, execute no console o comando "uninstall"

author 'Black Rainbow Store'
description 'Script de Pause Menu'
description 'Script criado por Angello Carana e feito exclusivo para a City Action RolePlay https://discord.gg/actionrps'
contact 'E-mail: b.rainbowstore@gmail.com - Discord: https://discord.gg/KSh2R2wP7K'
version '1.0.0'

fx_version "cerulean"
game "gta5"

client_scripts {
	"@vrp/lib/utils.lua",
	"client/*.lua"
}

server_scripts {
	"@vrp/lib/utils.lua",
	"server/*.lua"
}

ui_page {
	"html/index.html", 
}

files {
	"html/index.html",
	"html/app.js", 
	"html/style.css",
	"html/assets/*.*"
}