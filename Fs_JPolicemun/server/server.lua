TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_phone:registerNumber', 'police', 'alerte police', true, true)

TriggerEvent('esx_society:registerSociety', 'policem', 'policem', 'society_policem', 'society_policem', 'society_policem', {type = 'public'})

--- Prise de service

function sendToDiscordWithSpecialURL(name,message,color,url)
    local DiscordWebHook = url
	local embeds = {
		{
			["title"]=message,
			["type"]="rich",
			["color"] =color,
			["footer"]=  {
			["text"]= "Police Municipale",
			},
		}
	}
    if message == nil or message == '' then return FALSE end
    PerformHttpRequest(ConfigWebhookRendezVouspolicem, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

RegisterNetEvent('policem:prisedeservice')
AddEventHandler('policem:prisedeservice', function()
	local _src = source
	local xPlayer = ESX.GetPlayerFromId(_src)
	sendToDiscordWithSpecialURL("Prise de service",xPlayer.getName().." à prise son service", 16744192, ConfigWebhookRendezVouspolicem)
end)

RegisterNetEvent('policem:quitteleservice')
AddEventHandler('policem:quitteleservice', function()
	local _src = source
	local xPlayer = ESX.GetPlayerFromId(_src)
	sendToDiscordWithSpecialURL("Fin de service",xPlayer.getName().." à quitter son service", 16744192, ConfigWebhookRendezVouspolicem)
end)

--- Accueil

local function sendToDiscordWithSpecialURL(Color, Title, Description)
	local Content = {
	        {
	            ["color"] = Color,
	            ["title"] = Title,
	            ["description"] = Description,
		        ["footer"] = {
	            ["text"] = "Aurezia policem",
	            ["icon_url"] = nil,
	            },
	        }
	    }
	PerformHttpRequest(ConfigWebhookRendezVouspolicem, function(err, text, headers) end, 'POST', json.encode({username = Name, embeds = Content}), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent("Rdv:policemMotif")
AddEventHandler("Rdv:policemMotif", function(nomprenom, numero, heurerdv, rdvmotif)
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local ident = xPlayer.getIdentifier()
	local date = os.date('*t')

	if date.day < 10 then date.day = '' .. tostring(date.day) end
	if date.month < 10 then date.month = '' .. tostring(date.month) end
	if date.hour < 10 then date.hour = '' .. tostring(date.hour) end
	if date.min < 10 then date.min = '' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '' .. tostring(date.sec) end

	if ident == 'steam:11' then--Special character in username just crash the server
	else 
		sendToDiscordWithSpecialURL(16744192, "Nouveau Rendez-Vous\n\n```Nom : "..nomprenom.."\n\nNuméro de Téléphone: "..numero.."\n\nHeure du Rendez Vous : " ..heurerdv.."\n\nMotif du Rendez-vous : " ..rdvmotif.. "\n\n```Date : " .. date.day .. "." .. date.month .. "." .. date.year .. " | " .. date.hour .. " h " .. date.min .. " min " .. date.sec)
	end
end)

RegisterServerEvent('Appel:policem')
AddEventHandler('Appel:policem', function()
    
	local xPlayers = ESX.GetPlayers()
	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'policem' then
		-- TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'policem', '~r~Accueil', 'Un gendarme est appelé à l\'accueil !', 'CHAR_MICHAEL', 8)
		TriggerClientEvent('okokNotify:Alert', xPlayers[i], "Police Municipale", "Un agent est appelé à l\'accueil !", 5000, 'info')
        end
    end
end)

-- Infos policem

RegisterServerEvent('policem:PriseEtFinservice')
AddEventHandler('policem:PriseEtFinservice', function(PriseOuFin)
	local _source = source
	local _raison = PriseOuFin
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()
	local name = xPlayer.getName(_source)

	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'policem' then
			TriggerClientEvent('policem:InfoService', xPlayers[i], _raison, name)
		end
	end
end)

-- Renfort

RegisterServerEvent('renfort')
AddEventHandler('renfort', function(coords, raison)
	local _source = source
	local _raison = raison
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()

	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'policem' then
			TriggerClientEvent('renfort:setBlip', xPlayers[i], coords, _raison)
		end
	end
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---- FOUILLE ----
-----------------

RegisterNetEvent('policem:confiscatePlayerItem')
AddEventHandler('policem:confiscatePlayerItem', function(target, itemType, itemName, amount)
    local _source = source
    local sourceXPlayer = ESX.GetPlayerFromId(_source)
    local targetXPlayer = ESX.GetPlayerFromId(target)

    if itemType == 'item_standard' then
        local targetItem = targetXPlayer.getInventoryItem(itemName)
		local sourceItem = sourceXPlayer.getInventoryItem(itemName)
		
			targetXPlayer.removeInventoryItem(itemName, amount)
			sourceXPlayer.addInventoryItem(itemName, amount)
            TriggerClientEvent("esx:showNotification", source, "Vous avez volé ~b~"..amount..' '..sourceItem.label.."~s~.")
            TriggerClientEvent("esx:showNotification", target, "Il t'a été volé ~b~"..amount..' '..sourceItem.label.."~s~.")
        else
			--TriggerClientEvent("esx:showNotification", source, "~r~quantité invalide")
		end
        
    if itemType == 'item_account' then
        targetXPlayer.removeAccountMoney(itemName, amount)
        sourceXPlayer.addAccountMoney   (itemName, amount)
        
        TriggerClientEvent("esx:showNotification", source, "Vous avez volé ~b~"..amount.."€ ~s~Argent sale~s~.")
        TriggerClientEvent("esx:showNotification", target, "Il t'a été volé ~b~"..amount.."€ ~s~Argent sale~s~.")
        
    elseif itemType == 'item_weapon' then
        if amount == nil then amount = 0 end
        targetXPlayer.removeWeapon(itemName, amount)
        sourceXPlayer.addWeapon   (itemName, amount)

        TriggerClientEvent("esx:showNotification", source, "Vous avez volé ~b~"..ESX.GetWeaponLabel(itemName).."~s~ avec ~b~"..amount.."~s~ munitions.")
        TriggerClientEvent("esx:showNotification", target, "Il t'a été volé ~b~"..ESX.GetWeaponLabel(itemName).."~s~ avec ~b~"..amount.."~s~ munitions.")
    end
end)


ESX.RegisterServerCallback('policem:getOtherPlayerData', function(source, cb, target, notify)
    local xPlayer = ESX.GetPlayerFromId(target)

    TriggerClientEvent("esx:showNotification", target, "~r~Tu es fouillé...")

    if xPlayer then
        local data = {
            name = xPlayer.getName(),
            job = xPlayer.job.label,
            grade = xPlayer.job.grade_label,
            inventory = xPlayer.getInventory(),
            accounts = xPlayer.getAccounts(),
            weapons = xPlayer.getLoadout()
        }

        cb(data)
    end
end)

--- Menotter

RegisterServerEvent('policem:handcuff')
AddEventHandler('policem:handcuff', function(target)
  TriggerClientEvent('policem:handcuff', target)
end)

RegisterServerEvent('policem:drag')
AddEventHandler('policem:drag', function(target)
  local _source = source
  TriggerClientEvent('policem:drag', target, _source)
end)

RegisterServerEvent('policem:putInVehicle')
AddEventHandler('policem:putInVehicle', function(target)
  TriggerClientEvent('policem:putInVehicle', target)
end)

RegisterServerEvent('policem:OutVehicle')
AddEventHandler('policem:OutVehicle', function(target)
    TriggerClientEvent('policem:OutVehicle', target)
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---- FOUILLE ----
-----------------

ESX.RegisterServerCallback('policem:getOtherPlayerData', function(source, cb, target)
	local xPlayer = ESX.GetPlayerFromId(target)

	TriggerClientEvent("esx:showAdvancedNotification", target, "Vous êtes en train de vous faire fouiller.", 5000, "danger")

	if xPlayer then
		local data = {
			inventory = xPlayer.getInventory(),
			accounts = xPlayer.getAccounts(),
			weapons = xPlayer.getLoadout()
		}

		cb(data)
	end
end)


RegisterNetEvent('policem:confiscatePlayerItem')
AddEventHandler('policem:confiscatePlayerItem', function(target, itemType, itemName, amount)
	local _source = source
	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if itemType == 'item_standard' then
		local targetItem = targetXPlayer.getInventoryItem(itemName)
		local sourceItem = sourceXPlayer.getInventoryItem(itemName)

		if targetItem.count > 0 and targetItem.count <= amount then

			targetXPlayer.removeInventoryItem(itemName, amount)
			sourceXPlayer.addInventoryItem(itemName, amount)
		end

	elseif itemType == 'item_account' then
		targetXPlayer.removeAccountMoney(itemName, amount)
		sourceXPlayer.addAccountMoney(itemName, amount)

	elseif itemType == 'item_weapon' then
		if amount == nil then amount = 0 end
		targetXPlayer.removeWeapon(itemName, amount)
		sourceXPlayer.addWeapon(itemName, amount)

	end
	--TriggerEvent('Logger:SendToDiscordIfPossible', 'policem-confiscate', false, 0, GetPlayerName(source), itemName, amount, GetPlayerName(target));

end)


-- équipement

RegisterNetEvent('equipementrecrue')
AddEventHandler('equipementrecrue', function()
local _source = source
local xPlayer = ESX.GetPlayerFromId(source)
local identifier
	local steam
	local playerId = source
	local PcName = GetPlayerName(playerId)
	for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end
	for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
		if string.match(v, 'steam:') then
			steam = string.sub(v, 7)
			break
		end
	end

xPlayer.addWeapon('weapon_flashlight', 42)
xPlayer.addWeapon('weapon_stungun', 42)
xPlayer.addWeapon('WEAPON_NIGHTSTICK', 42)
TriggerClientEvent('esx:showNotification', source, "Vous avez reçu votre équipement")
end)


RegisterNetEvent('equipementlbd')
AddEventHandler('equipementlbd', function()
local _source = source
local xPlayer = ESX.GetPlayerFromId(source)
local identifier
	local steam
	local playerId = source
	local PcName = GetPlayerName(playerId)
	for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end
	for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
		if string.match(v, 'steam:') then
			steam = string.sub(v, 7)
			break
		end
	end

xPlayer.addWeapon('weapon_lbd', 42)
xPlayer.addWeapon('weapon_lgcougar', 42)
xPlayer.addWeapon('WEAPON_BZGAS', 42)
TriggerClientEvent('esx:showNotification', source, "Vous avez reçu votre équipement")
end)

RegisterNetEvent('equipementletal')
AddEventHandler('equipementletal', function()
local _source = source
local xPlayer = ESX.GetPlayerFromId(source)
local identifier
	local steam
	local playerId = source
	local PcName = GetPlayerName(playerId)
	for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end
	for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
		if string.match(v, 'steam:') then
			steam = string.sub(v, 7)
			break
		end
	end

-- xPlayer.addWeapon('weapon_pistol', 42)
xPlayer.addWeapon('weapon_combatpistol', 42)
xPlayer.addWeapon('weapon_pumpshotgun_mk2', 42)
xPlayer.addWeapon('weapon_carbinerifle', 42)
xPlayer.addWeapon('weapon_smg', 42)
xPlayer.addWeapon('weapon_specialcarbine', 42)
TriggerClientEvent('esx:showNotification', source, "Vous avez reçu votre équipement")
end)


-- Plaque

ESX.RegisterServerCallback('policem:getVehicleInfos', function(source, cb, plate)

	MySQL.Async.fetchAll('SELECT owner, vehicle FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function(result)

		local retrivedInfo = {
			plate = plate
		}

		if result[1] then
			MySQL.Async.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier',  {
				['@identifier'] = result[1].owner
			}, function(result2)

				retrivedInfo.owner = result2[1].firstname .. ' ' .. result2[1].lastname

				retrivedInfo.vehicle = json.decode(result[1].vehicle)

				cb(retrivedInfo)

			end)
		else
			cb(retrivedInfo)
		end
	end)
end)

-- Facture

RegisterNetEvent("policem:SendFacture")
AddEventHandler("policem:SendFacture", function(target, price)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name ~= 'policem' or xPlayer.job.name == "fratsecu" or xPlayer.job.name == "gardien"  or xPlayer.job.name == "gouvernement"  or xPlayer.job.name == "gouvernement2" then
		TriggerEvent("AC:Violations", 24, "Event: policem:SendFacture job: "..xPlayer.job.name, source)
		return
	end

	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_gouvernement', function(account)
        if account ~= nil then
			societyAccount = account
			local xPlayer = ESX.GetPlayerFromId(target)
			xPlayer.removeAccountMoney('bank', price)
			societyAccount.addMoney(price)
			TriggerClientEvent("esx:showNotification", target, "Votre compte en banque à été réduit de ~r~"..price.."e~s~.", 5000, "danger")
			TriggerClientEvent("esx:showNotification", source, "Vous avez donné une amende de ~r~"..price.."~s~e", 5000, "danger")
		end
	end)
end)