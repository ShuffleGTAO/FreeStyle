


addEventHandler ( "onVehicleStartEnter", root, function ( gracz, seat, kierowca )
	if seat == 0 then
		if kierowca then
			outputChatBox ( getPlayerName ( kierowca ).." już prowadzi ten pojazd!", gracz, 255, 255, 255 )
			return cancelEvent ()
		end
		local q = exports["fr-core"]:wykonajKwerende ( "SELECT * FROM FR_Accounts WHERE Login = ?", getPlayerName ( gracz ) )
		for _,v in pairs ( q ) do
			if v["prawo_jazdy"] == "false" then
				outputChatBox ( "Nie posiadasz Prawa Jazdy. Zdaj je w miejscu oznaczonym czerwonym #ff0000S", gracz, 255, 255, 255, true )
				return cancelEvent()
			end
		end
	end
end)


addEvent ( "Prawko:rozpocznij", true )
addEventHandler ( "Prawko:rozpocznij", root, function ()
	local x,y,z = exports["fr-core"]:coreSpawnLicenseCar()
	local auto = createVehicle ( 411, x, y, z, 0, 0, 90 )
	warpPedIntoVehicle ( source, auto )
	setVehicleColor ( auto, 255, 255, 255 )
	setElementData ( auto, "message", "*"..getPlayerName ( source ).." zdaje prawo jazdy..." )
	setElementData ( auto, "DontSave", getPlayerName ( source ) )
end)