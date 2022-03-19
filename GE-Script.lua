local library = loadstring(game:GetObjects("rbxassetid://7657867786")[1].Source)()
local Wait = library.subs.Wait -- Only returns if the GUI has not been terminated. For 'while Wait() do' loops
---------------------------------------------
local PepsisWorld = library:CreateWindow({
	Name = "General Exploit v2",
	Themeable = {
	Info = "Script by Fade#8495"
	}
})
---------------------------------------------
local i = 0
local time = 0
local Stats = game:GetService("Stats").PerformanceStats
local playas = game:GetService("Players")
---------------------------------------------
local function round(number, decimalPlaces)
	return math.round(number * 10^decimalPlaces) * 10^-decimalPlaces
end
---------------------------------------------
local GeneralTab = PepsisWorld:CreateTab({
	Name = "General"
})
---------------------------------------------
local PlayerTab = PepsisWorld:CreateTab({
	Name = "Players"
})
---------------------------------------------
local GameTab = PepsisWorld:CreateTab({
	Name = "Game"
})
---------------------------------------------
local TESTINGSection = GeneralTab:CreateSection({
	Name = "TESTING UI"
})
---------------------------------------------
local InfoSection = GeneralTab:CreateSection({
	Name = "Info",
	Side = "Right"
})
---------------------------------------------
local FunSection = GeneralTab:CreateSection({
	Name = "Fun Cosmetics"
})
---------------------------------------------
local PlayerSeleSection = PlayerTab:CreateSection({
	Name = "Players"
})
---------------------------------------------
local PlayerLabelSection = PlayerTab:CreateSection({
	Name = "Info",
	Side = "Right"
})
---------------------------------------------
TESTINGSection:AddToggle({
		Name = "EXP Grinder",
		Flag = "TESTINGSection_EXPGrinder"
})
---------------------------------------------
TESTINGSection:AddToggle({
	Name = "Trick Spammer",
	Flag = "TESTINGSection_TrickSpammer",
	Keybind = 1,
	Callback = print
})
---------------------------------------------
TESTINGSection:AddButton({
	Name = "Repair Board",
	Callback = function()
	print("Fixed")
end
})
---------------------------------------------
TESTINGSection:AddKeybind({
	Name = "Test Key",
	Callback = print
})
---------------------------------------------
TESTINGSection:AddToggle({
		Name = "Test Toggle/Key",
		Keybind = {
		Mode = "Dynamic" -- Dynamic means to use the 'hold' method, if the user keeps the button pressed for longer than 0.65 seconds; else use toggle method
		},
	Callback = print
})
---------------------------------------------
TESTINGSection:AddSlider({
	Name = "Trick Rate",
	Flag = "TESTINGSection_TrickRate",
	Value = 0.15,
	Precise = 2,
	Min = 0,
	Max = 1
})
---------------------------------------------
TESTINGSection:AddSlider({
	Name = "Coin Distance",
	Flag = "TESTINGSection_CoinDistance",
	Value = 175,
	Min = 0,
	Max = 200,
	Format = function(Value)
		if Value == 0 then
			return "Collection Distance: Infinite"
		else
			return "Collection Distance: " .. tostring(Value)
		end
	end
})

---------------------------------------------
TESTINGSection:AddSlider({
	Name = "Coin Distance",
	Flag = "TESTINGSection_Coin Distance",
	Value = 4,
	Min = 0,
	Max = 60,
	Textbox = true,
	Format = function(Value)
		if Value == 0 then
			return "Ragdoll Extension: Indefinite"
		else
			return "Ragdoll Extension: " .. tostring(Value) .. "s"
		end
	end
})
---------------------------------------------
InfoPIS = InfoSection:AddLabel({
    Name = "Players In Server: ---"
    
})
---------------------------------------------
InfoElapTime = InfoSection:AddLabel({
    Name = "Time Elapsed: 00:00:00"
    
})
---------------------------------------------
InfoGPU = InfoSection:AddLabel({
	Name = "GPU: ",
})
---------------------------------------------
InfoCPU = InfoSection:AddLabel({
	Name = "CPU: ",
})
---------------------------------------------
InfoMemory = InfoSection:AddLabel({
	Name = "Memory: ",
})
---------------------------------------------
FunSection:AddToggle({
	Name = "PlaceHolder",
	Flag = "FunSection_PlaceHolder"
})
---------------------------------------------
PlrNameInfo = PlayerLabelSection:AddLabel({
    Name = "Name: ---",
})
---------------------------------------------
PlrDispNameInfo = PlayerLabelSection:AddLabel({
    Name = "Display Name: ---",
})
---------------------------------------------
PlrHealthInfo = PlayerLabelSection:AddLabel({
    Name = "Health: ---",
}) 
---------------------------------------------
PlrTeamInfo = PlayerLabelSection:AddLabel({
    Name = "Team: ---",
})
---------------------------------------------
PlrAgeInfo = PlayerLabelSection:AddLabel({
    Name = "Player Age: ---",
})
---------------------------------------------
PlrRigInfo = PlayerLabelSection:AddLabel({
    Name = "Rig Type: ---",
})
---------------------------------------------
PlrIDInfo = PlayerLabelSection:AddLabel({
    Name = "Player ID: ---",
})
---------------------------------------------
PlrStatusInfo = PlayerLabelSection:AddLabel({
    Name = "Status: ---",
}) 
---------------------------------------------
PlrMembershipInfo = PlayerLabelSection:AddLabel({
    Name = "Membership: ---",
}) 
---------------------------------------------
PlayerDropDown = PlayerSeleSection:AddDropdown({
	Name = "Select Player",
	Flag = "selectedplayer",
	List = game.Players, -- calls 'Method' (or GetChildren) on specifyed instance
	Method = "GetPlayers", -- We only want players
	Callback = function(player)

	plrz = game:GetService("Workspace"):FindFirstChild(player.Name)

	PlrNameInfo:Set("Name: ".. tostring(player))

	PlrDispNameInfo:Set("Display Name: ".. tostring(player.DisplayName))	

	if not player.Team then
		PlrTeamInfo:Set("Team: None")
	else 
		PlrTeamInfo:Set("Team: ".. tostring(player.Team))
	    print(player)
	end

	PlrAgeInfo:Set("Player Age: ".. tostring(player.AccountAge))

	PlrRigInfo:Set("Rig Type: ".. tostring(plrz.Humanoid.RigType.Name))

	PlrIDInfo:Set("Player ID: ".. tostring(player.UserId))
	
	PlrMembershipInfo:Set("Membership: ".. tostring(player.MembershipType.Name))
	
	while wait(0.1) do
		PlrHealthInfo:Set("Health: ".. tostring(plrz.Humanoid.Health))	
		if plrz.Humanoid.MoveDirection ~= Vector3.new(0,0,0) then
			PlrStatusInfo:Set("Status: Walking")
			elseif plrz.Humanoid.MoveDirection == Vector3.new(0,0,0) then
				PlrStatusInfo:Set("Status: Standing")
				elseif plrz.Humanoid.FloorMaterial == "Air" then
					PlrStatusInfo:Set("Status: Jumping")
			end
		end
	end
})

while wait(0.1) do
    i = i + 1
    	 if i == 10 then
		    time = time + 1
  		    InfoElapTime:Set(string.format("Time Elapsed: ".."%02d:%02d:%02d",time/3600,(time%3600)/60,time%60))
  	    i = 0
    end

    gPlayers = playas:GetPlayers()
    local numOFplrs = #gPlayers
	InfoPIS:Set("Players in Server: "..tostring(numOFplrs))

  	local GPUVAL = Stats["GPU"]:GetValue()
		InfoGPU:Set("GPU: "..tostring(round(GPUVAL,3)))
	local CPUVAL = Stats["CPU"]:GetValue()
		InfoCPU:Set("CPU: "..tostring(round(CPUVAL,3)))
	local MEMUsage = Stats["Memory"]:GetValue()
		InfoMemory:Set("Memory: "..tostring(round(MEMUsage,3)))
end
