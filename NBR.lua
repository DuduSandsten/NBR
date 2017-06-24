NBRVersion = "Version 2017-06-24"
NBR_IS_LOADED = false
CurrentBuffs = {}

-- ================================
-- Invoked when we recieve one of the requested events. 
-- Directs that event to the appropriate part of the addon
-- ================================
function NBR_OnEvent()
	--DEFAULT_CHAT_FRAME:AddMessage(event);
	if(event=="ADDON_LOADED") and NBR_IS_LOADED == false then
		NBR_ADDON_LOADED()
	--elseif(event=="UNIT_AURA") then
	--	NBR_Print("aura event fired")
	elseif(event=="PLAYER_AURAS_CHANGED") then
		AuraLog()
	end
end

function AuraLog()
	NBR_Print("Aura event fired! Difference since last check:")
	
	
	--Move last buff list to previous in order to log changes
	NBR_PreviousBuffs = NBR_CurrentBuffs
	NBR_CurrentBuffs = {}
	
	for i=1,32 do
		local buff=UnitBuff("player",i)
		if buff then 
			NBR_CurrentBuffs[i] = buff
		else
			break
		end 
	end
	
	NBR_DifferentBuffs = TableComp(NBR_CurrentBuffs,NBR_PreviousBuffs)
	
	
	-- check for gained buffs
	if(NBR_DifferentBuffs == nil) then
		NBR_DifferentBuffs = {}
	else
		if getn(NBR_DifferentBuffs) > 0 then
			for i=1,getn(NBR_DifferentBuffs) do
				NBR_Print(i.. "="..NBR_DifferentBuffs[i])
			end
		end
	end
	
	


	
	
	--Print current buffs
	--for i=1,getn(NBR_CurrentBuffs) do
	--	NBR_Print(i.. "="..NBR_CurrentBuffs[i])
	--end
	
	
	
	--list current buffs
	--[[
	for i=1,32 do
		local abrus,bofus=UnitBuff("player",i)
		if abrus then 
			NBR_Print(i.."="..abrus.." "..bofus) 
		end 
	end
	--]]
	--compare current buffs to last buffs
	
	
	
	
	--log change in current buffs
	
	
	
	--
end

function PrintCurrentBuffs()
	for i=1,getn(NBR_CurrentBuffs) do
		NBR_Print(i.. "="..NBR_CurrentBuffs[i])
	end
end

function PrintPreviousBuffs()
	for i=1,getn(NBR_PreviousBuffs) do
		NBR_Print(i.. "="..NBR_PreviousBuffs[i])
	end
end

function PrintDifferentBuffs()
	NBR_DifferentBuffs = TableComp(NBR_CurrentBuffs,NBR_PreviousBuffs)
	
	if getn(NBR_DifferentBuffs) >= 0 then
		for i=1,getn(NBR_DifferentBuffs) do
			NBR_Print(i.. "="..NBR_DifferentBuffs[i])
		end
	end
end

--compare tables
function TableComp(firstTable,secondTable)
	differenceTable = {}
	firstTableLength = getn(firstTable)
	secondTableLength = getn(secondTable)
	if firstTableLength > secondTableLength then
		largestTable = firstTableLength
	else
		largestTable = secondTableLength
	end
	
	for i=1,largestTable do
		local foundMatch = false
		for f=1,largestTable do
			--compare first line in first table with all lines in second table
			if firstTable[i] == secondTable[f] then
				foundMatch = true
			else
				foundMatch = false
			end
			if f>=largestTable and foundMatch == false then
				--no match was found add it to the difference table
				table.insert(differenceTable, 1, firstTable[f])
			end
		end
		return differenceTable
	end
	
end



function TableComp2(a,b) --algorithm is O(n log n), due to table growth.
    if getn(a) ~= getn(b) then return false end -- early out
    local t1,t2 = {}, {} -- temp tables
    for k,v in pairs(a) do -- copy all values into keys for constant time lookups
        t1[k] = (t1[k] or 0) + 1 -- make sure we track how many times we see each value.
    end
    for k,v in pairs(b) do
        t2[k] = (t2[k] or 0) + 1
    end
    for k,v in pairs(t1) do -- go over every element
        if v ~= t2[k] then return false end -- if the number of times that element was seen don't match...
    end
    return true
end



--Load values once the addon is loaded
function NBR_ADDON_LOADED()
	if(NBR_Options == nil) then
		NBR_Options = {}
	end
	
	--Make sure tables are not nil
	if(NBR_PreviousBuffs == nil) then
		NBR_PreviousBuffs = {}
	end
	if(NBR_CurrentBuffs == nil) then
		NBR_CurrentBuffs = {}
	end
	
	
	if(NBR_Options["Enabled"] == nil) then
		NBR_Options["Enabled"] = 1
	elseif (NBR_Options["Enabled"] == 0) then
		NBR_MinimapButton:SetNormalTexture("Interface\\AddOns\\NirkBuffRemover\\\Textures\\MinimapButton_disabled")
	end
	
	if(NBR_Options["AutoSwapTarget"] == nil) then
		NBR_Options["AutoSwapTarget"] = 1
	end
	
	if(NBR_Options["HealingPriority"] == nil) then
		NBR_Options["HealingPriority"] = 1
	end
	
	if(NBR_Options["MiniMapButtonAngle"] == nil) then
		NBR_Options["MiniMapButtonAngle"] = 0.64
	end
	
	NBR_Print("NBR loaded - "..NBRVersion)
	NBR_MinimapButton_SetPositionAngle(NBR_Options["MiniMapButtonAngle"])
	NBR_IS_LOADED = true
end

--Load events once
function NBR_OnLoad()
	this:RegisterEvent("ADDON_LOADED")
	--this:RegisterEvent("UNIT_AURA")
	this:RegisterEvent("PLAYER_AURAS_CHANGED")
end


function NBR_MinimapDropDown_OnLoad()
	UIDropDownMenu_SetAnchor(10, -20, this, "TOPLEFT", this:GetName(), "TOPRIGHT")
	UIDropDownMenu_Initialize(this, NBR_MinimapDropDown_Initialize)
end

-- Adds buttons to the minimap drop down
function NBR_MinimapDropDown_Initialize()
	NBR_Add_MinimapDropDownItem("Toggle: Enable/Disable",NBR_ToggleEnabled)
	NBR_Add_MinimapDropDownItem("Option: Auto swap profile from target",NBR_ToggleEnabled)
	NBR_Add_MinimapDropDownItem("Profile: Leeroy Jenkins",NBR_ToggleEnabled)
	NBR_Add_MinimapDropDownItem("Profile: Agressive",NBR_ToggleEnabled)
	NBR_Add_MinimapDropDownItem("Profile: Default",NBR_ToggleEnabled)
	NBR_Add_MinimapDropDownItem("Profile: Resistance Potions",NBR_ToggleEnabled)
	NBR_Add_MinimapDropDownItem("Profile: Survivalist",NBR_ToggleEnabled)
end

function NBR_ToggleEnabled()
	if(NBR_Options["Enabled"] == 1) then
		NBR_Options["Enabled"] = 0
		NBR_Print("BuffRemover is now disabled.")
		NBR_MinimapButton:SetNormalTexture("Interface\\AddOns\\NirkBuffRemover\\\Textures\\MinimapButton_disabled")
	else
		NBR_Options["Enabled"] = 1
		NBR_Print("BuffRemover is now enabled.")
		NBR_MinimapButton:SetNormalTexture("Interface\\AddOns\\NirkBuffRemover\\\Textures\\MinimapButton")
	end
end

function NBR_Print(toPrint)
	DEFAULT_CHAT_FRAME:AddMessage(toPrint, 1, 1, 0);
end

-- UpdateChanges
function NBR_OnUpdate(elapsed)
	if NBR_MinimapButton.IsDragging then
		NBR_MinimapButton_UpdateDragPosition()
	end
end

function NBR_MinimapButton_DragStart()
	NBR_MinimapButton.IsDragging = true;
	NBR_UpdateFrame:Show()
end

-- Users stops dragging. Ends the timer
function NBR_MinimapButton_DragEnd()
	NBR_MinimapButton.IsDragging = false;
	NBR_UpdateFrame:Hide()
end

-- Helper method that adds individual entries into the minimap drop down
-- menu.
-- ================================
function NBR_Add_MinimapDropDownItem(text, eventHandler)
	local info = { }
	info.text = text
	info.value = text
	info.owner = this
	info.func = eventHandler -- WebDKP_Tables_DropDown_OnClick;
	UIDropDownMenu_AddButton(info)
end

-- ================================
-- Updates the position of the mini map button. Should be called
-- via the on update method of the update frame
-- ================================
function NBR_MinimapButton_UpdateDragPosition()
	-- Remember where the cursor was in case the user drags
	local	vCursorX, vCursorY = GetCursorPosition()
	
	vCursorX = vCursorX / this:GetEffectiveScale()
	vCursorY = vCursorY / this:GetEffectiveScale()
	
	local	vCursorDeltaX = vCursorX - NBR_MinimapButton.CursorStartX
	local	vCursorDeltaY = vCursorY - NBR_MinimapButton.CursorStartY
	
	--
	
	local	vCenterX = NBR_MinimapButton.CenterStartX + vCursorDeltaX
	local	vCenterY = NBR_MinimapButton.CenterStartY + vCursorDeltaY
	
	-- Calculate the angle
	
	local	vAngle = math.atan2(vCenterX, vCenterY)
	
	-- Set the new position
	
	NBR_MinimapButton_SetPositionAngle(vAngle)
	
	--Sandsten edit, and remember it ofc... stoopid
	NBR_Options["MiniMapButtonAngle"] = vAngle
	
end

function NBR_MinimapButton_MouseDown()
	-- Remember where the cursor was in case the user drags
	local	vCursorX, vCursorY = GetCursorPosition()
	
	vCursorX = vCursorX / this:GetEffectiveScale()
	vCursorY = vCursorY / this:GetEffectiveScale()
	
	NBR_MinimapButton.CursorStartX = vCursorX
	NBR_MinimapButton.CursorStartY = vCursorY
	
	local	vCenterX, vCenterY = NBR_MinimapButton:GetCenter()
	local	vMinimapCenterX, vMinimapCenterY = Minimap:GetCenter()
	
	NBR_MinimapButton.CenterStartX = vCenterX - vMinimapCenterX
	NBR_MinimapButton.CenterStartY = vCenterY - vMinimapCenterY
end

function NBR_MinimapButton_SetPositionAngle(pAngle)
	local	vAngle = pAngle
	
	
	local	vRadius = 80
	
	vCenterX = math.sin(vAngle) * vRadius;
	vCenterY = math.cos(vAngle) * vRadius;
	
	NBR_MinimapButton:SetPoint("CENTER", "Minimap", "CENTER", vCenterX - 1, vCenterY - 1);
	NBR_MinimapButton:SetFrameStrata("MEDIUM")
	NBR_MinimapButton:SetScript("OnEnter", function()
		GameTooltip:SetOwner(NBR_MinimapButton, "ANCHOR_LEFT");
		GameTooltip:SetText("NBR - Nirklars Buff Remover");
		GameTooltip:AddLine(NBRVersion,1,1,1);
		if(NBR_Options["Enabled"] == 1) then
			GameTooltip:AddLine("NBR is Enabled",0,1,0);
		else
			GameTooltip:AddLine("NBR is Disabled",1,0,0);
		end
		GameTooltip:Show()
	end)
	
	NBR_MinimapButton:SetScript("OnLeave", function()
		GameTooltip:Hide()
	end)
	
	NBR_Options["MiniMapButtonAngle"] = vAngle;
end
