local screenX,screenY = guiGetScreenSize ()
local zoom = 1 
if screenX < 1920 then 
    zoom = math.min(2, 1920/screenX)
end 

local gracze = {}
local bg

local font = dxCreateFont("f/OpenSans-Light.ttf",14)

local classData = {}
classData.__index = classData

function classData:drawElements ()
	dxDrawImage(screenX - 1360/zoom,150/zoom,800/zoom,770/zoom,bg)
	dxDrawText(tostring(#getElementsByType("player")),screenX-1137/zoom,223/zoom,100/zoom,30/zoom,tocolor(255,255,255,255),2,"default-bold")
	for i,v in ipairs(getElementsByType("player")) do 
		if gracze[i] then 
			gracze[i][5] = getPlayerPing(v)
		end
	end
	for i = 1+self.scroll,self.max + self.scroll do
		local pos = i - self.scroll
		if gracze[i] then 
			dxDrawText(gracze[i][2],screenX - 1298/zoom,(295+(pos*45))/zoom,100/zoom,30/zoom,tocolor(255,255,255,255),1,font,"left","top",false,false,false,true)
			dxDrawText(gracze[i][1],screenX - 1222/zoom,(295+(pos*45))/zoom,100/zoom,30/zoom,tocolor(255,255,255,255),1,font,"left","top",false,false,false,true)
			dxDrawText(gracze[i][3],screenX - 1040/zoom,(295+(pos*45))/zoom,100/zoom,30/zoom,tocolor(255,255,255,255),1,font,"left","top",false,false,false,true)
			dxDrawText(gracze[i][4],screenX - 843/zoom,(295+(pos*45))/zoom,100/zoom,30/zoom,tocolor(255,255,255,255),1,font,"left","top",false,false,false,true)
			dxDrawText(gracze[i][5],screenX - 687/zoom,(295+(pos*45))/zoom,100/zoom,30/zoom,tocolor(255,255,255,255),1,font,"left","top",false,false,false,true)
		end
	end
end

function classData:sortTable (a,b)
	return tonumber(a[2]) < tonumber(b[2])
end 

function classData:enableGUI ()
	if not self.active then 
		for i,v in ipairs(getElementsByType("player")) do 
			local name = getPlayerName(v)
			table.insert(gracze,{name,getElementData(v,"id") or 1,"BRAK","BRAK",getPlayerPing(v)})
			table.sort(gracze,self.sortTableFunc)
		end 
		addEventHandler("onClientRender",root,self.renderFunc)
		bg = not bg and dxCreateTexture("i/tlo.png", "argb", false, "clamp") or bg
		self.active = true
	else
		gracze = {}
		removeEventHandler("onClientRender",root,self.renderFunc)
		destroyElement(bg)
		self.active = false 
	end 
end 

function classData:moveIndexUp ()
	if self.active then 
		self.scroll = self.scroll - 1 + self.max >= 0 and self.scroll - 1 or self.scroll
	end
end 

function classData:moveIndexDown ()
	if self.active then 
		self.scroll = self.scroll + 1 + self.max <= #gracze and self.scroll + 1 or self.scroll
	end
end 

function classData: main ()
	
	self.renderFunc = function () self:drawElements () end 
	self.moveIndexUpFunc = function() self:moveIndexUp () end 
	self.moveIndexDownFunc = function() self:moveIndexDown () end 
	self.sortTableFunc = function () self:sortTable () end 
	self.enableGUIFunc = function () self:enableGUI () end 
	
	bindKey("mouse_wheel_up", "down",self.moveIndexUpFunc)
	bindKey("mouse_wheel_down", "down",self.moveIndexDownFunc)
	bindKey("tab","up",self.enableGUIFunc)
	
	self.active = false 
	self.scroll = 0 
	self.max = 11 
end 

classData: main ()
