--Settings--
ESX = nil

enableprice = true -- true = carrepair is paid, false = carrepair is free

price = 500
qprice = 1500 -- you may edit this to your liking. if "enableprice = false" ignore this one

--DO-NOT-EDIT-BELLOW-THIS-LINE--
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('carrepair:checkmoney')
AddEventHandler('carrepair:checkmoney', function()
	local mysource = source
	local xPlayer = ESX.GetPlayerFromId(source)		
		if(enableprice == true) then
			if(xPlayer.getMoney() >= price) then
				xPlayer.removeMoney((price))
				TriggerClientEvent('carrepair:success', mysource, price)
				
			else
				moneyleft = price - xPlayer.getMoney()
				TriggerClientEvent('carrepair:notenoughmoney', mysource, moneyleft)
			end
		else
			TriggerClientEvent('carrepair:free', mysource)
		end
end)

--RegisterServerEvent('carrepair:checkmoney2')
--AddEventHandler('carrepair:checkmoney2', function()
--	local mysource = source
--	local xPlayer = ESX.GetPlayerFromId(source)		
--		if(enableprice == true) then
--			if(xPlayer.getMoney() >= qprice) then
--				xPlayer.removeMoney((qprice))
--				TriggerClientEvent('carrepair:success2', mysource, qprice)
--				
--			else
--				moneyleft = price - xPlayer.getMoney()
--				TriggerClientEvent('carrepair:notenoughmoney', mysource, moneyleft)
--			end
--		else
--			TriggerClientEvent('carrepair:free', mysource)
--		end
--end)