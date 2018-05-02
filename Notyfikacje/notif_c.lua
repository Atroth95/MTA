local screenX,screenY = guiGetScreenSize ()
local zoom = 1 
if screenX < 1920 then 
    zoom = math.min(2, 1920/screenX)
end 

local notyfikacje = {}

local font = dxCreateFont("files/OpenSans-Light.ttf",13)

function renderNotif ()
	for index, value in ipairs (notyfikacje) do 
		if index < 5 and notyfikacje[index] then 
			local opis = notyfikacje[index].opis
			local start = notyfikacje[index].czas
			local stan = notyfikacje[index].stan
			local obecnystan = notyfikacje[index].obecnystan
			if	obecnystan == true then
				local now = getTickCount()
				local endTime = start + 500
				local elapsedTime = now - start
				local duration = endTime - start
				local progress = elapsedTime / duration
				x1,_,_ = interpolateBetween(0,0,0,600,0,0,progress,"OutQuad")
				x2,_,_ = interpolateBetween(2000,0,0,1320,0,0,progress,"OutQuad")
			else
				local now = getTickCount()
				local endTime = start + 500
				local elapsedTime = now - start
				local duration = endTime - start
				local progress = elapsedTime / duration
				x1,_,_ = interpolateBetween(600,0,0,0,0,0,progress,"OutQuad")
				x2,_,_ = interpolateBetween(1320,0,0,2300,0,0,progress,"OutQuad")
			end 
			dxDrawImage(screenX-x1/zoom,(230+(index*100))/zoom,522/zoom,107/zoom,"files/"..stan..".png",0,0,0)
			dxDrawText(tostring(opis),screenX+x2/zoom,(559+(index*200))/zoom,10/zoom,10/zoom,tocolor(255,255,255,255),1,"default-bold","center","center",false,true)
		end 
	end 
end
addEventHandler("onClientRender",root,renderNotif)

function createNotif(opis,czas,stan)
	if opis and tonumber(czas) then 
		if not stan then 
			stan = "info"
		end 
		local id = #notyfikacje + 1
		table.insert(notyfikacje,{opis,getTickCount(),stan,true}) 
		notyfikacje[id] = {
			opis = opis,
			czas = getTickCount(),
			stan = stan,
			obecnystan = true,
			
		}
		setTimer(function(id)
			notyfikacje[id].czas = getTickCount ()
			notyfikacje[id].obecnystan = false
			setTimer(function(id)
				notyfikacje[id] = nil
			end,500,1,id)
		end,czas*1000,1,id)
	end
end
addEvent("createNotif",true)
addEventHandler("createNotif",root,createNotif)

--server: triggerClientEvent(thePlayer, "createNotif",thePlayer,"Test3","error")
--client: triggerEvent("createNotif",localPlayer,"clienta",3)