local mainMarker = createMarker ( -2491.51001, 2363.24170, 9.27266, "cylinder", 2, 255, 0, 0 )
setElementData ( mainMarker, "message", "Prawo Jazdy Kategoria B" )
createBlipAttachedTo ( mainMarker, 36 )


addEventHandler ( "onClientMarkerHit", mainMarker, function ( element )
	if localPlayer == element then
		triggerServerEvent ( "Prawko:rozpocznij", element )
	end
end)