local Tunnel = module("vrp","lib/Tunnel")
vSERVER = Tunnel.getInterface("PauseMenu")
vRPS = Tunnel.getInterface("vRP")

local open = false
RegisterCommand('openSettinggmenu', function()
    if not open and not IsPauseMenuActive() then

        open = true
        SetNuiFocus(true,true)
        SendNUIMessage({
            action = 'show',
        })
    end
end)

RegisterKeyMapping("openSettinggmenu","Abrir as configurações","keyboard","Escape")

RegisterCommand("Map",function()
	ActivateFrontendMenu(GetHashKey("FE_MENU_VERSION_MP_PAUSE"),0,-1)
end)

RegisterKeyMapping("Map","Abrir o mapa","keyboard","P")

CreateThread(function()
    while true do 
        SetPauseMenuActive(false) 
        Wait(1)
    end
end)

RegisterNUICallback('exit', function(data, cb)
	SetNuiFocus(false, false)
	open = false
end)

RegisterNUICallback('SendAction', function(data, cb)
    if data.action == 'settings' then 
        ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_LANDING_MENU'),0,-1) 
        SetNuiFocus(false, false)
    elseif data.action == 'map' then 
        ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_MP_PAUSE'),0,-1) 
        SetNuiFocus(false, false)
	elseif data.action == 'exit' then 
        TriggerServerEvent("pausemenu:quit")
        SetNuiFocus(false, false)
		open = false
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTINFOS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestInfos",function(data,cb)
	local name,user_id,time,cellphone,bank,group = vSERVER.requestInfos()
	local playerList = vRPS.userPlayers()
    local players = 0

    for _,_ in pairs(playerList) do
        players = players + 1
    end

	if user_id then
		cb({
		name = name,
		user_id = string.format("%04d", user_id),
		players = string.format("%04d", players),
		time = time,
        cellphone = cellphone,
        bank = bank,
        group = group or "Nenhum"
        })
	end
end)