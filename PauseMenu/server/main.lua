-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
pM = {}
Tunnel.bindInterface("PauseMenu",pM)

RegisterServerEvent('pausemenu:quit')
AddEventHandler('pausemenu:quit', function()
	DropPlayer(source,"Quit!")
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- OPENCHEST
-----------------------------------------------------------------------------------------------------------------------------------------
function pM.requestInfos()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then

		local identity = vRP.userIdentity(user_id) or { }
		local fullName = identity['name'] .." ".. identity['name2']
		local time = "00:00:00"
		local phoneNumber = identity['phone'] or '000-000'
		local currencyAmountBank = identity['bank'] or 0
		local groups,perms = vRP.userGroups(user_id)
		local perm = nil

		if perms then
			for group,_ in pairs(perms) do
				perm = group
			end
		end

		return fullName,user_id,time,phoneNumber,func(currencyAmountBank),perm
	end
end

function func(number)
	local number = number
	local decimal = number - math.floor(number)
	decimal = tonumber(tostring(decimal):sub(3, string.len(decimal)))
	number = tostring(math.floor(number)):reverse()
	for _ = 3, #number, 4 do
					number = number:sub(1, _) .. "." .. number:sub(_ + 1, #number)
	end
	return number:reverse() .. (decimal and "," .. decimal or "")
end