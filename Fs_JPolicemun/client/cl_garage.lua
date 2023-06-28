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

-- MENU FUNCTION --

local open = false 
local mainMenu6 = RageUI.CreateMenu('', 'Garage')
mainMenu6.Display.Header = true 
mainMenu6.Closed = function()
  open = false
end

function OpenMenuGaragepolicem()
     if open then 
         open = false
         RageUI.Visible(mainMenu6, false)
         return
     else
         open = true 
         RageUI.Visible(mainMenu6, true)
         CreateThread(function()
         while open do 
            RageUI.IsVisible(mainMenu6,function() 

              RageUI.Button("Ranger votre véhicule", nil, {RightLabel = "→→"}, true , {
                onSelected = function()
                  local veh,dist4 = ESX.Game.GetClosestVehicle(playerCoords)
                  if dist4 < 4 then
                      DeleteEntity(veh)
                      RageUI.CloseAll()
                  end
                    end
                  })

                for k,v in pairs(Config.Vehiculespolicem) do
                RageUI.Button(v.buttoname, nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        if not ESX.Game.IsSpawnPointClear(vector3(v.spawnzone.x, v.spawnzone.y, v.spawnzone.z), 10.0) then
                        ESX.ShowNotification("~g~policem\n~r~Point de spawn bloquée")
                        else
                        local model = GetHashKey(v.spawnname)
                        RequestModel(model)
                        while not HasModelLoaded(model) do Wait(10) end
                        local policemveh = CreateVehicle(model, v.spawnzone.x, v.spawnzone.y, v.spawnzone.z, v.headingspawn, true, false)
                        -- SetVehicleNumberPlateText(policemveh, "policem"..math.random(50, 999))
                        SetVehicleFixed(policemveh)
                        TaskWarpPedIntoVehicle(PlayerPedId(),  policemveh,  -1)
                        SetVehRadioStation(policemveh, 0)
                        RageUI.CloseAll()
                        end
                    end
                })


              end
            end)
          Wait(0)
         end
      end)
   end
end


Citizen.CreateThread(function()
  while true do 
      local wait = 750
      if ESX.PlayerData.job and ESX.PlayerData.job.name == 'policem' then
          for k in pairs(Config.Position.GarageVehicule) do 
              local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
              local pos = Config.Position.GarageVehicule
              local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

              if dist <= 5.0 then 
                  wait = 0
                  DrawMarker(Config.MarkerType, pos[k].x, pos[k].y, pos[k].z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, Config.MarkerSizeLargeur, Config.MarkerSizeEpaisseur, Config.MarkerSizeHauteur, Config.MarkerColorR, Config.MarkerColorG, Config.MarkerColorB, Config.MarkerOpacite, Config.MarkerSaute, true, p19, Config.MarkerTourne)  
              end

              if dist <= 2.0 then 
                  wait = 0
                  Visual.Subtitle(Config.TextGarageVehicule, 1)
                  if IsControlJustPressed(1,51) then
                    OpenMenuGaragepolicem()
                  end
              end
          end
      end
  Citizen.Wait(wait)
  end
end)


-- Garage Helico

-- MENU FUNCTION --

local open = false 
local mainMenu6 = RageUI.CreateMenu('Garage', 'policem')
mainMenu6.Display.Header = true 
mainMenu6.Closed = function()
  open = false
end

function OpenMenuGarageHelipolicem()
     if open then 
         open = false
         RageUI.Visible(mainMenu6, false)
         return
     else
         open = true 
         RageUI.Visible(mainMenu6, true)
         CreateThread(function()
         while open do 
            RageUI.IsVisible(mainMenu6,function() 

              RageUI.Button("Ranger votre véhicule", nil, {RightLabel = "→→"}, true , {
                onSelected = function()
                  local veh,dist4 = ESX.Game.GetClosestVehicle(playerCoords)
                  if dist4 < 4 then
                      DeleteEntity(veh)
                      RageUI.CloseAll()
                  end
                    end
                  })

              RageUI.Separator("~h~↓ Véhicules ↓")

                for k,v in pairs(Config.Helicopolicem) do
                RageUI.Button(v.buttonameheli, nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        if not ESX.Game.IsSpawnPointClear(vector3(v.spawnzoneheli.x, v.spawnzoneheli.y, v.spawnzoneheli.z), 10.0) then
                        ESX.ShowNotification("~g~policem\n~r~Point de spawn bloquée")
                        else
                        local model = GetHashKey(v.spawnnameheli)
                        RequestModel(model)
                        while not HasModelLoaded(model) do Wait(10) end
                        local policemheli = CreateVehicle(model, v.spawnzoneheli.x, v.spawnzoneheli.y, v.spawnzoneheli.z, v.headingspawnheli, true, false)
                        -- SetVehicleNumberPlateText(policemheli, "policem"..math.random(50, 999))
                        SetVehicleFixed(policemheli)
                        TaskWarpPedIntoVehicle(PlayerPedId(),  policemheli,  -1)
                        SetVehRadioStation(policemheli, 0)
                        RageUI.CloseAll()
                        end
                    end
                })


              end
            end)
          Wait(0)
         end
      end)
   end
end


Citizen.CreateThread(function()
  while true do 
      local wait = 750
      if ESX.PlayerData.job and ESX.PlayerData.job.name == 'policem' then
          for k in pairs(Config.Position.GarageHeli) do 
              local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
              local pos = Config.Position.GarageHeli
              local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

              if dist <= 5.0 then 
                  wait = 0
                  DrawMarker(Config.MarkerType, pos[k].x, pos[k].y, pos[k].z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, Config.MarkerSizeLargeur, Config.MarkerSizeEpaisseur, Config.MarkerSizeHauteur, Config.MarkerColorR, Config.MarkerColorG, Config.MarkerColorB, Config.MarkerOpacite, Config.MarkerSaute, true, p19, Config.MarkerTourne)  
              end

              if dist <= 2.0 then 
                  wait = 0
                  Visual.Subtitle(Config.TextGarageHeli, 1)
                  if IsControlJustPressed(1,51) then
                    OpenMenuGarageHelipolicem()
                  end
              end
          end
      end
  Citizen.Wait(wait)
  end
end)

local npc2 = {
	{hash="s_m_y_ranger_01", x = -2020.18, y = -464.40, z = 12.21, a=142.03},
}

Citizen.CreateThread(function()
	for _, item2 in pairs(npc2) do
		local hash = GetHashKey(item2.hash)
		while not HasModelLoaded(hash) do
		RequestModel(hash)
		Wait(20)
		end
		ped2 = CreatePed("PED_TYPE_CIVFEMALE", item2.hash, item2.x, item2.y, item2.z-0.92, item2.a, false, true)
		SetBlockingOfNonTemporaryEvents(ped2, true)
		FreezeEntityPosition(ped2, true)
		SetEntityInvincible(ped2, true)
	end
end)