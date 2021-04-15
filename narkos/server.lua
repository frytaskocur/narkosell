ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local selling = false
	local success = false
	local copscalled = false
	local notintrested = false

RegisterNetEvent('drugs:trigger')
AddEventHandler('drugs:trigger', function()
	selling = true
	    if selling == true then
			TriggerEvent('pass_or_fail')
  			TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 1)
  			TriggerClientEvent("pNotify:SendNotification", source, {
            text = "Próbujesz zepsuć sobie życie",
            type = "error",
            queue = "lmao",
            timeout = 2500,
            layout = "Centerleft"
        	})
 	end
end)

RegisterServerEvent('sprzedaz')
AddEventHandler('sprzedaz', function(street1, street2)
	local _source = source
TriggerClientEvent("outlawNotifye", -1, _source, "~p~Widziana sprzedaz ~g~narkotykow ~p~na "..street1)

end)


AddEventHandler('fetchjob', function()
    local xPlayer  = ESX.GetPlayerFromId(source)
    TriggerClientEvent('getjob', source, xPlayer.job.name)
end)


  RegisterNetEvent('drugs:sell')
  AddEventHandler('drugs:sell', function()
  	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
	local meth = xPlayer.getInventoryItem('meth_pooch').count
	local coke 	  = xPlayer.getInventoryItem('coke_pooch').count
	local weed = xPlayer.getInventoryItem('weed_pooch').count
	local opium = xPlayer.getInventoryItem('opium_pooch').count
	local amfa = xPlayer.getInventoryItem('amfa_pooch').count
	local paymentc = math.random (Config.CokePriceA,Config.CokePriceB)
	local paymentw = math.random (Config.WeedPriceA,Config.WeedPriceB)
	local paymentm = math.random (Config.MethPriceA ,Config.MethPriceB)
	local paymento = math.random (Config.OpiuPriceA,Config.OpiuPriceB)
	local paymenta = math.random (Config.AmfaPriceA,Config.AmfaPriceB)

		
		
	local cops = 0
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
				cops = cops + 1
		end
	end
	
	if cops >= Config.PoliceCount then
		if coke >= 1 and success == true then
			 	TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
			local ilosc = math.random(1,2)
			if coke < ilosc then
			ilosc = 1
			end

			TriggerClientEvent("animation", source)
		--	TriggerClientEvent("sprzedaz1, source")
			xPlayer.removeInventoryItem('coke_pooch', ilosc)
  			xPlayer.addAccountMoney('black_money', paymentc*ilosc)
  			selling = false
				
				TriggerClientEvent("pNotify:SendNotification", source, {
					text = "Sprzedales "..ilosc.. " porcje kokainy po cenie $" .. paymentc*ilosc ,
					type = "success",
					progressBar = false,
					queue = "lmao",
					timeout = 2000,
					layout = "CenterLeft"
			})

  		elseif weed >= 1 and success == true then
  				TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
				
							local ilosc = math.random(1,2)
			if weed < ilosc then
			ilosc = 1
			end
				TriggerClientEvent("pNotify:SendNotification", source, {
					text = "Sprzedales "..ilosc.." porcje marihuany za $" .. paymentw*ilosc ,
					type = "success",
					progressBar = false,
					queue = "lmao",
					timeout = 2000,
					layout = "CenterLeft"
			})
			TriggerClientEvent("animation", source)
			TriggerClientEvent("test", source)
  			xPlayer.removeInventoryItem('weed_pooch', ilosc)
  			xPlayer.addAccountMoney('black_money', paymentw*ilosc)
  			selling = false
			
			  elseif amfa >= 1 and success == true then
  				TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
				
							local ilosc = math.random(1,1)
			if amfa < ilosc then
			ilosc = 1
			end
				TriggerClientEvent("pNotify:SendNotification", source, {
					text = "Sprzedales "..ilosc.." porcje amfetaminy za $" .. paymentw*ilosc ,
					type = "success",
					progressBar = false,
					queue = "lmao",
					timeout = 2000,
					layout = "CenterLeft"
			})
			TriggerClientEvent("animation", source)
			TriggerClientEvent("test", source)
  			xPlayer.removeInventoryItem('amfa_pooch', ilosc)
  			xPlayer.addAccountMoney('black_money', paymentw*ilosc)
  			selling = false
			
			
  		  elseif meth >= 1 and success == true then
  				TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
											local ilosc = math.random(1,2)
			if meth < ilosc then
			ilosc = 1
			end
				TriggerClientEvent("pNotify:SendNotification", source, {
					text = "Sprzedales "..ilosc.." porcje metamfetaminy $" .. paymentm*ilosc ,
					type = "success",
					progressBar = false,
					queue = "lmao",
					timeout = 2000,
					layout = "CenterLeft"
			})
			TriggerClientEvent("animation", source)
  			xPlayer.removeInventoryItem('meth_pooch', ilosc)
  			xPlayer.addAccountMoney('black_money', paymentm*ilosc)
  			selling = false
  			elseif opium >= 1 and success == true then
  				TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
															local ilosc = math.random(1,2)
			if opium < ilosc then
			ilosc = 1
			end
				TriggerClientEvent("pNotify:SendNotification", source, {
					text = "Sprzedales "..ilosc.." porcje opium za $" .. paymento*ilosc ,
					type = "success",
					progressBar = false,
					queue = "lmao",
					timeout = 2000,
					layout = "CenterLeft"
			})
			TriggerClientEvent("animation", source)
			xPlayer.removeInventoryItem('opium_pooch', ilosc)
  			xPlayer.addAccountMoney('black_money', paymento*ilosc)
  			selling = false
			elseif selling == true and success == false and notintrested == true then
				TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
				TriggerClientEvent("pNotify:SendNotification", source, {
					text = "Nie jest zainteresowany",
					type = "error",
					progressBar = false,
					queue = "lmao",
					timeout = 2000,
					layout = "CenterLeft"
			})
  			selling = false
  			elseif meth < 1 and coke < 1 and weed < 1 and opium < 1 then
				TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
				TriggerClientEvent("pNotify:SendNotification", source, {
				text = "Nie masz żadnych narkotyków",
				type = "error",
				progressBar = false,
				queue = "lmao",
				timeout = 2000,
				layout = "CenterLeft"
			})
			elseif copscalled == true and success == false then
  			TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
				TriggerClientEvent("pNotify:SendNotification", source, {
					text = "Dzwonie po Policje",
					type = "error",
					progressBar = false,
					queue = "lmao",
					timeout = 2000,
					layout = "CenterLeft"
			})
  			selling = false

				end
  		end
end)

RegisterNetEvent('pass_or_fail')
AddEventHandler('pass_or_fail', function()

  		local percent = math.random(1, 11)

  		if percent == 7 or percent == 8 or percent == 9 then
  			success = false
  			notintrested = true
  		elseif percent ~= 8 and percent ~= 9 and percent ~= 10 and percent ~= 7 then
  			success = true
  			notintrested = false
  		else
  			notintrested = false
  			success = false
  			copscalled = true
  		end
end)

RegisterServerEvent('narkoPos')
AddEventHandler('narkoPos', function(gx, gy, gz)
	TriggerClientEvent('narkoBlip', -1, gx, gy, gz)
end)

RegisterNetEvent('sell_dis')
AddEventHandler('sell_dis', function()
		TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
		TriggerClientEvent("pNotify:SendNotification", source, {
		text = "Odszedłeś za daleko",
		type = "error",
		progressBar = false,
		queue = "lmao",
		timeout = 2000,
		layout = "CenterLeft"
	})
end)

RegisterNetEvent('checkD')
AddEventHandler('checkD', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local meth = xPlayer.getInventoryItem('meth_pooch').count
	local coke 	  = xPlayer.getInventoryItem('coke_pooch').count
	local weed = xPlayer.getInventoryItem('weed_pooch').count
	local opium = xPlayer.getInventoryItem('opium_pooch').count
	local amfa = xPlayer.getInventoryItem('amfa_pooch').count

	if meth >= 1 or coke >= 1 or weed >= 1 or opium >= 1 or amfa >= 1 then
		TriggerClientEvent("checkR", source, true)
	else
		TriggerClientEvent("checkR", source, false)
	end
end)
