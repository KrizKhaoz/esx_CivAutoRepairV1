-------------- DO NOT TRADE/SELL THIS SCRIPT IT IS 100% FREE ON FIVEM FORUMS ------------------------
Key = 201 -- ENTER
quickKey = 83
fuel = 0
finishedfuel = 100


local ESX = nil
local PlayerData                = {}
repairing = false
stage1 = false
stage2 = false
stage3 = false
stage4 = false
stage5 = false
stage6 = false
insidemarkercheck = false

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
	while repairing == true do
		SetVehicleUndriveable(vehicle,true)
		Citizen.Wait(0)
	end
end)

CivRepairStation = {
	{1148.8618164063,-776.84155273438,55.598728179932}
}


function DrawSpecialText(m_text, showtime)
	SetTextEntry_2("STRING")
	AddTextComponentString(m_text)
	DrawSubtitleTimed(showtime, 1)
end

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)
		if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then 
			for i = 1, #CivRepairStation do
				garageCoords2 = CivRepairStation[i]
				DrawMarker(-27, garageCoords2[1], garageCoords2[2], garageCoords2[3], 0, 0, 0, 0, 0, 0, 5.0, 5.0, 2.0, 0, 157, 0, 155, 0, 0, 2, 0, 0, 0, 0)
				if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), garageCoords2[1], garageCoords2[2], garageCoords2[3], true ) < 5 and PlayerData.job ~= nil and PlayerData.job.name == 'mecano' then
					--ESX.ShowHelpNotification('Press ~INPUT_CONTEXT~ to Quick Vehicle Repair')
					DrawSpecialText("Press ~r~Enter ~s~For Auto Repairs")
					if(IsControlJustPressed(1, Key)) then
						TriggerServerEvent('carrepair:checkmoney')
						insidemarkercheck = true
					end
					if(IsControlJustPressed(1, quickKey)) then
						TriggerServerEvent('carrepair:checkmoney2')
					end
				end
			end
		end
	end
end)
local menuEnabled = false 
function ToggleActionMenu()
	-- Make the menuEnabled variable not itself 
	-- e.g. not true = false, not false = true 
	menuEnabled = not menuEnabled

	if ( menuEnabled ) then 
		-- Focuses on the NUI, the second parameter toggles the 
		-- onscreen mouse cursor. 
		SetNuiFocus( true, true )

		-- Sends a message to the JavaScript side, telling it to 
		-- open the menu. 
		SendNUIMessage({
			showmenu = true 
		})
	else 
		-- Bring the focus back to the game
		SetNuiFocus( false )

		-- Sends a message to the JavaScript side, telling it to
		-- close the menu.
		SendNUIMessage({
			hidemenu = true 
		})
	end 
end 
--DO-NOT-EDIT-BELLOW-THIS-LINE--
--DO-NOT-EDIT-BELLOW-THIS-LINE--
--DO-NOT-EDIT-BELLOW-THIS-LINE--
--DO-NOT-EDIT-BELLOW-THIS-LINE--
--DO-NOT-EDIT-BELLOW-THIS-LINE--

Citizen.CreateThread(function()
	while true do
			local player = PlayerId()
	local plyPed = GetPlayerPed(player)
	local plyPos = GetEntityCoords(plyPed, false)
	local markerPos = { 1153.9860839844, -781.12658691406, 57.798682403564 }
	local distance = Vdist(plyPos.x, plyPos.y, plyPos.z, 1153.9860839844,  -781.12658691406, 57.798682403564)
if distance < 9 then
   insidemarkercheck = true
end

if distance > 9 then
   insidemarkercheck = false
end
if insidemarkercheck == true and stage1 == false and stage2 == false and stage3 == false and stage4 == false and stage5 == false and stage6 == false then

end

if insidemarkercheck == false and stage1 == false and stage2 == false and stage3 == false and stage4 == false and stage5 == false and stage6 == false then

end

if insidemarkercheck == true and stage1 == true and stage2 == false and stage3 == false and stage4 == false and stage5 == false and stage6 == false then
 Draw3DText(1153.9860839844, -781.12658691406, 57.598682403564 + 0.2, tostring("~w~We are still looking over your vehicle ~o~Come back later"))
  Draw3DText2(1153.9860839844, -781.12658691406, 57.598682403564, tostring("~w~Repair Status: ~r~25%"))
end

if insidemarkercheck == true and stage1 == false and stage2 == true and stage3 == false and stage4 == false and stage5 == false and stage6 == false then
 Draw3DText(1153.9860839844, -781.12658691406, 57.598682403564 + 0.2, tostring("~w~We are still looking over your vehicle ~o~Come back later"))
	           Draw3DText2(1153.9860839844, -781.12658691406, 57.598682403564, tostring("~w~Repair Status: ~o~45%"))
end 

if insidemarkercheck == true and stage1 == false and stage2 == false and stage3 == true and stage4 == false and stage5 == false and stage6 == false then
 Draw3DText(1153.9860839844, -781.12658691406, 57.598682403564 + 0.2, tostring("~w~We are still looking over your vehicle ~o~Come back later"))
	           Draw3DText2(1153.9860839844, -781.12658691406, 57.598682403564, tostring("~w~Repair Status: ~o~60%"))
end 


if insidemarkercheck == true and stage1 == false and stage2 == false and stage3 == false and stage4 == true and stage5 == false and stage6 == false then
 Draw3DText(1153.9860839844, -781.12658691406, 57.598682403564 + 0.2, tostring("~w~We are still looking over your vehicle ~o~Come back later"))
	           Draw3DText2(1153.9860839844, -781.12658691406, 57.598682403564, tostring("~w~Repair Status: ~g~85%"))
end 

if insidemarkercheck == true and stage1 == false and stage2 == false and stage3 == false and stage4 == false and stage5 == true and stage6 == false then
 Draw3DText(1153.9860839844, -781.12658691406, 57.598682403564 + 0.2, tostring("~w~We are still looking over your vehicle ~o~Come back later"))
	           Draw3DText2(1153.9860839844, -781.12658691406, 57.598682403564, tostring("~w~Repair Status: ~g~95%"))
end 

if insidemarkercheck == true and stage1 == false and stage2 == false and stage3 == false and stage4 == false and stage5 == false and stage6 == true then
 Draw3DText(1153.9860839844, -781.12658691406, 57.598682403564 + 0.2, tostring("~w~Vehicle has been detailed repaired and fixed ~g~You can now enter your vehicle"))
	           Draw3DText2(1153.9860839844, -781.12658691406, 57.598682403564, tostring("~w~Repair Status: ~g~100%"))
end 

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
	while true do
			local player = PlayerId()
	local plyPed = GetPlayerPed(player)
	local plyPos = GetEntityCoords(plyPed, false)

if stage1 == true then
         
     end
if stage2 == true then
	        
	     end
if stage3 == true then

end

if stage4 == true then

end

if stage5 == true then

end

if stage6 == true then
Draw3DText(plyPos.x, plyPos.y, plyPos.z + 0.2, tostring("~w~Vehicle is ~g~ready ~w~for pickup"))
end

if stage7 == true then
Draw3DText(plyPos.x, plyPos.y, plyPos.z, tostring("~r~This is a test message stage 7"))
end
		Citizen.Wait(0)
	end
end)


--DO-NOT-EDIT-BELLOW-THIS-LINE--
--DO-NOT-EDIT-BELLOW-THIS-LINE--
--DO-NOT-EDIT-BELLOW-THIS-LINE--
--DO-NOT-EDIT-BELLOW-THIS-LINE--

RegisterNetEvent('carrepair:success')
AddEventHandler('carrepair:success', function(price)
local ped = GetPlayerPed(-1)
			local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1)))
			local veh = GetClosestVehicle(x, y, z, 4.001, 0, 70)
			local veh2 = GetVehiclePedIsIn (GetPlayerPed (-1), true)
			local lastcar = GetPlayersLastVehicle(GetPlayerPed (-1))
			local theshop = 1153.9686279297, -781.44641113281,57.598697662354
vehicle = GetVehiclePedIsIn(ped, false)
SetVehicleDoorsLocked(vehicle, 2)
TaskLeaveVehicle(ped, vehicle, 1)
Citizen.Trace('Last Vehicle Shows')
Citizen.Trace(lastcar)
SetVehicleUndriveable(veh2, true)
stage1 = true       
        Citizen.Wait(40000)
       stage1 = false
        stage2 = true
        SetVehicleDoorOpen(veh2, 4, false, false)
        Citizen.Wait(3000)
       stage2 = false
       stage3 = true
        Citizen.Wait(40000)
        stage3 = false
        stage4 = true
        Citizen.Wait(6000)
        stage4 = false
        stage5 = true
        Citizen.Wait(300)
		SetVehicleFixed(veh2)
	SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1),  false),  0.0000000001)
	SetVehicleUndriveable(GetVehiclePedIsUsing(GetPlayerPed(-1)), false)
                SetVehicleEngineHealth( veh2, 1000 )
                SetVehicleEngineOn( veh2, true, true )
                SetVehicleFixed( veh2 )
	SetVehicleDoorsLocked(veh2, 1)
	SetVehicleUndriveable(veh, false)
	       stage5 = false
	       stage6 = true
	        Citizen.Wait(5000)
	      --  stage7 = true
	Citizen.Wait(10000)
	stage6 = false
	--TriggerEvent('chatMessage', 'Bilvasken', {255, 0, 0}, "Din bil er blevet vasket for " .. price .. "kr") -- danish
	DrawSpecialText(msg, 5000)
	Wait(5000)
end)


RegisterNetEvent('carrepair:notenoughmoney')
AddEventHandler('carrepair:notenoughmoney', function(moneyleft)
--	TriggerEvent('chatMessage', 'Bilvasken', {255, 0, 0}, "Du har ikke penge nok, du mangler " .. moneyleft .. "kr") -- danish
	TriggerEvent('chatMessage', 'carrepair', {255, 0, 0}, "You do not have enough money you're missing " .. moneyleft .. "$") 
	DrawSpecialText(msg, 5000)
	Wait(5000)
end)


function Draw3DText(x, y, z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*1
    local fov = (1/GetGameplayCamFov())*100
    local scale = 1.1
   
    if onScreen then
        SetTextScale(0.0*scale, 0.25*scale)
        SetTextFont(2)
        SetTextProportional(1)
        -- SetTextScale(0.0, 0.55)
        SetTextColour(0, 0, 0, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
    end
end

function Draw3DText2(x, y, z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*1
    local fov = (1/GetGameplayCamFov())*100
    local scale = 0.9
   
    if onScreen then
        SetTextScale(0.0*scale, 0.25*scale)
        SetTextFont(0)
        SetTextProportional(1)
        -- SetTextScale(0.0, 0.55)
        SetTextColour(0, 0, 0, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.013+ factor, 0.03, 41, 11, 41, 68)
    end
end

function GetClosestVehicleToPlayer()
	local player = PlayerId()
	local plyPed = GetPlayerPed(player)
	local plyPos = GetEntityCoords(plyPed, false)
	local plyOffset = GetOffsetFromEntityInWorldCoords(plyPed, 0.0, 1.0, 0.0)
	local radius = 3.0
	local rayHandle = StartShapeTestCapsule(plyPos.x, plyPos.y, plyPos.z, plyOffset.x, plyOffset.y, plyOffset.z, radius, 10, plyPed, 7)
	local _, _, _, _, vehicle = GetShapeTestResult(rayHandle)
	return vehicle
end
-------------- DO NOT TRADE/SELL THIS SCRIPT IT IS 100% FREE ON FIVEM FORUMS ------------------------
-------------- DO NOT TRADE/SELL THIS SCRIPT IT IS 100% FREE ON FIVEM FORUMS ------------------------
-------------- DO NOT TRADE/SELL THIS SCRIPT IT IS 100% FREE ON FIVEM FORUMS ------------------------
-------------- DO NOT TRADE/SELL THIS SCRIPT IT IS 100% FREE ON FIVEM FORUMS ------------------------
-------------- DO NOT TRADE/SELL THIS SCRIPT IT IS 100% FREE ON FIVEM FORUMS ------------------------
