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

-- Function --

function applySkinSpecific(infos)
	TriggerEvent('skinchanger:getSkin', function(skin)
		local uniformObject
		if skin.sex == 0 then
			uniformObject = infos.variations.male
		else
			uniformObject = infos.variations.female
		end
		if uniformObject then
			TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
		end

		infos.onEquip()
	end)
end

-- MENU FUNCTION --

local open = false 
local mainMenu6 = RageUI.CreateMenu('', 'Vestaire')
mainMenu6.Display.Header = true 
mainMenu6.Closed = function()
  open = false
end

function Vestiairepolicem()
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

              
              RageUI.Separator("↓ ~y~Gilet Par Balle ~s~↓")

              RageUI.Button("Prendre le : ~r~GPB PM", nil,{RightLabel = "→"}, true,{
                onSelected = function()
                  AddArmourToPed(playerPed,100)
                  vgillet1()
              end
              })

              RageUI.Button("Prendre le : ~r~GPB GSI", nil,{RightLabel = "→"}, true,{
                onSelected = function()
                  AddArmourToPed(playerPed,100)
                  gpbgsi1()
              end
              })

              RageUI.Separator("↓ ~y~Accessoires ~s~↓")

              RageUI.Button("Prendre le : ~r~Casque Anti Emeute", nil,{RightLabel = "→"}, true,{
                onSelected = function()
                  AddArmourToPed(playerPed,100)
                  vgilletanti()
              end
              })

              RageUI.Button("Prendre le : ~r~Casque Moto", nil,{RightLabel = "→"}, true,{
                onSelected = function()
                  AddArmourToPed(playerPed,100)
                  vgilletmoto()
              end
              })

              RageUI.Button("Prendre le : ~r~Casque Velo", nil,{RightLabel = "→"}, true,{
                onSelected = function()
                  AddArmourToPed(playerPed,100)
                  velocasque()
              end
              })


              RageUI.Button("Prendre le : ~r~Oreillette", nil,{RightLabel = "→"}, true,{
                onSelected = function()
                  AddArmourToPed(playerPed,100)
                  Accessoreil()
              end
              })

              RageUI.Separator("↓ ~b~Tenues Civil ~s~↓")
			
              for _,infos in pairs(Config.policemCloak.clothes.specials) do
                RageUI.Button(infos.label, nil, {RightLabel = "→"}, ESX.PlayerData.job.grade >= infos.minimum_grade, {
                onSelected = function()
                     applySkinSpecific(infos)
                  end
                })	

                RageUI.Separator("↓ ~y~Tenues de service ~s~↓")
                for _,infos in pairs(Config.policemCloak.clothes.grades) do
                  RageUI.Button(infos.label, nil, {RightLabel = "→"}, ESX.PlayerData.job.grade >= infos.minimum_grade, {
                    onSelected = function()
                        applySkinSpecific(infos)
                      end
                    })

            


                  end
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
    for k in pairs(Config.Position.Vestaire) do
              local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
              local pos = Config.Position.Vestaire
              local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

              if dist <= Config.MarkerDistance then
                  wait = 0
                  DrawMarker(Config.MarkerType, pos[k].x, pos[k].y, pos[k].z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, Config.MarkerSizeLargeur, Config.MarkerSizeEpaisseur, Config.MarkerSizeHauteur, Config.MarkerColorR, Config.MarkerColorG, Config.MarkerColorB, Config.MarkerOpacite, Config.MarkerSaute, true, p19, Config.MarkerTourne)  
              end

              if dist <= 1.0 then
                  wait = 0
                  Visual.Subtitle(Config.TextVestaire, 1)
                  if IsControlJustPressed(1,51) then
                    Vestiairepolicem()
                  end
              end
          end
  end
  Citizen.Wait(wait)
  end
end)


function vgillet1()
  local model = GetEntityModel(GetPlayerPed(-1))

  AddArmourToPed(playerPed,100)
  SetPedArmour(playerPed, 100)
  TriggerEvent('skinchanger:getSkin', function(skin)
      if model == GetHashKey("mp_m_freemode_01") then
          clothesSkin = {
              ['bproof_1'] = 4,  ['bproof_2'] = 0
          }
      end
      TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
  end)
end

function gpbgsi1()
  local model = GetEntityModel(GetPlayerPed(-1))

  AddArmourToPed(playerPed,100)
  SetPedArmour(playerPed, 100)
  TriggerEvent('skinchanger:getSkin', function(skin)
      if model == GetHashKey("mp_m_freemode_01") then
          clothesSkin = {
              ['bproof_1'] = 7,  ['bproof_2'] = 0
          }
      end
      TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
  end)
end

function vgilletanti()
  local model = GetEntityModel(GetPlayerPed(-1))

  AddArmourToPed(playerPed,100)
  SetPedArmour(playerPed, 100)
  TriggerEvent('skinchanger:getSkin', function(skin)
      if model == GetHashKey("mp_m_freemode_01") then
          clothesSkin = {
            ['helmet_1'] = 18,  ['helmet_2'] = 1
          }
      end
      TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
  end)
end

function vgilletmoto()
  local model = GetEntityModel(GetPlayerPed(-1))

  AddArmourToPed(playerPed,100)
  SetPedArmour(playerPed, 100)
  TriggerEvent('skinchanger:getSkin', function(skin)
      if model == GetHashKey("mp_m_freemode_01") then
          clothesSkin = {
            ['helmet_1'] = 17,  ['helmet_2'] = 0
          }
      end
      TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
  end)
end

function velocasque()
  local model = GetEntityModel(GetPlayerPed(-1))

  AddArmourToPed(playerPed,100)
  SetPedArmour(playerPed, 100)
  TriggerEvent('skinchanger:getSkin', function(skin)
      if model == GetHashKey("mp_m_freemode_01") then
          clothesSkin = {
            ['helmet_1'] = 49,  ['helmet_2'] = 0
          }
      end
      TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
  end)
end

function Accessoreil()
  local model = GetEntityModel(GetPlayerPed(-1))

  AddArmourToPed(playerPed,100)
  SetPedArmour(playerPed, 100)
  TriggerEvent('skinchanger:getSkin', function(skin)
      if model == GetHashKey("mp_m_freemode_01") then
          clothesSkin = {
              ['mask_1'] = 121,  ['mask_2'] = 0
          }
      end
      TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
  end)
end