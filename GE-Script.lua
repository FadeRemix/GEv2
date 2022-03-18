<<<<<<< HEAD
local library = loadstring(game:GetObjects("rbxassetid://7657867786")[1].Source)()
local Wait = library.subs.Wait -- Only returns if the GUI has not been terminated. For 'while Wait() do' loops

local PepsisWorld = library:CreateWindow({
	Name = "POG",
	Themeable = {
	Info = "TEST2"
	}
})

local GeneralTab = PepsisWorld:CreateTab({
	Name = "General"
})

local PlayerTab = PepsisWorld:CreateTab({
	Name = "Players"
})

local TESTINGSection = GeneralTab:CreateSection({
	Name = "TESTING UI"
})

local MiscSection = GeneralTab:CreateSection({
	Name = "Misc",
	Side = "Right"
})

local FunSection = GeneralTab:CreateSection({
	Name = "Fun Cosmetics"
})

local PlayerSeleSection = PlayerTab:CreateSection({
	Name = "Players"
})

local PlayerLabelSection = PlayerTab:CreateSection({
	Name = "Info",
	Side = "Right"
})

TESTINGSection:AddToggle({
		Name = "EXP Grinder",
		Flag = "TESTINGSection_EXPGrinder"
})

TESTINGSection:AddToggle({
	Name = "Trick Spammer",
	Flag = "TESTINGSection_TrickSpammer",
	Keybind = 1,
	Callback = print
})

TESTINGSection:AddButton({
	Name = "Repair Board",
	Callback = function()
	print("Fixed")
end
})

TESTINGSection:AddKeybind({
	Name = "Test Key",
	Callback = print
})

TESTINGSection:AddToggle({
		Name = "Test Toggle/Key",
		Keybind = {
		Mode = "Dynamic" -- Dynamic means to use the 'hold' method, if the user keeps the button pressed for longer than 0.65 seconds; else use toggle method
		},
	Callback = print
})

TESTINGSection:AddSlider({
	Name = "Trick Rate",
	Flag = "TESTINGSection_TrickRate",
	Value = 0.15,
	Precise = 2,
	Min = 0,
	Max = 1
})

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

MiscSection:AddToggle({
	Name = "PlaceHolder",
	Flag = "MiscSection_PlaceHolder",
	Callback = print
})

FunSection:AddToggle({
	Name = "PlaceHolder",
	Flag = "FunSection_PlaceHolder"
})


PlrNameInfo = PlayerLabelSection:AddLabel({
    Name = "Name: Select a player!",
})

PlrHealthInfo = PlayerLabelSection:AddLabel({
    Name = "Health: Select a player!",
}) 

PlayerDropDown = PlayerSeleSection:AddDropdown({
	Name = "Select Player",
	Flag = "selectedplayer",
	List = game.Players, -- calls 'Method' (or GetChildren) on specifyed instance
	Method = "GetPlayers", -- We only want players
	Callback = function(player)
	plrz = game:GetService("Workspace"):FindFirstChild(player.Name)
	PlrNameInfo:Set("Name: ".. tostring(player))
	PlrHealthInfo:Set("Health: ".. tostring(plrz.Humanoid.Health))
	print(player)
	end
})
=======

>>>>>>> 5787fdf3f55d392b8eced2d5cb0eaa0e93e6c720
