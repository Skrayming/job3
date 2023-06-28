Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
    end
    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
    end
    if ESX.IsPlayerLoaded() then

		ESX.PlayerData = ESX.GetPlayerData()

    end
end)


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

local pos = vector3(-2023.5657958984, -453.83242797852, 11.509463310242)
Citizen.CreateThread(function()
	local blip = AddBlipForCoord(pos)

	SetBlipSprite (blip, 446)
	SetBlipScale  (blip, 0.95)
	SetBlipColour (blip, 4)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName('STRING')
	AddTextComponentSubstringPlayerName('Police Municipale')
	EndTextCommandSetBlipName(blip)
end)

-- MenuFouille

local Items = {}      
local Armes = {}    
local ArgentSale = {} 

local PlayerData = {}

local function MarquerJoueur()
	local ped = GetPlayerPed(ESX.Game.GetClosestPlayer())
	local pos = GetEntityCoords(ped)
	local target, distance = ESX.Game.GetClosestPlayer()
	if distance <= 4.0 then
	DrawMarker(2, pos.x, pos.y, pos.z+1.3, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 255, 0, 170, 0, 1, 2, 1, nil, nil, 0)
end
end

local function getPlayerInv(player)
	Items = {}
	Armes = {}
	ArgentSale = {}
	
	ESX.TriggerServerCallback('policem:getOtherPlayerData', function(data)
		for i=1, #data.accounts, 1 do
			if data.accounts[i].name == 'black_money' and data.accounts[i].money > 0 then
				table.insert(ArgentSale, {
					label    = ESX.Math.Round(data.accounts[i].money),
					value    = 'black_money',
					itemType = 'item_account',
					amount   = data.accounts[i].money
				})
	
				break
			end
		end
	
		for i=1, #data.weapons, 1 do
			table.insert(Armes, {
				label    = ESX.GetWeaponLabel(data.weapons[i].name),
				value    = data.weapons[i].name,
				right    = data.weapons[i].ammo,
				itemType = 'item_weapon',
				amount   = data.weapons[i].ammo
			})
		end
	
		for i=1, #data.inventory, 1 do
			if data.inventory[i].count > 0 then
				table.insert(Items, {
					label    = data.inventory[i].label,
					right    = data.inventory[i].count,
					value    = data.inventory[i].name,
					itemType = 'item_standard',
					amount   = data.inventory[i].count
				})
			end
		end
	end, GetPlayerServerId(player))
	end


-- MENU FUNCTION --

local open = false 
local mainMenu8 = RageUI.CreateMenu('', 'Police Municipale')
local subMenu8 = RageUI.CreateSubMenu(mainMenu8, "", "Demande renfort")
local subMenu9 = RageUI.CreateSubMenu(mainMenu8, "", "Infos")
local subMenu10 = RageUI.CreateSubMenu(mainMenu8, "", "Intéraction")
local subMenu11 = RageUI.CreateSubMenu(mainMenu8, "", "Intéraction")
local subMenu12 = RageUI.CreateSubMenu(mainMenu8, "", "Intéraction Personelle")
local subMenu13 = RageUI.CreateSubMenu(mainMenu8, "", "Fouille")
local subMenu14 = RageUI.CreateSubMenu(mainMenu8, "", "Amende")
local subMenu15 = RageUI.CreateSubMenu(mainMenu8, "", "Chien")
local subMenu16 = RageUI.CreateSubMenu(mainMenu8, "", "License")
mainMenu8.Display.Header = true 
mainMenu8.Closed = function()
  open = false
end

function OpenMenupolicem()
	if open then 
		open = false
		RageUI.Visible(mainMenu8, false)
		return
	else
		open = true 
		RageUI.Visible(mainMenu8, true)
		CreateThread(function()
		while open do 
		   RageUI.IsVisible(mainMenu8,function()
			RageUI.Checkbox("Prendre son service", nil, servicepolicem, {}, {
                onChecked = function(index, items)
                    servicepolicem = true
                    local info = 'prise'
                    TriggerServerEvent('policem:PriseEtFinservice', info)
                end,
                onUnChecked = function(index, items)
                    servicepolicem = false
                    local info = 'fin'
                    TriggerServerEvent('policem:PriseEtFinservice', info)
                end
            })

			if servicepolicem then

			RageUI.Separator('↓ ~g~Communication ↓')

			RageUI.Button("Demande de renfort", nil, {RightLabel = "→"}, true , {
				onSelected = function()
				end
			}, subMenu8)

			-- RageUI.Button("Code Radio", nil, {RightLabel = "→"}, true , {
			-- 	onSelected = function()
			-- 	end
			-- }, subMenu9)
			
			RageUI.Separator('↓ ~o~Intération ↓')

			RageUI.Button("Gerés les license", nil, {RightLabel = "→"}, true , {
				onSelected = function()
				end
		   }, subMenu16)

			RageUI.Button("Intéraction Personelle", nil, {RightLabel = "→"}, true , {
				onSelected = function()
				end
			}, subMenu12)

			RageUI.Button("Intéraction sur une Personne", nil, {RightLabel = "→"}, true , {
				onSelected = function()
				end
			}, subMenu10)

			RageUI.Button("Intéraction sur un Chien", nil, {RightLabel = "→"}, true , {
				onSelected = function()
				end
			}, subMenu15)

			RageUI.Button("Intéraction sur un Véhicule", nil, {RightLabel = "→"}, true , {
				onSelected = function()
				end
			}, subMenu11)


		    end
			end)

			RageUI.IsVisible(subMenu8,function() 

				RageUI.Button("Petite demande", nil, {RightLabel = "→"}, not codesCooldown1 , {
					onSelected = function()
						codesCooldown1 = true 
						local raison = 'petit'
						local elements  = {}
						local playerPed = PlayerPedId()
						local coords  = GetEntityCoords(playerPed)
						local name = GetPlayerName(PlayerId())
					TriggerServerEvent('renfort', coords, raison)
					Citizen.SetTimeout(10000, function() codesCooldown1 = false end)
				end
			})
		
			RageUI.Button("Moyenne demande", nil, {RightLabel = "→"}, not codesCooldown2 , {
				onSelected = function()
					codesCooldown2 = true 
					local raison = 'importante'
					local elements  = {}
					local playerPed = PlayerPedId()
					local coords  = GetEntityCoords(playerPed)
					local name = GetPlayerName(PlayerId())
				TriggerServerEvent('renfort', coords, raison)
				Citizen.SetTimeout(10000, function() codesCooldown2 = false end)
			end
		})
		
		RageUI.Button("Grosse demande", nil, {RightLabel = "→"}, not codesCooldown3 , {
			onSelected = function()
				codesCooldown3 = true 
				local raison = 'omgad'
				local elements  = {}
				local playerPed = PlayerPedId()
				local coords  = GetEntityCoords(playerPed)
				local name = GetPlayerName(PlayerId())
			TriggerServerEvent('renfort', coords, raison)
			Citizen.SetTimeout(10000, function() codesCooldown3 = false end)
		end
	})

		   end)

		   RageUI.IsVisible(subMenu9,function() 


			RageUI.Button("Pause de service", nil, {RightLabel = "→"}, not codesCooldown4 , {
				onSelected = function()
					codesCooldown4 = true 
					local info = 'pause'
					TriggerServerEvent('policem:PriseEtFinservice', info)
					Citizen.SetTimeout(10000, function() codesCooldown4 = false end)
					end
	})
			RageUI.Button("Standby", nil, {RightLabel = "→"}, not codesCooldown5 , {
				onSelected = function()
					codesCooldown5 = true 
					local info = 'standby'
					TriggerServerEvent('policem:PriseEtFinservice', info)
					Citizen.SetTimeout(10000, function() codesCooldown5 = false end)
					end
	})
			RageUI.Button("Control en cours", nil, {RightLabel = "→"}, not codesCooldown6 , {
				onSelected = function()
					codesCooldown6 = true 
					local info = 'control'
					TriggerServerEvent('policem:PriseEtFinservice', info)
					Citizen.SetTimeout(10000, function() codesCooldown6 = false end)
					end
	})
			RageUI.Button("Refus d'obtempérer", nil, {RightLabel = "→"}, not codesCooldown7 , {
				onSelected = function()
					codesCooldown7 = true 
					local info = 'refus'
					TriggerServerEvent('policem:PriseEtFinservice', info)
					Citizen.SetTimeout(10000, function() codesCooldown7 = false end)
					end
	})
			RageUI.Button("Crime en cours", nil, {RightLabel = "→"}, not codesCooldown8 , {
				onSelected = function()
					codesCooldown8 = true 
					local info = 'crime'
					TriggerServerEvent('policem:PriseEtFinservice', info)
					Citizen.SetTimeout(10000, function() codesCooldown8 = false end)
					end
	})

end)

		RageUI.IsVisible(subMenu10,function() 

			RageUI.Button("Amende personnalisé", nil , {RightLabel = "→"}, true , {
				onSelected = function()  
					amount = KeyboardInput("Montant de la facture",nil,10)
					amount = tonumber(amount)
					local player, distance = ESX.Game.GetClosestPlayer()
	
					if player ~= -1 and distance <= 3.0 then
			
					if amount == nil then
						ESX.ShowNotification("~r~Problèmes~s~: Montant invalide")
					else
						local playerPed        = GetPlayerPed(-1)
						Citizen.Wait(5000)
						TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_police', ('police'), amount)
						-- Citizen.Wait(100)
						ESX.ShowNotification("~g~Vous avez bien envoyer la facture")
					end
			
					else
					ESX.ShowNotification("~r~Problèmes~s~: Aucun joueur à proximitée")
					end
				end
			});

			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

			if closestDistance <= 3.0 then 
				RageUI.Button("Fouiller", nil, {RightLabel = "→"}, true, {
					onActive = function()
						if closestPlayer ~= -1 then
							MarquerJoueur()
						end
					end,
					onSelected = function() 
						if closestDistance <= 5.0 then 
							getPlayerInv(closestPlayer)
							ExecuteCommand("me fouille l'individu")	
						end
					end,
				}, subMenu13)
			else
				RageUI.Button("Fouiller", "~r~Personnes aux Alentours !", {RightLabel = ">"}, false, {
					onSelected = function() 
					end
				})
			end

			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
			RageUI.Button("Menotter/démenotter", nil, {RightLabel = "→"}, true, {
				onSelected = function() 
					if closestDistance <= 5.0 then 
					TriggerServerEvent('policem:handcuff', GetPlayerServerId(closestPlayer))
				else
					ESX.ShowNotification('Aucun joueurs à proximité')
				end
			end
		})


	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	RageUI.Button("Escorter", nil, {RightLabel = "→"}, true, {
		onSelected = function() 
			if closestDistance <= 5.0 then 
			TriggerServerEvent('policem:drag', GetPlayerServerId(closestPlayer))
		else
			ESX.ShowNotification('Aucun joueurs à proximité')
		end
	end
})

      local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
      RageUI.Button("Mettre dans un véhicule", nil, {RightLabel = "→"}, true, {
	       onSelected = function() 
		if closestDistance <= 5.0 then 
		TriggerServerEvent('policem:putInVehicle', GetPlayerServerId(closestPlayer))
	else
		ESX.ShowNotification('Aucun joueurs à proximité')
	end
end
})

      local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
      RageUI.Button("Sortir du véhicule", nil, {RightLabel = "→"}, true, {
	     onSelected = function() 
		 if closestDistance <= 5.0 then 
		 TriggerServerEvent('policem:OutVehicle', GetPlayerServerId(closestPlayer))
	 else
		 ESX.ShowNotification('Aucun joueurs à proximité')
	 end
  end
  })

end)

RageUI.IsVisible(subMenu11,function() 

	RageUI.Button("Rechercher une plaque", nil, {RightLabel = "→"}, true , {
		onSelected = function()
			local numplaque = KeyboardInput("Combien ?", "", 10)
			local length = string.len(numplaque)
			if not numplaque or length < 2 or length > 8 then
				ESX.ShowNotification("Ce n'est ~r~pas~s~ un numéro enregistrement dans les fichier de ~b~policem")
			else
				Rechercherplaquevoiture(numplaque)
				RageUI.CloseAll()
			end
		end,})

	RageUI.Button("Mettre véhicule en fourriere", nil, {RightLabel = "→"}, true , {
		onSelected = function()
			local veh,dist4 = ESX.Game.GetClosestVehicle(playerCoords)
			local playerPed = PlayerPedId()
			if dist4 < 5 then
				TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
				Citizen.Wait(7500)
				DeleteEntity(veh)
				ClearPedTasksImmediately(playerPed)
				ESX.ShowNotification("Véhicule en fourrière ")
			end
		end,})

	RageUI.Button("Ouvrir / fermer de force", nil, {RightLabel = "→"}, true , {
		onSelected = function()
			local playerPed = PlayerPedId()
			local vehicle = ESX.Game.GetVehicleInDirection()
			local coords = GetEntityCoords(playerPed)

			if IsPedSittingInAnyVehicle(playerPed) then
				ESX.ShowNotification('Action impossible')
				return
			end

			if DoesEntityExist(vehicle) then
				isBusy = true
				TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_WELDING', 0, true)
				Citizen.CreateThread(function()
					Citizen.Wait(10000)

					SetVehicleDoorsLocked(vehicle, 1)
					SetVehicleDoorsLockedForAllPlayers(vehicle, false)
					ClearPedTasksImmediately(playerPed)

					ESX.ShowNotification('Véhicule dévérouiller')
					isBusy = false
				end)
			else
				ESX.ShowNotification('Pas de véhicules à proximité')
			end
	end,})

    end)

	RageUI.IsVisible(subMenu12, function()

        RageUI.Checkbox("Sortir/Rentrer un Bouclier", nil, bouclier, {}, {
            onChecked = function(index, items)
                bouclier = true
                EnableShield()
            end,
            onUnChecked = function(index, items)
				bouclier = false
                DisableShield()
            end
        })

		RageUI.Button("Props", nil , {RightLabel = "→"}, true , {
			onSelected = function()
		    ExecuteCommand("props")
			RageUI.CloseAll()
		end
	})

	RageUI.Button("Tablette", nil , {RightLabel = "→"}, true , {
		onSelected = function()
		ExecuteCommand("mdt")
		RageUI.CloseAll()
	end
})

	RageUI.Button("Extra 1", nil , {RightLabel = "→"}, true , {
		onSelected = function()
		ExecuteCommand("+extra1")
		-- RageUI.CloseAll()
	end
})

RageUI.Button("Extra 2", nil , {RightLabel = "→"}, true , {
	onSelected = function()
	ExecuteCommand("+extra2")
	-- RageUI.CloseAll()
end
})

RageUI.Button("Extra 3", nil , {RightLabel = "→"}, true , {
	onSelected = function()
	ExecuteCommand("+extra3")
	-- RageUI.CloseAll()
end
})

RageUI.Button("Extra 4", nil , {RightLabel = "→"}, true , {
	onSelected = function()
	ExecuteCommand("+extra4")
	-- RageUI.CloseAll()
end
})

RageUI.Button("Extra 5", nil , {RightLabel = "→"}, true , {
	onSelected = function()
	ExecuteCommand("+extra5")
	-- RageUI.CloseAll()
end
})

RageUI.Button("Extra 6", nil , {RightLabel = "→"}, true , {
	onSelected = function()
	ExecuteCommand("+extra6")
	-- RageUI.CloseAll()
end
})

RageUI.Button("Extra 7", nil , {RightLabel = "→"}, true , {
	onSelected = function()
	ExecuteCommand("+extra7")
	-- RageUI.CloseAll()
end
})


	end)
			RageUI.IsVisible(subMenu13,function()


			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
			RageUI.Separator("↓ ~r~Argent(s) sale(s) ~s~↓")
			for k,v  in pairs(ArgentSale) do
				RageUI.Button("Argent sale :", nil, {RightLabel = "~g~"..v.label.."€"}, true, {
					onSelected = function() 
						local combien = KeyboardInput("Combien ?", '' , '', 8)
						if tonumber(combien) > v.amount then
							RageUI.Popup({message = "~r~quantité invalide"})
						else
							TriggerServerEvent('policem:confiscatePlayerItem', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
						end
						RageUI.GoBack()
					end
				})
			end
	
			RageUI.Separator("↓ ~r~Objet(s) ~s~↓")
			for k,v  in pairs(Items) do
				RageUI.Button(v.label, nil, {RightLabel = "~g~x"..v.right}, true, {
					onSelected = function() 
						local combien = KeyboardInput("Combien ?", '' , '', 8)
						if tonumber(combien) > v.amount then
							RageUI.Popup({message = "~r~quantité invalide"})
						else
							TriggerServerEvent('policem:confiscatePlayerItem', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
						end
						RageUI.GoBack()
					end
				})
			end

			RageUI.Separator("↓ ~r~Arme(s) ~s~↓")

			for k,v  in pairs(Armes) do
				RageUI.Button(v.label, nil, {RightLabel = "com ~g~"..v.right.. " ~s~munitions"}, true, {
					onSelected = function() 
						local combien = KeyboardInput("Combien ?", '' , '', 8)
						if tonumber(combien) > v.amount then
							RageUI.Popup({message = "~r~quantité invalide"})
						else
							TriggerServerEvent('policem:confiscatePlayerItem', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
						end
						RageUI.GoBack()
					end
				})
			end
	
			end)


	RageUI.IsVisible(subMenu15,function()


RageUI.Checkbox("Sortir/Rentrer le chien", nil, chienpolicem, {}, {
    onChecked = function(index, items)
        chienpolicem = true
        if not DoesEntityExist(policemDog) then
        RequestModel(351016938)
        while not HasModelLoaded(351016938) do Wait(0) end
        policemDog = CreatePed(4, 351016938, GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.0, -0.98), 0.0, true, false)
        SetEntityAsMissionEntity(policemDog, true, true)
        ESX.ShowNotification('~g~Chien Spawn')
        end
    end,
    onUnChecked = function(index, items)
        chienpolicem = false
        ESX.ShowNotification('~r~Chien Rentrer')
        DeleteEntity(policemDog)
    end
})


RageUI.Button("Assis", nil, {RightLabel = "→"}, true , {
	onSelected = function()
		if DoesEntityExist(policemDog) then
			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(policemDog), true) <= 5.0 then
				if IsEntityPlayingAnim(policemDog, "creatures@rottweiler@amb@world_dog_sitting@base", "base", 3) then
					ClearPedTasks(policemDog)
				else
					loadDict('rcmnigel1c')
					TaskPlayAnim(PlayerPedId(), 'rcmnigel1c', 'hailing_whistle_waive_a', 8.0, -8, -1, 120, 0, false, false, false)
					Wait(2000)
					loadDict("creatures@rottweiler@amb@world_dog_sitting@base")
					TaskPlayAnim(policemDog, "creatures@rottweiler@amb@world_dog_sitting@base", "base", 8.0, -8, -1, 1, 0, false, false, false)
				end
			else
				ESX.ShowNotification('~r~Le chien est trop loin de vous !')
			end
		else
			ESX.ShowNotification('~r~Vous n\'avez pas de chien !')
		end
	end
	})

	RageUI.Button("Dire d'attaquer", nil, {RightLabel = "→"}, true , {
		onSelected = function()
			if DoesEntityExist(policemDog) then
				if not IsPedDeadOrDying(policemDog) then
					if GetDistanceBetweenCoords(GetEntityCoords(policemDog), GetEntityCoords(PlayerPedId()), true) <= 3.0 then
						local player, distance = ESX.Game.GetClosestPlayer()
						if distance ~= -1 then
							if distance <= 3.0 then
								local playerPed = GetPlayerPed(player)
								if not IsPedInCombat(policemDog, playerPed) then
									if not IsPedInAnyVehicle(playerPed, true) then
										TaskCombatPed(policemDog, playerPed, 0, 16)
									end
								else
									ClearPedTasksImmediately(policemDog)
								end
							end
						else
							ESX.ShowNotification("~r~Probleme~s~: Aucuns joueurs proche")
						end
					else
						ESX.ShowNotification('~r~Le chien est trop loin de vous !')
					end
				else
					ESX.ShowNotification('Votre chien est mort !')
				end
			else
				ESX.ShowNotification('~r~Vous n\'avez pas de chien')
			end
		end
		})

		RageUI.Button("Monter/sortir du véhicule", nil, {RightLabel = "→"}, true , {
			onSelected = function()
			    if DoesEntityExist(policemDog) then
                    if not IsPedInAnyVehicle(policemDog, false) then
                        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(policemDog)) <= 10.0 then
                            local vehicle = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 7.5, 0, 70)
                            print(vehicle)
                            if DoesEntityExist(vehicle) then
                                for i = 0, GetVehicleMaxNumberOfPassengers(vehicle) do
                                    if IsVehicleSeatFree(vehicle, i) then
                                        TaskEnterVehicle(policemDog, vehicle, 15.0, i, 1.0, 1, 0)
                                        break
                                    end
                                end
                            else
                                ESX.ShowNotification('~r~vous n\'avez pas de véhicule !')
                            end
                        else
                            ESX.ShowNotification('~r~Le chien est trop loin de vous !')
                        end
                    else
                        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(policemDog)) <= 5.0 then
                            TaskLeaveVehicle(policemDog, GetVehiclePedIsIn(policemDog, false), 0)
                        else
                            ESX.ShowNotification('~r~Le chien est trop loin de vous !')
                        end
                    end
                else
                    ESX.ShowNotification('~r~Vous n\'avez pas de chien !')
				end
			end
			})

			RageUI.Button("Suis-moi", nil, {RightLabel = "→"}, true , {
				onSelected = function()
				    local playerPed = PlayerPedId()
                    if DoesEntityExist(policemDog) then
                        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(policemDog), true) <= 5.0 then
                            TaskGoToEntity(policemDog, playerPed, -1, 1.0, 10.0, 1073741824, 1)
                        else
                            ESX.ShowNotification('~r~Le chien est trop loin de vous !')
                        end
                    else
                        ESX.ShowNotification('~r~Vous n\'avez pas de chien !')
					end
				end
				})

			end)

			RageUI.IsVisible(subMenu16, function()

				RageUI.Separator("↓ License ↓")

  RageUI.Button('Saisir le permis de conduire (Voiture)', nil, {RightLabel = "→"}, true , {
	  onHovered = function()
		  DisplayClosetPlayer()
	  end,
	  onSelected = function()
		  local player, dst = GetClosestPlayer()
		  if dst ~= nil and dst < 2 then
			  local sID = GetPlayerServerId(player)
			  TriggerServerEvent("esx_license:removeLicense", sID, "drive")
			  ESX.ShowNotification("Vous avez retiré le permis de la personne.")
		  end
	  end,
  })

  RageUI.Button('Saisir le permis de conduire (Poids lourd)', nil, {RightLabel = "→"}, true , {
	  onHovered = function()
		  DisplayClosetPlayer()
	  end,
	  onSelected = function()
		  local player, dst = GetClosestPlayer()
		  if dst ~= nil and dst < 2 then
			  local sID = GetPlayerServerId(player)
			  TriggerServerEvent("esx_license:removeLicense", sID, "drive_truck")
			  ESX.ShowNotification("Vous avez retiré le permis de la personne.")
		  end
	  end,
  })

  RageUI.Button('Saisir le permis de conduire (Moto)', nil, {RightLabel = "→"}, true , {
	  onHovered = function()
		  DisplayClosetPlayer()
	  end,
	  onSelected = function()
		  local player, dst = GetClosestPlayer()
		  if dst ~= nil and dst < 2 then
			  local sID = GetPlayerServerId(player)
			  TriggerServerEvent("esx_license:removeLicense", sID, "drive_bike")
			  ESX.ShowNotification("Vous avez retiré le permis de la personne.")
		  end
	  end,
  })			
			
			end)

		 Wait(0)
		end
	 end)
  end
end

-- OUVERTURE DU MENU --

Keys.Register('F6', 'policem', 'Ouvrir le menu Police municipale', function()
	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'policem' then
		OpenMenupolicem()
	end
end)

-- Infos policem

RegisterNetEvent('policem:InfoService')
AddEventHandler('policem:InfoService', function(service, nom)
	if service == 'prise' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		-- ESX.ShowAdvancedNotification('INFORMATIONS', '~b~Prise de service', 'Agent: '..nom..'\n~w~Information: ~g~Prise de service.', 'CHAR_MICHAEL', 8)
		exports['okokNotify']:Alert("Prise de service", "L'agent "..nom.."\nprend son service.", 5000, 'info')
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	elseif service == 'fin' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		-- ESX.ShowAdvancedNotification('INFORMATIONS', '~b~Fin de service', 'Agent: '..nom..'\n~w~Information: ~r~Fin de service.', 'CHAR_MICHAEL', 8)
		exports['okokNotify']:Alert("Fin de service", "L'agent "..nom.."\nprend sa fin de service.", 5000, 'info')
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	elseif service == 'pause' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		-- ESX.ShowAdvancedNotification('INFORMATIONS', '~b~Pause de service', 'Agent: '..nom..'\n~w~Code: 10-6\n~w~Information: ~o~Pause de service.', 'CHAR_MICHAEL', 8)
		exports['okokNotify']:Alert("Pause de service", "L'agent "..nom.."\nfait une pause de service.", 5000, 'info')
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	elseif service == 'standby' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		ESX.ShowAdvancedNotification('INFORMATIONS', '~b~Mise en standby', 'Agent: '..nom..'\n~w~Code: 10-12\n~w~Information: Standby, en attente de dispatch.', 'CHAR_MICHAEL', 8)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	elseif service == 'control' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		ESX.ShowAdvancedNotification('INFORMATIONS', '~b~Control routier', 'Agent: '..nom..'\n~w~Code: 10-48\n~w~Information: Control routier en cours.', 'CHAR_MICHAEL', 8)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	elseif service == 'refus' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		ESX.ShowAdvancedNotification('INFORMATIONS', '~b~Refus d\'obtemperer', 'Agent: '..nom..'\n~w~Code: 10-30\n~w~Information: Refus d\'obtemperer / Delit de fuite en cours.', 'CHAR_MICHAEL', 8)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	elseif service == 'crime' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		ESX.ShowAdvancedNotification('INFORMATIONS', '~b~Crime en cours', 'Agent: '..nom..'\n~w~Code: 10-31\n~w~Information: Crime en cours / poursuite en cours.', 'CHAR_MICHAEL', 8)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	end
end)

-- Renfort

RegisterNetEvent('renfort:setBlip')
AddEventHandler('renfort:setBlip', function(coords, raison)
	if raison == 'petit' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
		-- ESX.ShowAdvancedNotification('INFORMATIONS', '~b~Demande de renfort', 'Demande de renfort demandé.\nRéponse: CODE-2\n~w~Importance: Légère.', 'CHAR_MICHAEL', 8)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
		color = 2
	elseif raison == 'importante' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
		-- ESX.ShowAdvancedNotification('INFORMATIONS', '~b~Demande de renfort', 'Demande de renfort demandé.\nRéponse: CODE-3\n~w~Importance: ~o~Importante.', 'CHAR_MICHAEL', 8)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
		color = 47
	elseif raison == 'omgad' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
		PlaySoundFrontend(-1, "FocusIn", "HintCamSounds", 1)
		-- ESX.ShowAdvancedNotification('INFORMATIONS', '~b~Demande de renfort', 'Demande de renfort demandé.\nRéponse: CODE-99\n~w~Importance: ~r~URGENTE !\nDANGER IMPORTANT', 'CHAR_MICHAEL', 8)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
		PlaySoundFrontend(-1, "FocusOut", "HintCamSounds", 1)
		color = 1
	end
	local blipId = AddBlipForCoord(coords)
	SetBlipSprite(blipId, 161)
	SetBlipScale(blipId, 1.2)
	SetBlipColour(blipId, color)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Demande renfort')
	EndTextCommandSetBlipName(blipId)
	Wait(80 * 1000)
	RemoveBlip(blipId)
end)

---- KeyboardInput

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)


    AddTextEntry('FMMC_KEY_TIP1', TextEntry) 
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
    blockinput = true

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
        Citizen.Wait(0)
    end
        
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult() 
        Citizen.Wait(500) 
        blockinput = false
        return result 
    else
        Citizen.Wait(500) 
        blockinput = false 
        return nil 
    end
end
-------------------------- Intéraction 


RegisterNetEvent('policem:handcuff')
AddEventHandler('policem:handcuff', function()

  IsHandcuffed    = not IsHandcuffed;
  local playerPed = GetPlayerPed(-1)

  Citizen.CreateThread(function()

    if IsHandcuffed then

        RequestAnimDict('mp_arresting')
        while not HasAnimDictLoaded('mp_arresting') do
            Citizen.Wait(100)
        end

      TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
      DisableControlAction(2, 37, true)
      SetEnableHandcuffs(playerPed, true)
      SetPedCanPlayGestureAnims(playerPed, false)
      FreezeEntityPosition(playerPed,  true)
      DisableControlAction(0, 24, true) -- Attack
      DisableControlAction(0, 257, true) -- Attack 2
      DisableControlAction(0, 25, true) -- Aim
      DisableControlAction(0, 263, true) -- Melee Attack 1
      DisableControlAction(0, 37, true) -- Select Weapon
      DisableControlAction(0, 47, true)  -- Disable weapon
      

    else

      ClearPedSecondaryTask(playerPed)
      SetEnableHandcuffs(playerPed, false)
      SetPedCanPlayGestureAnims(playerPed,  true)
      FreezeEntityPosition(playerPed, false)

    end

  end)
end)


RegisterNetEvent('policem:putInVehicle')
AddEventHandler('policem:putInVehicle', function()

  local playerPed = GetPlayerPed(-1)
  local coords    = GetEntityCoords(playerPed)

  if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then

    local vehicle = GetClosestVehicle(coords.x,  coords.y,  coords.z,  5.0,  0,  71)

    if DoesEntityExist(vehicle) then

      local maxSeats = GetVehicleMaxNumberOfPassengers(vehicle)
      local freeSeat = nil

      for i=maxSeats - 1, 0, -1 do
        if IsVehicleSeatFree(vehicle,  i) then
          freeSeat = i
          break
        end
      end

      if freeSeat ~= nil then
        TaskWarpPedIntoVehicle(playerPed,  vehicle,  freeSeat)
      end

    end

  end

end)


RegisterNetEvent("policem:OutVehicle")
AddEventHandler("policem:OutVehicle", function()
    TaskLeaveAnyVehicle(GetPlayerPed(-1), 0, 0)
end)


local EnTrainEscorter = false
local PolicierEscorte = nil
RegisterNetEvent("policem:drag")
AddEventHandler("policem:drag", function(player)
    EnTrainEscorter = not EnTrainEscorter
    print(EnTrainEscorter)
    PolicierEscorte = tonumber(player)
    if EnTrainEscorter then
        escort()
    end
end)

function escort()
    Citizen.CreateThread(function()
        local pPed = GetPlayerPed(-1)
	    while EnTrainEscorter do
            Wait(1)
            pPed = GetPlayerPed(-1)
	    	local targetPed = GetPlayerPed(GetPlayerFromServerId(PolicierEscorte))

	    	if not IsPedSittingInAnyVehicle(targetPed) then
	    		AttachEntityToEntity(pPed, targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
	    	else
	    		EnTrainEscorter = false
	    		DetachEntity(pPed, true, false)
	    	end

	    	if IsPedDeadOrDying(targetPed, true) then
	    		EnTrainEscorter = false
	    		DetachEntity(pPed, true, false)
	    	end
        end
        DetachEntity(pPed, true, false)
    end)
end

function GetClosestPlayer()
	local pPed = GetPlayerPed(-1)
	local players = GetActivePlayers()
	local coords = GetEntityCoords(pPed)
	local pCloset = nil
	local pClosetPos = nil
	local pClosetDst = nil
	for k,v in pairs(players) do
		if GetPlayerPed(v) ~= pPed then
			local oPed = GetPlayerPed(v)
			local oCoords = GetEntityCoords(oPed)
			local dst = GetDistanceBetweenCoords(oCoords, coords, true)
			if pCloset == nil then
				pCloset = v
				pClosetPos = oCoords
				pClosetDst = dst
			else
				if dst < pClosetDst then
					pCloset = v
					pClosetPos = oCoords
					pClosetDst = dst
				end
			end
		end
	end

	return pCloset, pClosetDst
end


function Rechercherplaquevoiture(plaquerechercher)
    local PlaqueMenu = RageUI.CreateMenu("plaque d'immatriculation", "Informations")
    ESX.TriggerServerCallback('policem:getVehicleInfos', function(retrivedInfo)
    RageUI.Visible(PlaqueMenu, not RageUI.Visible(PlaqueMenu))
        while PlaqueMenu do
            Citizen.Wait(0)
					RageUI.IsVisible(PlaqueMenu,function()
                            RageUI.Button("Numéro de plaque : ", nil, {RightLabel = retrivedInfo.plate}, true, {
                                	onSelected = function()
                                    end
                                })
						
                            if not retrivedInfo.owner then
                                RageUI.Button("Propriétaire : ", nil, {RightLabel = "Inconnu"}, true, {
                                    	onSelected = function()
                                		end
                                    })
                            else
                                RageUI.Button("Propriétaire : ", nil, {RightLabel = retrivedInfo.owner}, true, {
                                    	onSelected = function()
										end
                                    })

								local hashvoiture = retrivedInfo.vehicle.model
								local nomvoituremodele = GetDisplayNameFromVehicleModel(hashvoiture)
								local nomvoituretexte  = GetLabelText(nomvoituremodele)

                                RageUI.Button("Modèle du véhicule : ", nil, {RightLabel = nomvoituretexte}, true, {
                                    	onSelected = function()
										end
                                    })
                            end
                end, function()
                end)
            if not RageUI.Visible(PlaqueMenu) then
            PlaqueMenu = RMenu:DeleteType("plaque d'immatriculation", true)
        end
    end
end, plaquerechercher)
end

loadDict = function(dict)
    while not HasAnimDictLoaded(dict) do Wait(0) RequestAnimDict(dict) end
end

-- ANIM
local animDict = "combat@gestures@gang@pistol_1h@beckon"
local animName = "0"

local prop = "prop_ballistic_shield"

function EnableShield()
    shieldActive = true
    local ped = GetPlayerPed(-1)
    local pedPos = GetEntityCoords(ped, false)
    
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Citizen.Wait(250)
    end

    TaskPlayAnim(ped, animDict, animName, 8.0, -8.0, -1, (2 + 16 + 32), 0.0, 0, 0, 0)

    RequestModel(GetHashKey(prop))
    while not HasModelLoaded(GetHashKey(prop)) do
        Citizen.Wait(250)
    end

    local shield = CreateObject(GetHashKey(prop), pedPos.x, pedPos.y, pedPos.z, 1, 1, 1)
    shieldEntity = shield
    AttachEntityToEntity(shieldEntity, ped, GetEntityBoneIndexByName(ped, "IK_L_Hand"), 0.0, -0.05, -0.10, -30.0, 180.0, 40.0, 0, 0, 1, 0, 0, 1)
    SetWeaponAnimationOverride(ped, GetHashKey("Gang1H"))
    SetEnableHandcuffs(ped, true)
end

function DisableShield()
    local ped = GetPlayerPed(-1)
    DeleteEntity(shieldEntity)
    ClearPedTasksImmediately(ped)
    SetWeaponAnimationOverride(ped, GetHashKey("Default"))
    SetEnableHandcuffs(ped, false)
    shieldActive = false
end

Citizen.CreateThread(function()
    while true do
        if shieldActive then
            local ped = GetPlayerPed(-1)
            if not IsEntityPlayingAnim(ped, animDict, animName, 1) then
                RequestAnimDict(animDict)
                while not HasAnimDictLoaded(animDict) do
                    Citizen.Wait(100)
                end
            
                TaskPlayAnim(ped, animDict, animName, 8.0, -8.0, -1, (2 + 16 + 32), 0.0, 0, 0, 0)
            end
        end
        Citizen.Wait(500)
    end
end)
