NBRVersion = "Version 2017-08-08"
NBR_IS_LOADED = false
NBR_CurrentNumBuffs = 0

--Slash commands
SlashCmdList["SLASH_NBR"] = function(Flag) end

--info
SLASH_NBR1, SLASH_NBR2 = "/nbr", "/buffremover"
function SlashCmdList.NBR(msg, editbox)
	if tostring(msg) == "" then
		NBRInfo()
	elseif tostring(msg) == "on" or tostring(msg) == "enable" then
		NBR_Enable()
	elseif tostring(msg) == "off" or tostring(msg) == "disable" then
		NBR_Disable()
	elseif tostring(msg) == "cfg" or tostring(msg) == "config" or tostring(msg) == "opt" or tostring(msg) == "options" then
		NBR_Print("<<NirklarsBuffRemover NBR commands>> nirklars.wordpress.com/wow")
		NBR_Print("There is no config menu yet. Sorry! Click the minimap button for options or type /nbr to get a list of commands.")
	elseif tostring(msg) == "thresh" or tostring(msg) == "threshold" or tostring(msg) == "count" then
		NBR_SetThreshold()
	elseif tostring(msg) == "leeroy" then
		NBR_SetProfileLeeroy()
	elseif tostring(msg) == "aggressive" then
		NBR_SetProfileAggressive()
	elseif tostring(msg) == "default" then
		NBR_SetProfileDefault()
	elseif tostring(msg) == "resistance" then
		NBR_SetProfileResistance()
	elseif tostring(msg) == "survival" then
		NBR_SetProfileSurvivalist()
	else
		NBRInfo()
	end
end

	function NBRInfo()
		NBR_Print("<<NirklarsBuffRemover NBR commands>> nirklars.wordpress.com/wow")
		NBR_Print("/nbr on/off/enable/disable - Toggle enabled disabled")
		--NBR_Print("/nbr cfg/config/opt/options - Show config menu")
		NBR_Print("/nbr thresh/threshold/count - Set buffcount before removing buffs")
		NBR_Print("/nbr leeroy - Set profile to Leeroy Jenkins")
		NBR_Print("/nbr aggressive - Set profile to Aggressive")
		NBR_Print("/nbr default - Set profile to Default")
		NBR_Print("/nbr resistance - Set profile to Resistance Potions")
		NBR_Print("/nbr survival - Set profile to Survivalist")
	end


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

function NBR_SetProfileAggressive()
	local name = "Aggressive"
	NBR_CurrentProfileName = name
	NBR_Print("Current profile set to: "..name)
	NBR_CurrentProfile = {
		"Rallying Cry of the Dragonslayer",
		"Spirit of Zandalar",
		"Sayge's Dark Fortune of Damage",
		"Warchief's Blessing",
		"Songflower Serenade",
		"Fengus' Ferocity",
		"Traces of Silithyst",
		"Enrage",
		"Arcane Shroud",
		"Recklessness",
		"Flurry",
		"Fire Festival Fury",
		"Trueshot Aura",
		"Bonereaver's Edge",
		"Earthstrike",
		"Insight of the Qiraji",
		"Badge of the Swarmguard",
		"Flask of the Titans",
		"Spirit of Zanza",
		"Fire-toasted Bun",
		"Elixir of the Mongoose",
		"Strike of the Scorpok",
		"R.O.I.D.S.",
		"Juju Power",
		"Juju Might",
		"Smoked Desert Dumplings",
		"Diamond Flask",
		"Holy Strength",
		"Strength of Earth",
		"Grace of Air",
		"Fire Resistance",
		"Frost Resistance",
		"Nature Resistance",
		"Stoneskin",
		"Healing Stream",
		"Mana Spring",
		"Tranquil Air",
		"Greater Blessing of Kings",
		"Greater Blessing of Might",
		"Greater Blessing of Salvation",
		"Greater Blessing of Sanctuary",
		"Blessing of Kings",
		"Blessing of Might", 
		"Blessing of Salvation",
		"Greater Stoneshield",
		"Blood Fury",
		"Battle Shout",
		"Heaven's Blessing",
		"Furious Howl",
		"Power Word: Fortitude",
		"Mark of the Wild",
		"Power Word: Shield",
		"Healing Way",
		"Ancestral Fortitude",
		"Inspiration",
		"Greater Nature Protection Potion",
		"Greater Shadow Protection Potion",
		"Renew",
		"Regrowth",
		"Rejuvenation",
		"Flip Out",
		"Battle Squawk",
		"Berserker Rage",
		"Blood Rage",
		"Mighty Rage",
		"Juju Flurry",
		"Mol'dar's Moxie",
		"Thorns",
		"Bloodthirst",
		"Abolish Poison",
		"Abolish Disease",
		"Water Breathing",
		"Water Walking",
		"Lightning Shield",
		"Fire Shield",
		"Detect Invisibility",
		"Detect Greater Invisibility",
		"Detect Lesser Invisibility",
		"Arcane Brilliance",
		"Prayer of Spirit",
		"Prayer of Shadow Protection",
		"Dampen Magic",
		"Amplify Magic",
	}
end

function NBR_SetProfileDefault()
	local name = "Default"
	NBR_CurrentProfileName = name
	NBR_Print("Current profile set to: "..name)
	NBR_CurrentProfile = {
		"Rallying Cry of the Dragonslayer",
		"Spirit of Zandalar",
		"Sayge's Dark Fortune of Damage",
		"Warchief's Blessing",
		"Songflower Serenade",
		"Fengus' Ferocity",
		"Traces of Silithyst",
		"Enrage",
		"Arcane Shroud",
		"Recklessness",
		"Flurry",
		"Fire Festival Fury",
		"Trueshot Aura",
		"Bonereaver's Edge",
		"Earthstrike",
		"Insight of the Qiraji",
		"Badge of the Swarmguard",
		"Flask of the Titans",
		"Spirit of Zanza",
		"Fire-toasted Bun",
		"Elixir of the Mongoose",
		"Strike of the Scorpok",
		"R.O.I.D.S.",
		"Juju Power",
		"Juju Might",
		"Smoked Desert Dumplings",
		"Diamond Flask",
		"Holy Strength",
		"Strength of Earth",
		"Grace of Air",
		"Fire Resistance",
		"Frost Resistance",
		"Nature Resistance",
		"Stoneskin",
		"Healing Stream",
		"Mana Spring",
		"Tranquil Air",
		"Greater Blessing of Kings",
		"Greater Blessing of Might",
		"Greater Blessing of Salvation",
		"Greater Blessing of Sanctuary",
		"Blessing of Kings",
		"Blessing of Might", 
		"Blessing of Salvation",
		"Greater Stoneshield",
		"Blood Fury",
		"Battle Shout",
		"Heaven's Blessing",
		"Furious Howl",
		"Mol'dar's Moxie",
		"Power Word: Fortitude",
		"Mark of the Wild",
		"Power Word: Shield",
		"Healing Way",
		"Ancestral Fortitude",
		"Inspiration",
		"Greater Nature Protection Potion",
		"Greater Shadow Protection Potion",
		"Renew",
		"Regrowth",
		"Rejuvenation",
		"Flip Out",
		"Battle Squawk",
		"Berserker Rage",
		"Blood Rage",
		"Mighty Rage",
		"Juju Flurry",
		"Thorns",
		"Bloodthirst",
		"Abolish Poison",
		"Abolish Disease",
		"Water Breathing",
		"Water Walking",
		"Lightning Shield",
		"Fire Shield",
		"Detect Invisibility",
		"Detect Greater Invisibility",
		"Detect Lesser Invisibility",
		"Arcane Brilliance",
		"Prayer of Spirit",
		"Prayer of Shadow Protection",
		"Dampen Magic",
		"Amplify Magic",
	}
end

function NBR_SetProfileLeeroy()
	local name = "Leeroy"
	NBR_CurrentProfileName = name
	NBR_Print("Current profile set to: "..name)
	NBR_CurrentProfile = {
		"Rallying Cry of the Dragonslayer",
		"Spirit of Zandalar",
		"Sayge's Dark Fortune of Damage",
		"Warchief's Blessing",
		"Songflower Serenade",
		"Fengus' Ferocity",
		"Traces of Silithyst",
		"Enrage",
		"Arcane Shroud",
		"Recklessness",
		"Flurry",
		"Fire Festival Fury",
		"Trueshot Aura",
		"Bonereaver's Edge",
		"Earthstrike",
		"Insight of the Qiraji",
		"Badge of the Swarmguard",
		"Flask of the Titans",
		"Spirit of Zanza",
		"Fire-toasted Bun",
		"Elixir of the Mongoose",
		"Strike of the Scorpok",
		"R.O.I.D.S.",
		"Juju Power",
		"Juju Might",
		"Smoked Desert Dumplings",
		"Diamond Flask",
		"Holy Strength",
		"Strength of Earth",
		"Grace of Air",
		"Fire Resistance",
		"Frost Resistance",
		"Nature Resistance",
		"Stoneskin",
		"Healing Stream",
		"Mana Spring",
		"Tranquil Air",
		"Greater Blessing of Kings",
		"Greater Blessing of Might",
		"Greater Blessing of Salvation",
		"Greater Blessing of Sanctuary",
		"Blessing of Kings",
		"Blessing of Might", 
		"Blessing of Salvation",
		"Greater Stoneshield",
		"Blood Fury",
		"Battle Shout",
		"Heaven's Blessing",
		"Furious Howl",
		"Power Word: Fortitude",
		"Mark of the Wild",
		"Power Word: Shield",
		"Healing Way",
		"Ancestral Fortitude",
		"Inspiration",
		"Greater Nature Protection Potion",
		"Greater Shadow Protection Potion",
		"Renew",
		"Regrowth",
		"Rejuvenation",
		"Flip Out",
		"Battle Squawk",
		"Berserker Rage",
		"Blood Rage",
		"Mighty Rage",
		"Juju Flurry",
		"Mol'dar's Moxie",
		"Thorns",
		"Bloodthirst",
		"Abolish Poison",
		"Abolish Disease",
		"Water Breathing",
		"Water Walking",
		"Lightning Shield",
		"Fire Shield",
		"Detect Invisibility",
		"Detect Greater Invisibility",
		"Detect Lesser Invisibility",
		"Arcane Brilliance",
		"Prayer of Spirit",
		"Prayer of Shadow Protection",
		"Dampen Magic",
		"Amplify Magic",
	}
end

function NBR_SetProfileResistance()
	local name = "Resistance"
	NBR_CurrentProfileName = name
	NBR_Print("Current profile set to: "..name)
	NBR_CurrentProfile = {
		"Rallying Cry of the Dragonslayer",
		"Spirit of Zandalar",
		"Sayge's Dark Fortune of Damage",
		"Warchief's Blessing",
		"Songflower Serenade",
		"Battle shout",
		"Blood Fury",
		"Fengus' Ferocity",
		"Recklessness",
		"Diamond Flask",
		"Arcane Shroud",
		"Holy Strength",
		"Bonereaver's Edge",
		"Trueshot Aura",
		"Enrage",
		"Battle Squawk",
		"Traces of Silithyst",
		"Elixir of the Mongoose",
		"Flurry",
		"Mighty Rage",
		"Juju Power",
		"Fire Festival Fury",
		"R.O.I.D.S.",
		"Fire-toasted Bun",
		"Smoked Desert Dumplings",
		"Juju Might",
		"Juju Flurry",
		"Mark of the Wild",
		"Strike of the Scorpok",
		"Berserker Rage",
		"Mol'dar's Moxie",
		"Spirit of Zanza",
		"Power Word: Fortitude",
		"Greater Nature Protection Potion",
		"Greater Shadow Protection Potion",
		"Renew",
		"Ancestral Fortitude",
		"Inspiration",
		"Furious Howl",
		"Rejuvenation",
		"Prayer of Shadow Protection",
		"Power Word: Shield",
		"Regrowth",
		"Abolish Poison",
		"Abolish Disease",
		"Healing Way",
		"Water Breathing",
		"Blood Rage",
		"Bloodthirst",
		"Thorns",
		"Water Walking",
		"Lightning Shield",
		"Arcane Brilliance",
		"Dampen Magic",
		"Amplify Magic",
		"Prayer of Spirit",
		"Fire Shield",
		"Detect Invisibility",
		"Detect Greater Invisibility",
		"Detect Lesser Invisibility"
	}
end

function NBR_SetProfileSurvivalist()
	local name = "Survivalist"
	NBR_CurrentProfileName = name
	NBR_Print("Current profile set to: "..name)
	NBR_CurrentProfile = {
		"Rallying Cry of the Dragonslayer",
		"Spirit of Zandalar",
		"Sayge's Dark Fortune of Damage",
		"Warchief's Blessing",
		"Songflower Serenade",
		"Battle shout",
		"Blood Fury",
		"Fengus' Ferocity",
		"Recklessness",
		"Diamond Flask",
		"Arcane Shroud",
		"Holy Strength",
		"Bonereaver's Edge",
		"Trueshot Aura",
		"Enrage",
		"Battle Squawk",
		"Traces of Silithyst",
		"Elixir of the Mongoose",
		"Flurry",
		"Mighty Rage",
		"Juju Power",
		"Fire Festival Fury",
		"R.O.I.D.S.",
		"Fire-toasted Bun",
		"Smoked Desert Dumplings",
		"Juju Might",
		"Juju Flurry",
		"Mark of the Wild",
		"Strike of the Scorpok",
		"Berserker Rage",
		"Mol'dar's Moxie",
		"Spirit of Zanza",
		"Power Word: Fortitude",
		"Greater Nature Protection Potion",
		"Greater Shadow Protection Potion",
		"Renew",
		"Ancestral Fortitude",
		"Inspiration",
		"Furious Howl",
		"Rejuvenation",
		"Prayer of Shadow Protection",
		"Power Word: Shield",
		"Regrowth",
		"Abolish Poison",
		"Abolish Disease",
		"Healing Way",
		"Water Breathing",
		"Blood Rage",
		"Bloodthirst",
		"Thorns",
		"Water Walking",
		"Lightning Shield",
		"Arcane Brilliance",
		"Dampen Magic",
		"Amplify Magic",
		"Prayer of Spirit",
		"Fire Shield",
		"Detect Invisibility",
		"Detect Greater Invisibility",
		"Detect Lesser Invisibility"
	}
end


--not implemented yet
function NBR_AutoSwapProfiles()
	if(NBR_Options["NBR_AutoSwapProfiles"] == 1) then
		NBR_Print("NBR Profile autoswapping: Disabled")
		NBR_Options["NBR_AutoSwapProfiles"] = 0
	else
		NBR_Print("NBR Profile autoswapping: Enabled")
		NBR_Options["NBR_AutoSwapProfiles"] = 1
	end
end

function NBRLoadProfile()
	if(NBR_CurrentProfile == nil) then
		NBR_CurrentProfile = NBR_ProfileDefault
	end
	if(NBR_CurrentProfileName == nil) then
		NBR_CurrentProfileName = "Default"
	end
end

function NBR_ToggleNotifications()
	if(NBR_Options["Notifications"] == true) then
		NBR_Options["Notifications"] = false
		NBR_Print("NBR Notifications: Disabled")
	else
		NBR_Options["Notifications"] = true
		NBR_Print("NBR Notifications: Enabled")
	end
end

function AuraLog()
	if NBR_Options["Enabled"] == 0 then
		return
	end
	
	--NBR_Print("Aura event fired! Difference since last check:")
	
	
	--Move last buff list to previous in order to log changes
	NBR_PreviousBuffs = NBR_CurrentBuffs
	NBR_CurrentBuffs = {}
	NBR_CurrentNumBuffs = 0
	
	
	--retrieve proper buff names from player via tooltip example
	--[[
	GameTooltip:SetOwner(WorldFrame) 
	for i=1,32 do 
		GameTooltip:SetPlayerBuff(i) 
		if GameTooltipTextLeft1:GetText() then 
			DEFAULT_CHAT_FRAME:AddMessage(i.."="..GameTooltipTextLeft1:GetText(),0.4,1,1) 
		end 
	end
	--]]
	
	--retrieve proper buff names and count buffs and store store each buff slotID in a table
	GameTooltip:SetOwner(WorldFrame) 
	for i=0,32 do
		GameTooltip:SetPlayerBuff(i) 
		if GameTooltipTextLeft1:GetText() then 
			GameTooltip:SetPlayerBuff(i) 
			NBR_CurrentBuffs[i] = GameTooltipTextLeft1:GetText()
			NBR_CurrentNumBuffs = NBR_CurrentNumBuffs + 1
		else
			break
		end 
	end
	
	--BACKWARDS
	--/run for i=33,1,-1 do Print(NBR_Profile[i]) end
	
	--check if got too many buffs
	local breakout = false
	if NBR_CurrentNumBuffs > NBR_Options["Threshold"]+1-1 then
		for j=getn(NBR_CurrentProfile),1,-1 do
			for i=1,getn(NBR_CurrentBuffs) do
				--NBR_Print("Looping through i: "..i.." and "..j)
				if NBR_CurrentBuffs[i] == NBR_CurrentProfile[j] then
					if NBR_Options["Notifications"] == true then
						NBR_Print("NBR canceled buff: "..NBR_CurrentBuffs[i])
					end
					CancelPlayerBuff(i)
					breakout = true
					break
				end
			end
			if breakout then 
				break
			end
		end
	end
	
	
	
	
	
	--[[
	GameTooltip:SetOwner(WorldFrame) 
	for i=1,32 do
		local buff=UnitBuff("player",i)
		if buff then 
			GameTooltip:SetPlayerBuff(i) 
			NBR_CurrentBuffs[i] = GameTooltipTextLeft1:GetText()
			NBR_CurrentNumBuffs = NBR_CurrentNumBuffs + 1
		else
			break
		end 
	end
	--]]
	
	--Compare difference testing (not really needed but trying to learn)
	--NBR_DifferentBuffs = TableComp(NBR_CurrentBuffs,NBR_PreviousBuffs)
	
	--[[
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
	
	
	--]]

	
	
	--Print current buffs

	
	
	--list current buffs

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
	if(NBR_Options["Threshold"] == nil) then
		NBR_Options["Threshold"] = 30
	end
	if(NBR_Options["Notifications"] == nil) then
		NBR_Options["Notifications"] = true
	end
	
	if(NBR_Options["Enabled"] == nil) then
		NBR_Options["Enabled"] = 1
		NBR_MinimapButton:SetNormalTexture("Interface\\AddOns\\NBR\\Textures\\MinimapButton")
	elseif (NBR_Options["Enabled"] == 0) then
		NBR_MinimapButton:SetNormalTexture("Interface\\AddOns\\NBR\\Textures\\MinimapButton_disabled")
	end
	
	if(NBR_Options["NBR_AutoSwapProfiles"] == nil) then
		NBR_Options["NBR_AutoSwapProfiles"] = 1
	end
	
	if(NBR_Options["HealingPriority"] == nil) then
		NBR_Options["HealingPriority"] = 1
	end
	
	if(NBR_Options["MiniMapButtonAngle"] == nil) then
		NBR_Options["MiniMapButtonAngle"] = 0.64
	end
	
	NBR_Print("NBR loaded - "..NBRVersion)
	NBR_MinimapButton_SetPositionAngle(NBR_Options["MiniMapButtonAngle"])
	NBRLoadProfile()
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
	NBR_Add_MinimapDropDownItem("Option: Set Threshold for auto removal",NBR_SetThreshold)
	NBR_Add_MinimapDropDownItem("Option: Toggle notifications",NBR_ToggleNotifications)
	--NBR_Add_MinimapDropDownItem("Option: Auto swap profile from target",NBR_AutoSwapProfiles())
	NBR_Add_MinimapDropDownItem("Profile: Leeroy Jenkins",NBR_SetProfileLeeroy)
	NBR_Add_MinimapDropDownItem("Profile: Aggressive",NBR_SetProfileAggressive)
	NBR_Add_MinimapDropDownItem("Profile: Default",NBR_SetProfileDefault)
	NBR_Add_MinimapDropDownItem("Profile: Resistance Potions",NBR_SetProfileResistance)
	NBR_Add_MinimapDropDownItem("Profile: Survivalist",NBR_SetProfileSurvivalist)
end

function NBR_SetThreshold()
	StaticPopupDialogs["NBR_SET_THRESHOLD_PROMPT"] = {
		text = "Please select the Threshold for when buffs should start being removed. (Default is 30) \n\nTheoretically 31 Should be enough but some auras count as buffs depending on the server. For example Warrior stances counts as invisible buffs on Kronos.",
	  	button1 = "Confirm",
	  	button2 = "Cancel",
		
		OnShow = function()
			getglobal(this:GetName().."EditBox"):SetFocus()
			getglobal(this:GetName().."EditBox"):SetText("30")
			getglobal(this:GetName().."EditBox"):HighlightText()
		end,
		
	  	OnAccept = function()
			local text = getglobal(this:GetParent():GetName().."EditBox"):GetText()
			if text ~= "" then
				NBR_Options["Threshold"] = text
			end
	  	end,
	  	timeout = 0,
	  	hasEditBox = true,
	  	whileDead = true,
	  	hideOnEscape = true,
	  	preferredIndex = 3,  -- avoid some UI taint, see http://www.wowace.com/announcements/how-to-avoid-some-ui-taint/
	}
	StaticPopup_Show ("NBR_SET_THRESHOLD_PROMPT")
end

function NBR_ToggleEnabled()
	if(NBR_Options["Enabled"] == 1) then
		NBR_Disable()
	else
		NBR_Enable()
	end
end

	function NBR_Disable()
		NBR_Options["Enabled"] = 0
		NBR_Print("BuffRemover is now disabled.")
		NBR_MinimapButton:SetNormalTexture("Interface\\AddOns\\NBR\\Textures\\MinimapButton_disabled")
	end

	function NBR_Enable()
		NBR_Options["Enabled"] = 1
		NBR_Print("BuffRemover is now enabled.")
		NBR_MinimapButton:SetNormalTexture("Interface\\AddOns\\NBR\\Textures\\MinimapButton")
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
			GameTooltip:AddLine("NBR is Enabled",0,1,0)
			GameTooltip:AddLine("Current Profile: "..NBR_CurrentProfileName,0,1,0)
			GameTooltip:AddLine("Current removal Threshold: "..NBR_Options["Threshold"],1,0.55,0.55)
			GameTooltip:AddLine("Current number of buffs: "..NBR_CurrentNumBuffs.."/32",1,1,1)
			for i=0,NBR_CurrentNumBuffs do
				GameTooltip:AddLine(NBR_CurrentBuffs[i],1,1,1)
			end
		else
			GameTooltip:AddLine("NBR is Disabled",1,0,0)
		end
		GameTooltip:Show()
	end)
	
	NBR_MinimapButton:SetScript("OnLeave", function()
		GameTooltip:Hide()
	end)
	
	NBR_Options["MiniMapButtonAngle"] = vAngle;
end
