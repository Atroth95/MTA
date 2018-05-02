local screenX,screenY = guiGetScreenSize ()
local zoom = 1 
if screenX < 1920 then 
    zoom = math.min(2, 1920/screenX)
end 

function isCursorOnElement( posX, posY, width, height )
	if isCursorShowing( ) then
		local mouseX, mouseY = getCursorPosition( )
		local clientW, clientH = guiGetScreenSize( )
		local mouseX, mouseY = mouseX * clientW, mouseY * clientH
		if ( mouseX > posX and mouseX < ( posX + width ) and mouseY > posY and mouseY < ( posY + height ) ) then
			return true
		end
	end
	return false
end

local marker = createMarker(207.7060546875 , -100.333984375 , 1005.2578125-1,"cylinder",1.2,150,150,150,100)
setElementInterior(marker,15)
local bg 
local font = dxCreateFont("f/Akrobat-Bold.otf",14)

maleSkins = {0, 1, 2, 7, 14, 15, 16, 18, 19, 20, 21, 22, 23, 24, 25, 26, 28, 29, 30, 32, 33, 34, 35, 36, 37, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 57, 58, 59, 60, 61, 62, 66, 67, 68, 70, 71, 72, 73, 78, 79, 80, 81, 82, 83, 84, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 120, 121, 122, 123, 124, 125, 126, 127, 128, 132, 133, 134, 135, 136, 137, 142, 143, 144, 146, 147, 153, 154, 155, 156, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 170, 171, 173, 174, 175, 176, 177, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 200, 202, 203, 204, 206, 209, 210, 212, 213, 217, 220, 221, 222, 223, 227, 228, 229, 230, 234, 235, 236, 239, 240, 241, 242, 247, 248, 249, 250, 252, 253, 254, 255, 258, 259, 260, 261, 262, 264, 265, 266,268, 269, 270, 271, 272, 290, 291, 292, 293, 294, 295, 296, 297, 299, 300, 301, 302, 303, 305, 306, 307, 308, 309, 310, 311, 312}
femaleSkins = {9, 12, 13, 31, 38, 39,40, 41, 53, 54, 55, 56, 63, 64, 69, 75, 76, 77, 85, 87, 88, 89, 90, 91, 92, 93, 129, 130, 131, 138, 139, 140, 141, 145, 148, 150, 151, 152, 157, 169, 172, 178, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 201, 205, 207, 211, 214, 215, 216, 218, 219, 224, 225, 226, 231, 232, 233, 237, 238, 243, 244, 245, 246, 251, 256, 257, 263, 298, 304}

premium = {10,11,27,17}

local class = {}
class.__index = class 

function class:drawElements () 
	if self.active then 
		dxDrawImage(screenX-1600/zoom,100/zoom,420/zoom,120/zoom,"i/main.png")
		if self.female or self.male then 
			if isCursorOnElement(screenX-1600/zoom,220/zoom,420/zoom,55/zoom) then 
				dxDrawImage(screenX-1600/zoom,220/zoom,420/zoom,55/zoom,"i/wroc2.png")
			else
				dxDrawImage(screenX-1600/zoom,220/zoom,420/zoom,55/zoom,"i/wroc.png")
			end
		end 	
		if self.main then 
			if isCursorOnElement(screenX-1600/zoom,220/zoom,420/zoom,55/zoom) then 
				dxDrawImage(screenX-1600/zoom,220/zoom,420/zoom,55/zoom,"i/meskie2.png")
			else 
				dxDrawImage(screenX-1600/zoom,220/zoom,420/zoom,55/zoom,"i/meskie.png")
			end
			if isCursorOnElement(screenX-1600/zoom,275/zoom,420/zoom,55/zoom) then 
				dxDrawImage(screenX-1600/zoom,275/zoom,420/zoom,55/zoom,"i/zenskie2.png")
			else
				dxDrawImage(screenX-1600/zoom,275/zoom,420/zoom,55/zoom,"i/zenskie.png")
			end
			if isCursorOnElement(screenX-1600/zoom,330/zoom,420/zoom,55/zoom) then 
				dxDrawImage(screenX-1600/zoom,330/zoom,420/zoom,55/zoom,"i/premium2.png")
			else
				dxDrawImage(screenX-1600/zoom,330/zoom,420/zoom,55/zoom,"i/premium.png")
			end
			if isCursorOnElement(screenX-1600/zoom,385/zoom,420/zoom,55/zoom) then 
				dxDrawImage(screenX-1600/zoom,385/zoom,420/zoom,55/zoom,"i/wroc2.png")
			else
				dxDrawImage(screenX-1600/zoom,385/zoom,420/zoom,55/zoom,"i/wroc.png")
			end
		end 
		if self.male then 
			for i = 1+self.scroll,6+self.scroll do 
				local pos = i - self.scroll
				if isCursorOnElement(screenX-1600/zoom,(220+(pos*55))/zoom,420/zoom,55/zoom) then
					dxDrawImage(screenX-1600/zoom,(220+(pos*55))/zoom,420/zoom,55/zoom,"i/none2.png")
				else 
					dxDrawImage(screenX-1600/zoom,(220+(pos*55))/zoom,420/zoom,55/zoom,"i/none.png")
				end
				if maleSkins[i] then 
					dxDrawText(maleSkins[i],screenX-870/zoom,(490+(pos*110))/zoom,10/zoom,10/zoom,tocolor(255,255,255,255),1,font,"center","center",false,false,true)
				end
			end
		end 
		if self.female then 
			for i = 1+self.scroll,6+self.scroll do 
				local pos = i - self.scroll
				if isCursorOnElement(screenX-1600/zoom,(220+(pos*55))/zoom,420/zoom,55/zoom) then
					dxDrawImage(screenX-1600/zoom,(220+(pos*55))/zoom,420/zoom,55/zoom,"i/none2.png")
				else 
					dxDrawImage(screenX-1600/zoom,(220+(pos*55))/zoom,420/zoom,55/zoom,"i/none.png")
				end
				if femaleSkins[i] then 
					dxDrawText(femaleSkins[i],screenX-870/zoom,(490+(pos*110))/zoom,10/zoom,10/zoom,tocolor(255,255,255,255),1,font,"center","center",false,false,true)
				end
			end
		end 
		if self.premium then 
			for i = 1+self.scroll,6+self.scroll do 
				local pos = i - self.scroll
				if isCursorOnElement(screenX-1600/zoom,(220+(pos*55))/zoom,420/zoom,55/zoom) then
					dxDrawImage(screenX-1600/zoom,(220+(pos*55))/zoom,420/zoom,55/zoom,"i/none2.png")
				else 
					dxDrawImage(screenX-1600/zoom,(220+(pos*55))/zoom,420/zoom,55/zoom,"i/none.png")
				end
				if premium[i] then 
					dxDrawText(premium[i],screenX-870/zoom,(490+(pos*110))/zoom,10/zoom,10/zoom,tocolor(255,255,255,255),1,font,"center","center",false,false,true)
				end
			end
		end 
	end 
end 

function class:onMarkerElementHit (el,dim)
	if el ~= localPlayer and dim then return end 
	if getElementType(el) ~= "player" then return end 
	addEventHandler("onClientRender",root,self.renderFunc)
	bg = dxCreateTexture("i/main.png","argb",false,"clamp")
	showChat(false)
	showCursor(true)
	ped1 = createPed(getElementModel(localPlayer),217.4,-98.4,1005.3)
	ped1:setInterior(15)
	ped1:setRotation(0,0,180)
	setCameraInterior(15)
	Camera.setMatrix(217.4,-102.6,1005.5,217.4,-102.6,1005.5)
	self.active = true 
	self.main = true 
end 

function class:onClick (btn,state)
	if btn and getKeyState("mouse1") and state then 
		if self.active then
			if self.main then
				if isCursorOnElement(screenX-1600/zoom,220/zoom,420/zoom,55/zoom) then 
					self.female = false 
					self.main = false 
					self.male = true 
				return end 
				if isCursorOnElement(screenX-1600/zoom,275/zoom,420/zoom,55/zoom) then 
					self.male = false
					self.main = false 
					self.female = true
				return end 
				if isCursorOnElement(screenX-1600/zoom,385/zoom,420/zoom,55/zoom) then 
					removeEventHandler("onClientRender",root,self.renderFunc)
					self.active = false 
					self.scroll = 0 
					self.main = false 
					self.female = false 
					self.male = false 
					self.premium = false
					setCameraTarget(localPlayer,nil)
					destroyElement(ped1)
					showChat(true)
					showCursor(false)
				return end 
				if isCursorOnElement(screenX-1600/zoom,330/zoom,420/zoom,55/zoom) and getElementData(localPlayer,"premium") then 
					self.main = false 
					self.premium = true
				return end 
			end 
			if self.male or self.female or self.premium then 
				if isCursorOnElement(screenX-1600/zoom,220/zoom,420/zoom,55/zoom) then 
					self.male = false
					self.female = false
					self.premium = false 
					self.scroll = 0 
					self.main = true
				end 
			end 
			if self.male then
				for i = 1+self.scroll,self.max+self.scroll do 
				local pos = i - self.scroll
					if isCursorOnElement(screenX-1600/zoom,(220+(pos*55))/zoom,420/zoom,55/zoom) then 
						class:selectSkin(maleSkins[i])
					end 
				end
			end
			if self.female then
				for i = 1+self.scroll,self.max+self.scroll do 
				local pos = i - self.scroll
					if isCursorOnElement(screenX-1600/zoom,(220+(pos*55))/zoom,420/zoom,55/zoom) then 
						class:selectSkin(femaleSkins[i])
					end 
				end
			end
			if self.premium then
				for i = 1+self.scroll,self.max+self.scroll do 
				local pos = i - self.scroll
					if isCursorOnElement(screenX-1600/zoom,(220+(pos*55))/zoom,420/zoom,55/zoom) then 
						class:selectSkin(premium[i])
					end 
				end
			end
		end 
	end 
end 

function class:moveUp ()
	if self.active then
		self.scroll = self.scroll -1 >= 0 and self.scroll -1 or self.scroll
	end 
end 

function class:moveDown ()
	if self.active then
		if self.male then
			self.scroll = self.scroll + 3 + self.max <= #maleSkins and self.scroll + 3 or self.scroll
		end
		if self.female then
			self.scroll = self.scroll + 3 + self.max <= #femaleSkins and self.scroll + 3 or self.scroll
		end 
	end 
end 

function class:selectSkin (id)
	if id then 
		triggerServerEvent("setPlayerSkin",localPlayer,id)
		ped1:setModel(id)
	end 
end 

function class:main ()
	self.onMarkerHitFunc = function (a,b) self:onMarkerElementHit (a,b) end 
	self.onClickFunc = function (a,b) self:onClick (a,b) end 
	self.moveUpFunc = function () self:moveUp () end 
	self.moveDownFunc = function () self:moveDown () end 
	self.renderFunc = function () self:drawElements () end 
	
	addEventHandler("onClientMarkerHit",marker,self.onMarkerHitFunc)
	addEventHandler("onClientClick",root,self.onClickFunc)
	
	bindKey("mouse_wheel_down","both",self.moveDownFunc)
	bindKey("mouse_wheel_up","both",self.moveUpFunc)
	
	self.active = false 
	self.female = false 
	self.male = false 
	self.premium = false 
	self.main = false
	self.scroll = 0 
	self.max = 10
end 

class:main ()
setCameraTarget(localPlayer,nil)
