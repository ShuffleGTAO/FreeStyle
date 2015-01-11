--[[
$ author Shuffle
$ copyright Shuffle
$ link https://github.com/ShuffleGTAO/FreeStyle
]]--


addEvent ( "Logowanie:rozpocznij", true )
addEventHandler ( "Logowanie:rozpocznij", root, function ( login, haslo )
	local q = exports["fr-db"]:wykonajKwerende ( "SELECT * FROM FR_Accounts WHERE Login = ?", login )
	if #q == 0 then
		return triggerClientEvent ( "Logowanie:blad", source, "Konto nie istnieje w bazie danych" )
	end
	for _,v in pairs ( q ) do
		if v.haslo ~= haslo then
			return triggerClientEvent ( "Logowanie:blad", source, "Hasło do konta '"..login.."' jest błędne" )
		end
	end
	local konto = getAccount ( login, haslo )
	if konto == false then
		local account = addAccount ( tostring(login), tostring(haslo) )
		for i=0,5 do
			outputChatBox ( " ", root )
		end
	else
		local account = logIn ( source, konto, haslo )
	end
	triggerClientEvent ( "Logowanie:zakoncz", source )
	for _,v in pairs ( q ) do
		setTimer ( setElementPosition, 2000, 1, source, v.x, v.y, v.z )
		setTimer ( setPlayerMoney, 2000, 1, source, v.portfel )
		setTimer ( setElementModel, 2000, 1, source, v.skin )
		setTimer ( setElementHealth, 2000, 1, source, v.hp )
		if v["prawo_jazdy"] == "true" then
			setElementData ( source, "PrawoJazdy", true )
		elseif v["prawo_jazdy"] == "false" then
			setElementData ( source, "PrawoJazdy", false )
		end
	end
	for i = 0, 10 do
		outputChatBox ( " ", source )
	end
	outputChatBox ( "Pomyślnie zalogowano. Grasz na serwerze stworzonym przez Shuffle. Miłej gry!", source, 0, 255, 0 )
end)

local function getUID ()
	local u = exports["fr-db"]:wykonajKwerende ( "SELECT * FROM FR_Accounts" )
	for k,_ in ipairs ( u ) do
		liczba = k + 1
	end
	if liczba == 0 then
		liczba = 1
	end
	return liczba
end


addEvent ( "Rejestracja:rozpocznij", true )
addEventHandler ( "Rejestracja:rozpocznij", root, function ( login, haslo, haslo2 )
	local u = exports["fr-db"]:wykonajKwerende ( "SELECT * FROM FR_Accounts WHERE Login = ?", login )
	if #u == 1 then
		return triggerClientEvent ( "Logowanie:blad", source, "Konto '"..login.."' już istnieje w bazie danych" )
	end
	local uid = getUID()
	local u = exports["fr-db"]:wykonajKwerende ( "INSERT INTO FR_Accounts ( Login, haslo, UID, x, y, z, portfel, skin, hp ) VALUES ( ?,?,?,?,?,?,?,?,? )", login, haslo, uid, -2620.03125, 2261.50562, 8.16675, 0, 0, 100 )
	triggerClientEvent ( "Rejestracja:zakoncz", source )
end)

addEventHandler ( "onPlayerJoin", root, function ()
	spawnPlayer ( source, -2620.01440, 2262.51392, 8.16689 )
	fadeCamera ( source, true )
end)


addEventHandler ( "onPlayerQuit", root, function ()
	local Cash = getPlayerMoney ( source )
	local x,y,z = getElementPosition ( source )
	local skin = getElementModel ( source )
	local hp = getElementHealth ( source )
	local prawo = getElementData ( source, "PrawoJazdy" )
	if prawo == true then
		prawko = "true"
	else
		prawko = "false"
	end
	local i = exports["fr-db"]:wykonajKwerende ( "UPDATE FR_Accounts SET portfel = ?, x = '?', y = '?', z = '?', skin = ?, hp = ?, prawo_jazdy = ? WHERE Login = ?", Cash, x, y, z, skin, hp, prawko, getPlayerName ( source ) )
end)