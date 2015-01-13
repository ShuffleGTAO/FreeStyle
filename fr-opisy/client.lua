font = dxCreateFont ( "zachary.ttf", 12 )

mojeW,mojeH = 640, 480
sW,sH = guiGetScreenSize()
width, height = (sW/mojeW), (sH/mojeH)



function renderIng( )
	local x, y, z = getCameraMatrix( )
	local dimension = getElementDimension( localPlayer )
	for key, pickup in ipairs ( getElementsByType( "pickup" ) ) do
		if getElementDimension( pickup ) == dimension then
			local px, py, pz = getElementPosition( pickup )
			local distance = getDistanceBetweenPoints3D( px, py, pz, x, y, z )
			if distance <= 20 then
				local text = getElementData( pickup, "message" )	
				if text and ( distance < 2 or isLineOfSightClear( x, y, z, px, py, pz + 0.7, true, true, true, true, false, false, true, localPlayer ) ) then
					local sx, sy = getScreenFromWorldPosition( px, py, pz + 0.7 )
					if sx and sy then
						local w = dxGetTextWidth( tostring( text ) )
						local h = ( text and 2 or 1 ) * dxGetFontHeight( )
						dxDrawRectangle( sx - w / 2 - 5, sy - h / 2 - 5, w + 10, h + 10, tocolor( 0, 0, 0, 200 ) )
						dxDrawText( tostring( text ), sx, sy, sx, sy, tocolor( 255, 255, 255, 255 ), 1, "default", "center", "center" )
					end
				end
			end
		end
	end
	for key, marker in ipairs ( getElementsByType( "marker" ) ) do
		if getElementDimension( marker ) == dimension then
			local px, py, pz = getElementPosition( marker )
			local distance = getDistanceBetweenPoints3D( px, py, pz, x, y, z )
			if distance <= 20 then
				local text = getElementData( marker, "message" )	
				if text and ( distance < 2 or isLineOfSightClear( x, y, z, px, py, pz + 1.7, true, true, true, true, false, false, true, localPlayer ) ) then
					local sx, sy = getScreenFromWorldPosition( px, py, pz + 1.7 )
					if sx and sy then
						local w = dxGetTextWidth( tostring( text ) )
						local h = ( text and 2 or 1 ) * dxGetFontHeight( )
						dxDrawText( tostring( text ), sx, sy, sx+2, sy+202, tocolor( 0, 0, 0, 255 ), 1, font, "center", "center" )
						dxDrawText( tostring( text ), sx, sy, sx, sy+200, tocolor( 255, 255, 255, 255 ), 1, font, "center", "center" )
					end
				end
			end
		end
	end
	for key, player in ipairs ( getElementsByType( "player" ) ) do
		if getElementDimension( player ) == dimension then
			local px, py, pz = getElementPosition( player )
			local distance = getDistanceBetweenPoints3D( px, py, pz, x, y, z )
			if distance <= 20 then
				local text = getElementData( player, "message" )	
				if text and ( distance < 2 or isLineOfSightClear( x, y, z, px, py, pz + 1.1, true, true, true, true, false, false, true, localPlayer ) ) then
					local sx, sy = getScreenFromWorldPosition( px, py, pz + 0.2)
					if sx and sy then
						local w = dxGetTextWidth( tostring( text ) )
						local h = ( text and 2 or 1 ) * dxGetFontHeight( )
						-- dxDrawRectangle( sx - w / 2 - 5, sy - h / 2 - 5, w + 10, h + 10, tocolor( 0, 0, 0, 200 ) )
 						dxDrawText( tostring( text ), sx, sy, sx, sy, tocolor( 255, 255, 255, 255 ), 1.2*width/2, "default", "center", "center" )
					end
				end
			end
		end
	end		
	for key, ped in ipairs ( getElementsByType( "ped" ) ) do
		if getElementDimension( ped ) == dimension then
			local px, py, pz = getElementPosition( ped )
			local distance = getDistanceBetweenPoints3D( px, py, pz, x, y, z )
			if distance <= 20 then
				local text = getElementData( ped, "message" )	
				if text and ( distance < 2 or isLineOfSightClear( x, y, z, px, py, pz + 0, true, true, true, true, false, false, true, localPlayer ) ) then
					local sx, sy = getScreenFromWorldPosition( px, py, pz + 0.1)
					if sx and sy then
						local w = dxGetTextWidth( tostring( text ) )
						local h = ( text and 2 or 1 ) * dxGetFontHeight( )
						dxDrawRectangle( sx - w / 2 - 5, sy - h / 2 - 1, w + 10, h, tocolor( 0, 0, 0, 200 ) )
						dxDrawText( tostring( text ), sx, sy, sx, sy, tocolor( 255, 255, 255, 255 ), 1, "default", "center", "center" )
					end
				end
			end
		end
	end	
	for key, vehicle in ipairs ( getElementsByType( "vehicle" ) ) do
		if getElementDimension( vehicle ) == dimension then
			local px, py, pz = getElementPosition( vehicle )
			local distance = getDistanceBetweenPoints3D( px, py, pz, x, y, z )
			if distance <= 20 then
				local text = getElementData( vehicle, "message" ) or getElementData( vehicle, "message2" )
				if text and ( distance < 2 or isLineOfSightClear( x, y, z, px, py, pz + 1.1, true, false, false, true, false, false, true ) ) then
					local sx, sy = getScreenFromWorldPosition( px, py, pz+0.2 )
					if sx and sy then
						local w = dxGetTextWidth( tostring( text ) )
						local h = ( text and 2 or 1 ) * dxGetFontHeight( )
						--dxDrawRectangle( sx - w / 2 - 25, sy - h / 2 - 1, w +50, h, tocolor( 0, 0, 0, 200 ) )
						--dxDrawText( "Na kartce napisane:", sx, sy, sx, sy-30, tocolor( 255, 255, 255, 255 ), 0.8, "bankgothic", "center", "center" )
						--dxDrawRectangle( sx - w / 2 - 25, sy - h / 2 - 30, 300, 30, tocolor( 0, 0, 0, 200 ) )
						--dxDrawText( tostring( text ), sx, sy+30, sx, sy, tocolor( 0, 0, 0, 255 ), 0.9*width/2, "default", "center", "center" )
						--dxDrawText( tostring( text ), sx+1, sy+30+1, sx, sy, tocolor( 0, 0, 0, 255 ), 0.9*width/2, "default", "center", "center" )
						--dxDrawText( tostring( text ), sx+2, sy+30+2, sx, sy, tocolor( 0, 0, 0, 255 ), 0.9*width/2, "default", "center", "center" )
						
						dxDrawText( tostring( text ), sx+3, sy+30+3, sx, sy, tocolor( 0, 0, 0, 255 ), 0.8*width/1.8, font, "center", "center" )
						--dxDrawText( tostring( text ), sx-3, sy+30-3, sx, sy, tocolor( 0, 0, 0, 255 ), 0.9*width/2, "default", "center", "center" )
						--dxDrawText( tostring( text ), sx-2, sy+30-2, sx, sy, tocolor( 0, 0, 0, 255 ), 0.9*width/2, "default", "center", "center" )
						--dxDrawText( tostring( text ), sx-1, sy+30-1, sx, sy, tocolor( 0, 0, 0, 255 ), 0.9*width/2, "default", "center", "center" )
						dxDrawText( tostring( text ), sx, sy+30, sx, sy, tocolor( 255, 255, 255, 255 ), 0.8*width/1.8, font, "center", "center" )
					end
				end
			end
		end
	end	
	for key, object in ipairs ( getElementsByType( "object" ) ) do
		if getElementDimension( object ) == dimension then
			local px, py, pz = getElementPosition( object )
			local distance = getDistanceBetweenPoints3D( px, py, pz, x, y, z )
			if distance <= 20 then
				local text = getElementData( object, "message" )	
				if text and ( distance < 2 or isLineOfSightClear( x, y, z, px, py, pz + 1.1, true, true, true, true, false, false, true, localPlayer ) ) then
					local sx, sy = getScreenFromWorldPosition( px, py, pz + 1.1 )
					if sx and sy then
						local w = dxGetTextWidth( tostring( text ) )
						local h = ( text and 2 or 1 ) * dxGetFontHeight( )
 						dxDrawRectangle( sx - w / 2 - 5, sy - h / 2 - 1, w + 10, h, tocolor( 0, 0, 0, 200 ) )
						dxDrawText( tostring( text ), sx, sy, sx, sy, tocolor( 255, 255, 255, 255 ), 1, "default", "center", "center" )
					end
				end
			end
		end
	end	
end
addEventHandler( "onClientRender", getRootElement( ),renderIng)
