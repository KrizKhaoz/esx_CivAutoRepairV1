--Settings--
ESX = nil
--[[ Optional SocietyAccount ( You have to implement it )
local societyAccount = nil
 TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mecano', function(account)
    societyAccount = account
 end)
]]
enableprice = true -- [Keep this true]
--[[  Prices  ]]
local price = 500 --- Regular Price if you change this be sure to change the price in line
local qprice = 2000 -- Premium Price if you change this be sure to change the price in line

--[[ 
	DO NOT EDIT THIS CODE BELOW!
]]
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('Civrepair:checkmoney')
AddEventHandler('Civrepair:checkmoney', function()
	local mysource = source
	local xPlayer = ESX.GetPlayerFromId(source)		
		if(enableprice == true) then
			if(xPlayer.getMoney() >= price) then
				xPlayer.removeMoney(price)
				TriggerClientEvent('Civrepair:success', mysource, price)
				
			else
				moneyleft = price - xPlayer.getMoney()
				TriggerClientEvent('Civrepair:notenoughmoney', mysource, moneyleft)
			end
		else
			TriggerClientEvent('Civrepair:free', mysource)
		end
end)

RegisterServerEvent('Civrepair:checkmoneypremium')
AddEventHandler('Civrepair:checkmoneypremium', function()
	local mysource = source
	local xPlayer = ESX.GetPlayerFromId(source)		
		if(enableprice == true) then
			if(xPlayer.getMoney() >= qprice) then
				xPlayer.removeMoney(qprice)
				TriggerClientEvent('Civrepair:successpremium', mysource, qprice)
				societyAccount.addMoney(qprice)
				
			else
				moneyleft = qprice - xPlayer.getMoney()
				TriggerClientEvent('Civrepair:notenoughmoneypremium', mysource, moneyleft)
			end
		else
			TriggerClientEvent('Civrepair:free', mysource)
		end
end)