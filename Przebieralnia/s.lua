local marker = createMarker(-1882.8,866.0,36,"arrow",1.2,150,150,150,255)
createBlipAttachedTo(marker,45)

local marker_out = createMarker(207.6,-110.6,1006.1,"arrow",1.2,150,150,150,255)
setElementInterior(marker_out,15)

addEventHandler("onMarkerHit",marker,function(el,dim)
	if getElementType(el) == "player" then
		fadeCamera(el,false,1)
		setTimer(function(el)
			setElementPosition(el,207.5430,-109.0040,1005.1330)
			setElementInterior(el,15)
			fadeCamera(el,true,1)
		end,1500,1,el)
	end
end)

addEventHandler("onMarkerHit",marker_out,function(el,dim)
	if getElementType(el) == "player" then
		fadeCamera(el,false,1)
		setTimer(function(el)
			setElementPosition(el,-1884.1,864.6,35.2)
			setElementInterior(el,0)
			fadeCamera(el,true,1)
		end,1500,1,el)
	end
end)

addEvent("setPlayerSkin",true)
addEventHandler("setPlayerSkin",root,function(id)
	client:setModel(id)
end)