-------------- DO NOT TRADE/SELL THIS SCRIPT IT IS 100% FREE ON FIVEM FORUMS ------------------------
--[[
	The Auto Repair Shop V1.5
]]
--[[
	Tips:
	• To change job change 'mecano' on line 98 and 105
	• To allow everyone to use this shop remove ( and PlayerData.job ~= nil and PlayerData.job.name == 'mecano' ) from line 98 and 105
	• To Move the shop you will need to set the coords in CivRepairStation X Y Z as well as change the coords of the  Draw3DText in all the stages besides ones that use plyPos.z plyPos.y plyPos.z
	• To change the prices change the price on in server.lua
	• To prevent cars from despawning when nobody is around uncomment lines containing SetEntityAsMissionEntity
	• To Show your support go drop a like on the forum post and drop a positive comment https://forum.fivem.net/t/esx-the-auto-repair-shop-release-v1-0/173348
	Credits: 
	• KrizFrost - Base Code
	• qalle - Assisting with the menu [v1.5]

]]
--- Blip Added 
Citizen.CreateThread(function()
	while true do 
local repairblip = AddBlipForCoord(1148.8618164063,-776.84155273438,55.598728179932)
		SetBlipSprite(repairblip, 402)
	return
  end
end)

quickKey = 38 --- E
fuel = 0
finishedfuel = 100


local ESX = nil
local PlayerData                = {}
--[[
	Stages Default = false DO NOT CHANGE THESE!!
]]
repairing = false -- Default repairing status
stage1 = false -- Default stage 1 status
stage2 = false -- Default stage 2 status
stage3 = false -- Default stage 3 status
stage4 = false -- Default stage 4 status
stage5 = false -- Default stage 5 status
stage6 = false -- Default stage 5 status
paynotification = false -- Default Pay Notification Status
locked = false --- Default Lock Status (DO NOT CHANGE THIS ONE IS VERY IMPORTANT)
unlocked = false -- Default Unlock Status (DO NOT CHANGE THIS ONE IS VERY IMPORTANT)
vehcheck = false -- Default Vehicle Check Status (DO NOT CHANGE THIS ONE IS VERY IMPORTANT)
insidemarkercheck = false -- Defualt insidemarker check (DO NOT CHANGE THIS ONE IS VERY IMPORTANT)
--[[
	Loading ESX Data
]]

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
--[[
	Location of CivRepairStation If you change this you need to change the 3DText Locations as well 
]]
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
				 ESX.ShowHelpNotification('Press ~INPUT_CONTEXT~ to Quick Vehicle Repair')
					if(IsControlJustPressed(1, quickKey)) then
						AutoRepair()
						insidemarkercheck = true
					end
				end
				if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), garageCoords2[1], garageCoords2[2], garageCoords2[3], true ) > 5 and PlayerData.job ~= nil and PlayerData.job.name == 'mecano' then
					    if ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'civrepair_menu') then
       						ESX.UI.Menu.CloseAll()
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
    Draw3DText2(1153.9860839844, -781.12658691406, 57.598682403564 - 0.2, tostring("~w~Checking over your vehicle.."))
end

if insidemarkercheck == true and stage1 == false and stage2 == true and stage3 == false and stage4 == false and stage5 == false and stage6 == false then
 Draw3DText(1153.9860839844, -781.12658691406, 57.598682403564 + 0.2, tostring("~w~We are still looking over your vehicle ~o~Come back later"))
 Draw3DText2(1153.9860839844, -781.12658691406, 57.598682403564, tostring("~w~Repair Status: ~o~45%"))
 Draw3DText2(1153.9860839844, -781.12658691406, 57.598682403564 - 0.2, tostring("~w~Working on the engine.."))
end 

if insidemarkercheck == true and stage1 == false and stage2 == false and stage3 == true and stage4 == false and stage5 == false and stage6 == false then
 Draw3DText(1153.9860839844, -781.12658691406, 57.598682403564 + 0.2, tostring("~w~We are still looking over your vehicle ~o~Come back later"))
 Draw3DText2(1153.9860839844, -781.12658691406, 57.598682403564, tostring("~w~Repair Status: ~o~60%"))
 Draw3DText2(1153.9860839844, -781.12658691406, 57.598682403564 - 0.2, tostring("~w~Fixing your transmission.."))
end 


if insidemarkercheck == true and stage1 == false and stage2 == false and stage3 == false and stage4 == true and stage5 == false and stage6 == false then
 Draw3DText(1153.9860839844, -781.12658691406, 57.598682403564 + 0.2, tostring("~w~We are still looking over your vehicle ~o~Come back later"))
 Draw3DText2(1153.9860839844, -781.12658691406, 57.598682403564, tostring("~w~Repair Status: ~g~85%"))
 Draw3DText2(1153.9860839844, -781.12658691406, 57.598682403564 - 0.2, tostring("~w~Changing your vehicles oil.."))
end 

if insidemarkercheck == true and stage1 == false and stage2 == false and stage3 == false and stage4 == false and stage5 == true and stage6 == false then
 Draw3DText(1153.9860839844, -781.12658691406, 57.598682403564 + 0.2, tostring("~w~We are still looking over your vehicle ~o~Come back later"))
 Draw3DText2(1153.9860839844, -781.12658691406, 57.598682403564, tostring("~w~Repair Status: ~g~95%"))
 Draw3DText2(1153.9860839844, -781.12658691406, 57.598682403564 - 0.2, tostring("~w~Cleaning the interior of your vehicle.."))
end 

if insidemarkercheck == true and stage1 == false and stage2 == false and stage3 == false and stage4 == false and stage5 == false and stage6 == true then
 Draw3DText(1153.9860839844, -781.12658691406, 57.598682403564 + 0.2, tostring("~w~Vehicle has been detailed repaired and fixed ~g~You can now enter your vehicle"))
	           Draw3DText2(1153.9860839844, -781.12658691406, 57.598682403564, tostring("~w~Repair Status: ~g~100%"))
	            Draw3DText2(1153.9860839844, -781.12658691406, 57.598682403564 - 0.2, tostring("~w~Everything is good to go!"))
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

if locked == true then
Draw3DText2(plyPos.x, plyPos.y, plyPos.z + 0.2, tostring('~w~Vehicle has been ~r~locked'))
end

if unlocked == true then
Draw3DText2(plyPos.x, plyPos.y, plyPos.z + 0.2, tostring('~w~Vehicle has been ~g~Unlocked'))
end

if vehcheck == true then
	if IsControlJustPressed(0, 38) then
		SetVehicleDoorsLocked(vehicle, 2)
		stage6 = false
		locked = true
		Citizen.Wait(4000)
		locked = false
	end
end

if stage5 == true then

end

if payalert == true then
Draw3DText2(plyPos.x, plyPos.y, plyPos.z + 0.2, tostring('~w~Repairs starting in a moment'))

end

if paynotification == true then

Draw3DText2(plyPos.x, plyPos.y, plyPos.z + 0.2, tostring('~w~Paid ~w~for repairs'))
end

if stage6 == true then
Draw3DText(plyPos.x, plyPos.y, plyPos.z + 0.2, tostring("~w~Vehicle is ~g~ready ~w~for pickup"))
Draw3DText2(plyPos.x, plyPos.y, plyPos.z + 0.1, tostring("~w~Press ~r~E~w~ to lock Your vehicle at the shop"))
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

--[[ 

		Regular Repair Option Event
]]

RegisterNetEvent('Civrepair:success')
AddEventHandler('Civrepair:success', function(price)
	local ped = GetPlayerPed(-1)
	local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1)))
	local veh = GetClosestVehicle(x, y, z, 4.001, 0, 70)
	local veh2 = GetVehiclePedIsIn (GetPlayerPed (-1), true)
	local lastcar = GetPlayersLastVehicle(GetPlayerPed (-1))
	local theshop = 1153.9686279297, -781.44641113281,57.598697662354
	local player = PlayerId()
	local plyPed = GetPlayerPed(player)
	local plyPos = GetEntityCoords(plyPed, false)
	local seconds = 1000 --- Seconds
	local minute = 60 * seconds -- Minutes
	local stage1period = 40 * seconds
	local stage2period = 3 * seconds
	local stage3period = 40 * seconds
	local stage4period = 6 * seconds
	local stage5period = 3 * seconds
	local stage6period = 5 * seconds
	local stage7period = 10 * seconds

	vehicle = GetVehiclePedIsIn(ped, false)
	----- Start of the magic that is a mess
	--[[ 

		The Pre Repair Process 

	]]
		--[[ 
	Note this could be a good thing and bad thing these vehicles will not despawn when nobody is around them we are setting the vehicle 
	to not despawn including if it is a NPC vehicle non player owned so it will not despawn if nobody is around you can see how this could cause issues
	its optional to have SetEntityAsMissionEntity  Just uncomment the lines below to set the vehicles to not despawn.
	]]
	-- SetEntityAsMissionEntity( vehicle, true, true ) --- A check to make sure the vehicle does not despawn (Known issue in v1.0)
	-- SetEntityAsMissionEntity( veh2, true, true ) --- A double check to make sure the vehicle does not despawn (known issue in v1.0)
	-- SetEntityAsMissionEntity( veh, true, true ) --- A Triple check to make sure the vehicle does not despawn (known issue in v1.0)
	SetVehicleDoorsLocked(vehicle, 2) -- Locks the closest vehicles doors (Obviously the vehicle they are in )

	TaskLeaveVehicle(ped, vehicle, 1) -- Tasks the drive to leave the vehicle
	-- Citizen.Trace('Last Vehicle Shows') ---<< That is simply to trace text
	-- Citizen.Trace(lastcar) <<< -- That traces the last car
	SetVehicleUndriveable(veh2, true) --- Sets the vehicle to be undrivable (prevents lockpick exploits)
	--[[ 

		The Notification Process

	]]
	paynotification = true --- Starts the Notification them of the payment
	Citizen.Wait(3000)
	paynotification = false --- Stops the notification of the payment
	payalert = true -- Starts the notification about repairs are about to begin
	Citizen.Wait(3000)
	payalert = false -- Ends the notification about the repairs starting
	--[[ 

		The starting stages of things (If you want to call it that.)

	]]
	stage1 = true  -- Display Stage 1 Text 
    SetVehicleDoorOpen(veh2, 4, false, false)    --- Opens the Hood
    Citizen.Wait(stage1period)
    stage1 = false -- DO not Display Stage 1 Text 
    stage2 = true -- Display Stage 2 Text 
    Citizen.Wait(stage2period)
    stage2 = false -- DO not Display Stage 2 Text 
    stage3 = true -- Display Stage 3 Text 
    Citizen.Wait(stage3period)
    stage3 = false -- DO NOT Display Stage 3 Text 
    stage4 = true -- Display Stage 4 Text 
    Citizen.Wait(stage5period)
    stage4 = false -- DO NOT Display Stage 4 Text 
    stage5 = true -- -- Display Stage 5 Text 
    Citizen.Wait(stage6period)
    --[[ 

	Where everything magic happens ;)

	]]
	SetVehicleFixed(veh2) -- Fixes the vehicle
	SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1),  false),  0.0000000001) -- Sets vehicle dirt level to be 0 (This is kinda pointless unless they are super dirty ;) )
    SetVehicleEngineHealth( veh2, 1000 ) -- Sets Engine Health to 100% (You can do alot with a working engine)
    SetVehicleEngineOn( veh2, true, true ) --- Turns Engine on (Lets turn this bad boy on and see if she runs )
    SetVehicleFixed( veh2 ) -- Fixes The Vehicle AGAIN (We have to make sure nothing happened while we were working on the engine )
	SetVehicleDoorsLocked(veh2, 1) -- Locks Doors (To Obviously prevent stealing... duhhh)
	SetVehicleUndriveable(veh, false) --- Sets vehicle drivable (Just a pre drivable driveable to make sure its driveable ya know ;) )
	SetVehicleUndriveable(GetVehiclePedIsUsing(GetPlayerPed(-1)), false) --- Sets Vehicle Drivable (Now they can move the vehicle vrrrrmmm vrrrmmm )
	stage5 = false -- DO NOT Display Stage 5 Text
	stage6 = true -- Display Stage 6 Text
	vehcheck = true -- Sends them a notification to decide if they want us to unlock/lock the vehiclle (Just incase they are not there and want the car unlocked for a friend there. )
	Citizen.Wait(5000)
--  stage7 = true
	Citizen.Wait(stage7period)
	stage6 = false --- DO NOT DIsplay Stage 6 Text
	vehcheck = false --- Stops Sending a notification (Alright they've had enough time to decide leave it the way its meant to be )
	--TriggerEvent('chatMessage', 'Bilvasken', {255, 0, 0}, "Din bil er blevet vasket for " .. price .. "kr") -- danish
	DrawSpecialText(msg, 5000)
	Wait(5000)
end)
--[[ 

		Premium Repair Option Event
]]

RegisterNetEvent('Civrepair:successpremium')
AddEventHandler('Civrepair:successpremium', function(price)
local ped = GetPlayerPed(-1)
	local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1)))
	local veh = GetClosestVehicle(x, y, z, 4.001, 0, 70)
	local veh2 = GetVehiclePedIsIn (GetPlayerPed (-1), true)
	local lastcar = GetPlayersLastVehicle(GetPlayerPed (-1))
	local theshop = 1153.9686279297, -781.44641113281,57.598697662354
	local player = PlayerId()
	local plyPed = GetPlayerPed(player)
	local plyPos = GetEntityCoords(plyPed, false)
	local seconds = 1000 --- Seconds
	local minute = 60 * seconds -- Minutes
	local stage1period = 6 * seconds
	local stage2period = 3 * seconds
	local stage3period = 6 * seconds
	local stage4period = 3 * seconds
	local stage5period = 3 * seconds
	local stage6period = 3 * seconds
	local stage7period = 10 * seconds

	vehicle = GetVehiclePedIsIn(ped, false)
	----- Start of the magic that is a mess
	--[[ 

		The Pre Repair Process 

	]]
	--[[ 
	Note this could be a good thing and bad thing these vehicles will not despawn when nobody is around them we are setting the vehicle 
	to not despawn including if it is a NPC vehicle non player owned so it will not despawn if nobody is around you can see how this could cause issues
	its optional to have SetEntityAsMissionEntity  Just uncomment the lines below to set the vehicles to not despawn.
	]]
	-- SetEntityAsMissionEntity( vehicle, true, true ) --- A check to make sure the vehicle does not despawn (Known issue in v1.0)
	-- SetEntityAsMissionEntity( veh2, true, true ) --- A double check to make sure the vehicle does not despawn (known issue in v1.0)
	-- SetEntityAsMissionEntity( veh, true, true ) --- A Triple check to make sure the vehicle does not despawn (known issue in v1.0)
	SetVehicleDoorsLocked(vehicle, 2) -- Locks the closest vehicles doors (Obviously the vehicle they are in )
	TaskLeaveVehicle(ped, vehicle, 1) -- Tasks the drive to leave the vehicle
	-- Citizen.Trace('Last Vehicle Shows') ---<< That is simply to trace text
	-- Citizen.Trace(lastcar) <<< -- That traces the last car
	SetVehicleUndriveable(veh2, true) --- Sets the vehicle to be undrivable (prevents lockpick exploits)
	--[[ 

		The Notification Process

	]]
	paynotification = true --- Starts the Notification them of the payment
	Citizen.Wait(3000)
	paynotification = false --- Stops the notification of the payment
	payalert = true -- Starts the notification about repairs are about to begin
	Citizen.Wait(3000)
	payalert = false -- Ends the notification about the repairs starting
	--[[ 

		The starting stages of things (If you want to call it that.)

	]]
	stage1 = true  -- Display Stage 1 Text 
    SetVehicleDoorOpen(veh2, 4, false, false)    --- Opens the Hood
    Citizen.Wait(stage1period)
    stage1 = false -- DO not Display Stage 1 Text 
    stage2 = true -- Display Stage 2 Text 
    Citizen.Wait(stage2period)
    stage2 = false -- DO not Display Stage 2 Text 
    stage3 = true -- Display Stage 3 Text 
    Citizen.Wait(stage3period)
    stage3 = false -- DO NOT Display Stage 3 Text 
    stage4 = true -- Display Stage 4 Text 
    Citizen.Wait(stage5period)
    stage4 = false -- DO NOT Display Stage 4 Text 
    stage5 = true -- -- Display Stage 5 Text 
    Citizen.Wait(stage6period)
    --[[ 

	Where everything magic happens ;)

	]]
	SetVehicleFixed(veh2) -- Fixes the vehicle
	SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1),  false),  0.0000000001) -- Sets vehicle dirt level to be 0 (This is kinda pointless unless they are super dirty ;) )
    SetVehicleEngineHealth( veh2, 1000 ) -- Sets Engine Health to 100% (You can do alot with a working engine)
    SetVehicleEngineOn( veh2, true, true ) --- Turns Engine on (Lets turn this bad boy on and see if she runs )
    SetVehicleFixed( veh2 ) -- Fixes The Vehicle AGAIN (We have to make sure nothing happened while we were working on the engine )
	SetVehicleDoorsLocked(veh2, 1) -- Locks Doors (To Obviously prevent stealing... duhhh)
	SetVehicleUndriveable(veh, false) --- Sets vehicle drivable (Just a pre drivable driveable to make sure its driveable ya know ;) )
	SetVehicleUndriveable(GetVehiclePedIsUsing(GetPlayerPed(-1)), false) --- Sets Vehicle Drivable (Now they can move the vehicle vrrrrmmm vrrrmmm )
	stage5 = false -- DO NOT Display Stage 5 Text
	stage6 = true -- Display Stage 6 Text
	vehcheck = true -- Sends them a notification to decide if they want us to unlock/lock the vehiclle (Just incase they are not there and want the car unlocked for a friend there. )
	Citizen.Wait(5000)
--  stage7 = true
	Citizen.Wait(stage7period)
	stage6 = false --- DO NOT DIsplay Stage 6 Text
	vehcheck = false --- Stops Sending a notification (Alright they've had enough time to decide leave it the way its meant to be )
	--TriggerEvent('chatMessage', 'Bilvasken', {255, 0, 0}, "Din bil er blevet vasket for " .. price .. "kr") -- danish
	DrawSpecialText(msg, 5000)
	Wait(5000)
end)

    --[[ 

	Not enough money display for Regular Option

	]]

RegisterNetEvent('Civrepair:notenoughmoney')
AddEventHandler('Civrepair:notenoughmoney', function(moneyleft)
--	TriggerEvent('chatMessage', 'Bilvasken', {255, 0, 0}, "Du har ikke penge nok, du mangler ^1kr" .. moneyleft .. "") -- danish
	TriggerEvent('chatMessage', 'CivRepair', {255, 0, 0}, "You do not have enough money you're missing ^1$" .. moneyleft .. "") 
	DrawSpecialText(msg, 5000)
	Wait(5000)
end)
    --[[ 

	Not enough money display for Premium Option

	]]
RegisterNetEvent('Civrepair:notenoughmoneypremium')
AddEventHandler('Civrepair:notenoughmoneypremium', function(moneyleft)
--	TriggerEvent('chatMessage', 'Bilvasken', {255, 0, 0}, "Du har ikke penge nok, du mangler ^1kr" .. moneyleft .. "") -- danish
	TriggerEvent('chatMessage', 'CivRepair', {255, 0, 0}, "You do not have enough money for ^3Premium^0 you're missing ^1$" .. moneyleft .. "") 
	DrawSpecialText(msg, 5000)
	Wait(5000)
end)

    --[[ 

	3DTextDisplay

	]]

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


function AutoRepair() -- Credits qalle for assisting with this 

    local elements = {
        { label = 'Fast Repair <font color="lightblue">⭐Premium⭐</font><font color="red">$2000</font>', value = "repair_fast" },
        { label = 'Repair <font color="orange">💤Regular💤</font><font color="red">$500</font>', value = "repair_slow" }
    }

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'civrepair_menu',
        {
            title    = "<font color='lightblue' font-size='15px'>🔧Auto Repair Station🔧</font>",
            align    = 'center',
            elements = elements
        },
    function(data, menu)

        local action = data.current.value

        if action == "repair_fast" then
             TriggerServerEvent('Civrepair:checkmoneypremium')
        elseif action == "repair_slow" then
            TriggerServerEvent('Civrepair:checkmoney')
        end

        menu.close()

    end, function(data, menu)
        menu.close()
    end)

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
