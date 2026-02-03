local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- CONFIG
local MAX_DISTANCE = 150
local ESP_ATIVO = true
local SHOW_NICK = false
local highlights = {}
local nameTags = {}

-- UTIL
local function getRoot(char)
	return char and char:FindFirstChild("HumanoidRootPart")
end

local function removeESP(player)
	if highlights[player] then highlights[player]:Destroy() highlights[player] = nil end
	if nameTags[player] then nameTags[player]:Destroy() nameTags[player] = nil end
end

local function createESP(player, character)
	if not ESP_ATIVO or player == LocalPlayer or not character then return end
	removeESP(player)

	local h = Instance.new("Highlight")
	h.Name = "ESPHighlight"
	h.Adornee = character
	h.Parent = character
	h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	h.FillTransparency = 0.35
	h.FillColor = Color3.fromRGB(0,170,255)
	h.OutlineColor = Color3.fromRGB(0,170,255)
	highlights[player] = h

	if SHOW_NICK then
		local root = getRoot(character)
		if root then
			local bill = Instance.new("BillboardGui")
			bill.Name = "NickTag"
			bill.Adornee = root
			bill.Size = UDim2.new(0,120,0,25)
			bill.StudsOffset = Vector3.new(0,3,0)
			bill.AlwaysOnTop = true

			local text = Instance.new("TextLabel")
			text.Text = player.Name
			text.Size = UDim2.new(1,0,1,0)
			text.BackgroundTransparency = 1
			text.TextColor3 = Color3.new(1,1,1)
			text.TextScaled = true
			text.Font = Enum.Font.GothamBold
			text.Parent = bill

			bill.Parent = gui
			nameTags[player] = bill
		end
	end
end

local function setupPlayer(player)
	if player == LocalPlayer then return end
	player.CharacterAdded:Connect(function(char)
		if ESP_ATIVO then createESP(player, char) end
	end)
	if player.Character then createESP(player, player.Character) end
end

-- GUI HUB
local gui = Instance.new("ScreenGui")
gui.ResetOnSpawn = false
gui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- FRAME PRINCIPAL
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0,220,0,250)
frame.Position = UDim2.new(0,20,0,50)
frame.BackgroundColor3 = Color3.fromRGB(40,40,40)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = gui

-- ABAS
local espTabButton = Instance.new("TextButton")
espTabButton.Size = UDim2.new(0,100,0,30)
espTabButton.Position = UDim2.new(0,10,0,10)
espTabButton.BackgroundColor3 = Color3.fromRGB(0,120,255)
espTabButton.TextColor3 = Color3.new(1,1,1)
espTabButton.TextScaled = true
espTabButton.Font = Enum.Font.GothamBold
espTabButton.Text = "ESP"
espTabButton.Parent = frame

local tabFrame = Instance.new("Frame")
tabFrame.Size = UDim2.new(0,200,0,180)
tabFrame.Position = UDim2.new(0,10,0,50)
tabFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)
tabFrame.BorderSizePixel = 0
tabFrame.Parent = frame

-- FUNÇÃO CRIAR BOTÃO
local function createButton(text, posY, callback)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(0,180,0,30)
	btn.Position = UDim2.new(0,10,posY,0)
	btn.BackgroundColor3 = Color3.fromRGB(0,120,255)
	btn.TextColor3 = Color3.new(1,1,1)
	btn.TextScaled = true
	btn.Font = Enum.Font.GothamBold
	btn.Text = text
	btn.Parent = tabFrame
	btn.MouseButton1Click:Connect(callback)
	return btn
end

-- BOTÕES ABA ESP
local btnESP = createButton("ESP ON", 10, function()
	ESP_ATIVO = not ESP_ATIVO
	btnESP.Text = ESP_ATIVO and "ESP ON" or "ESP OFF"
	if not ESP_ATIVO then
		for _, h in pairs(highlights) do h:Destroy() end
		for _, t in pairs(nameTags) do t:Destroy() end
		highlights = {}
		nameTags = {}
	end
end)

local btnNick = createButton("Nick OFF", 60, function()
	SHOW_NICK = not SHOW_NICK
	btnNick.Text = SHOW_NICK and "Nick ON" or "Nick OFF"
	if not SHOW_NICK then
		for _, t in pairs(nameTags) do t:Destroy() end
		nameTags = {}
	end
end)

-- BOTÃO MINIMIZAR
local btnMin = Instance.new("TextButton")
btnMin.Size = UDim2.new(0,50,0,25)
btnMin.Position = UDim2.new(1,-55,0,10)
btnMin.AnchorPoint = Vector2.new(1,0)
btnMin.BackgroundColor3 = Color3.fromRGB(200,0,0)
btnMin.TextColor3 = Color3.new(1,1,1)
btnMin.TextScaled = true
btnMin.Font = Enum.Font.GothamBold
btnMin.Text = "-"
btnMin.Parent = frame

local btnOpen = Instance.new("TextButton")
btnOpen.Size = UDim2.new(0,50,0,25)
btnOpen.Position = UDim2.new(0,20,0,50)
btnOpen.BackgroundColor3 = Color3.fromRGB(0,200,0)
btnOpen.TextColor3 = Color3.new(1,1,1)
btnOpen.TextScaled = true
btnOpen.Font = Enum.Font.GothamBold
btnOpen.Text = "Open"
btnOpen.Visible = false
btnOpen.Parent = gui

-- EVENTOS MINIMIZAR / ABRIR
btnMin.MouseButton1Click:Connect(function()
	frame.Visible = false
	btnOpen.Visible = true
end)

btnOpen.MouseButton1Click:Connect(function()
	frame.Visible = true
	btnOpen.Visible = false
end)

-- LOOP INQUEBRÁVEL ESP
RunService.RenderStepped:Connect(function()
	local myChar = LocalPlayer.Character
	local myRoot = getRoot(myChar)
	if not myRoot then return end

	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character then
			local root = getRoot(player.Character)
			if root then
				local dist = (myRoot.Position - root.Position).Magnitude
				if dist <= MAX_DISTANCE then
					if not highlights[player] or highlights[player].Parent ~= player.Character then
						createESP(player, player.Character)
					end
				else
					removeESP(player)
				end
			end
		end
	end
end)

-- Players
Players.PlayerAdded:Connect(setupPlayer)
Players.PlayerRemoving:Connect(removeESP)
for _, p in ipairs(Players:GetPlayers()) do setupPlayer(p) end

-- Watchdog extra
spawn(function()
	while true do
		for player, h in pairs(highlights) do
			if not player.Character or not h or h.Parent ~= player.Character then
				if player.Character then createESP(player, player.Character) end
			end
		end
		if SHOW_NICK then
			for player, tag in pairs(nameTags) do
				if not player.Character or not tag or tag.Parent ~= gui then
					if player.Character then createESP(player, player.Character) end
				end
			end
		end
		wait(0.5)
	end
end)
