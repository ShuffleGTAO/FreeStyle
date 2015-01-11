mojeW,mojeH = 640, 480
sW,sH = guiGetScreenSize()
w, h = (sW/mojeW), (sH/mojeH)



button = {}
logowanie = {}
login = {}
okno = {}
rejestracja = {}

--okno główne

okno.glowne = guiCreateGridList(71*w, 0*h, 149*w, 480*h, false)
guiSetAlpha(okno.glowne, 0.91)
guiSetVisible ( okno.glowne, false )

button.logowanie = guiCreateButton(16*w, 199*h, 116*w, 51*h, "Panel\nlogowania", false, okno.glowne)
button.rejestracja = guiCreateButton(16*w, 326*h, 116*w, 51*h, "Panel\nrejestracji", false, okno.glowne)
informacja = guiCreateLabel(269*w, 34*h, 327*w, 25*h, "", false)
guiSetFont(informacja, "default-bold-small")
guiLabelSetHorizontalAlign(informacja, "center", false)
guiLabelSetVerticalAlign(informacja, "center")
guiLabelSetColor ( informacja, 255, 0, 0 )

--okno logowania

okno.logowanie = guiCreateGridList(269*w, 169*h, 266*w, 214*h, false)
guiSetAlpha(okno.logowanie, 0.80)
guiSetVisible ( okno.logowanie, false )

label = guiCreateLabel(30*w, 32*h, 76*w, 23*h, "Login :", false, okno.logowanie)
guiLabelSetHorizontalAlign(label, "center", false)
guiLabelSetVerticalAlign(label, "center")
logowanie[1] = guiCreateEdit(47*w, 61*h, 168*w, 23*h, "", false, okno.logowanie)
label2 = guiCreateLabel(30*w, 94*h, 76*w, 23*h, "Hasło :", false, okno.logowanie)
guiLabelSetHorizontalAlign(label2, "center", false)
guiLabelSetVerticalAlign(label2, "center")
logowanie[2] = guiCreateEdit(47*w, 122*h, 168*w, 23*h, "", false, okno.logowanie)
guiEditSetMasked(logowanie[2], true)
login.zaloguj = guiCreateButton(52*w, 162*h, 163*w, 37*h, "Zaloguj na postać", false, okno.logowanie)

--okno rejestracji

okno.rejestracja = guiCreateGridList(277*w, 127*h, 264*w, 283*h, false)
guiSetAlpha(okno.rejestracja, 0.88)
guiSetVisible ( okno.rejestracja, false )

label3 = guiCreateLabel(10*w, 22*h, 123*w, 22*h, "Login :", false, okno.rejestracja)
guiLabelSetHorizontalAlign(label3, "center", false)
guiLabelSetVerticalAlign(label3, "center")
rejestracja[3] = guiCreateEdit(52*w, 52*h, 158*w, 22*h, "", false, okno.rejestracja)
label4 = guiCreateLabel(10*w, 84*h, 123*w, 22*h, "Hasło :", false, okno.rejestracja)
guiLabelSetHorizontalAlign(label4, "center", false)
guiLabelSetVerticalAlign(label4, "center")
rejestracja[4] = guiCreateEdit(52*w, 112*h, 158*w, 22*h, "", false, okno.rejestracja)
label5 = guiCreateLabel(42*w, 144*h, 123*w, 22*h, "Potwierdź hasło :", false, okno.rejestracja)
guiLabelSetHorizontalAlign(label5, "center", false)
guiLabelSetVerticalAlign(label5, "center")
rejestracja[5] = guiCreateEdit(52*w, 176*h, 158*w, 22*h, "", false, okno.rejestracja)
rejestracja.rejestruj = guiCreateButton(32*w, 229*h, 196*w, 39*h, "Zarejestruj postać", false, okno.rejestracja)

local function drawImageRejestracja ()
	dxDrawImage(224*w, 338*h, 35*w, 31*h, "images/strzalka.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
end

local function drawImageLogowanie ()
	dxDrawImage(224*w, 211*h, 35*w, 31*h, "images/strzalka.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
end

local function drawLogo ()
	dxDrawText("FreeStyle Server", 19*w, 93*h, 278*w, 138*h, tocolor(0, 0, 0, 255), 1.10*w, "pricedown", "center", "center", false, false, true, false, false)
	dxDrawText("FreeStyle Server", 19*w, 91*h, 278*w, 136*h, tocolor(0, 0, 0, 255), 1.10*w, "pricedown", "center", "center", false, false, true, false, false)
	dxDrawText("FreeStyle Server", 17*w, 93*h, 276*w, 138*h, tocolor(0, 0, 0, 255), 1.10*w, "pricedown", "center", "center", false, false, true, false, false)
	dxDrawText("FreeStyle Server", 17*w, 91*h, 276*w, 136*h, tocolor(0, 0, 0, 255), 1.10*w, "pricedown", "center", "center", false, false, true, false, false)
	dxDrawText("FreeStyle Server", 18*w, 92*h, 277*w, 137*h, tocolor(255, 255, 255, 255), 1.10*w, "pricedown", "center", "center", false, false, true, false, false)
end


addEventHandler ( "onClientResourceStart", resourceRoot, function ()
	guiSetVisible ( okno.glowne, true )
	showCursor ( true )
	addEventHandler ( "onClientRender", root, drawLogo )
	showPlayerHudComponent ( "all", false )
	showChat ( false )
	setCameraMatrix ( -2554.05762, 2371.26636, 52.84969, -2630.35547, 2342.99805, 16.46366 )
end)

local function openPanelLogin ()
	if guiGetVisible ( okno.logowanie ) == false then
		guiSetVisible ( okno.logowanie, true )
		addEventHandler ( "onClientRender", root, drawImageLogowanie )
	else
		guiSetVisible ( okno.logowanie, false )
		removeEventHandler ( "onClientRender", root, drawImageLogowanie )
	end
	if guiGetVisible ( okno.rejestracja ) == true then
		guiSetVisible ( okno.rejestracja, false )
		removeEventHandler ( "onClientRender", root, drawImageRejestracja )
	end
end

local function openPanelRegister ()
	if guiGetVisible ( okno.rejestracja ) == false then
		guiSetVisible ( okno.rejestracja, true )
		addEventHandler ( "onClientRender", root, drawImageRejestracja )
	else
		guiSetVisible ( okno.rejestracja, false )
		removeEventHandler ( "onClientRender", root, drawImageRejestracja )
	end
	if guiGetVisible ( okno.logowanie ) == true then
		guiSetVisible ( okno.logowanie, false )
		removeEventHandler ( "onClientRender", root, drawImageLogowanie )
	end
end


addEventHandler ( "onClientGUIClick", root, function ()
	if source == button.logowanie then
		openPanelLogin ()
	elseif source == button.rejestracja then
		openPanelRegister ()
	elseif source == login.zaloguj then
		local login = guiGetText ( logowanie[1] )
		if login == "" then return guiSetText ( informacja, "Wpisz login!" ) end
		local haslo = guiGetText ( logowanie[2] )
		if haslo == "" then guiSetText ( informacja, "Wpisz hasło!" ) return end
		triggerServerEvent ( "Logowanie:rozpocznij", localPlayer, login, haslo )
	elseif source == rejestracja.rejestruj then
		local login1 = guiGetText ( rejestracja[3] )
		if login1 == "" then return guiSetText ( informacja, "Wpisz login!" ) end
		local haslo1 = guiGetText ( rejestracja[4] )
		if haslo1 == "" then return guiSetText ( informacja, "Wpisz hasło!" ) end
		local haslo2 = guiGetText ( rejestracja[5] )
		if haslo2 == "" then return guiSetText ( informacja, "Potwierdź hasło!" ) end
		if haslo1 ~= haslo2 then return guiSetText ( informacja, "Wpisałeś 2 różne hasła!" ) end
		triggerServerEvent ( "Rejestracja:rozpocznij", localPlayer, login1, haslo1, haslo2 )
	end
end)

addEvent ( "Logowanie:blad", true )
addEventHandler ( "Logowanie:blad", root, function ( txt, type )
	if source == localPlayer then
		guiSetText ( informacja, txt )
	end
	if not isTimer ( timer ) then
		timer = setTimer ( guiSetText, 5000, 1, informacja, "" )
	end
end)

addEvent ( "Logowanie:zakoncz", true )
addEventHandler ( "Logowanie:zakoncz", root, function ()
	if source == localPlayer then
		guiSetVisible ( okno.glowne, false )
		guiSetVisible ( okno.logowanie, false )
		showCursor ( false )
		showChat ( true )
		showPlayerHudComponent ( "all", true )
		fadeCamera ( false )
		setTimer ( fadeCamera, 3000, 1, true )
		removeEventHandler ( "onClientRender", root, drawImageLogowanie )
		removeEventHandler ( "onClientRender", root, drawLogo )
		setTimer ( setCameraTarget, 2000, 1, source )
	end
end)


addEvent ( "Rejestracja:zakoncz", true )
addEventHandler ( "Rejestracja:zakoncz", root, function ()
	if source == localPlayer then
		openPanelLogin ()
	end
end)
