local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

-------------------------------------------------
-- CONFIG
-------------------------------------------------

local MAX_DISTANCE = 150 -- metros/studs
local COLOR = Color3.fromRGB(0,170,255)

-------------------------------------------------

local ESP_ATIVO = true
local highlights = {}

-------------------------------------------------
-- GUI BOTÃO
-------------------------------------------------

local gui = Instance.new("ScreenGui")
gui.ResetOnSpawn = false
gui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local button = Instance.new("TextButton")
button.Size = UDim2.new(0,95,0,32)
button.Position = UDim2.new(0,15,0.5,-16)
button.BackgroundColor3 = Color3.fromRGB(0,170,255)
button.TextColor3 = Color3.new(1,1,1)
button.TextScaled = true
button.Font = Enum.Font.GothamBold
button.Parent = gui

-------------------------------------------------
-- FUNÇÕES
-------------------------------------------------

local function getRoot(char)
	return char and char:FindFirstChild("HumanoidRootPart")
end

local function removeESP(player)
	if highlights[player] then
		highlights[player]:Destroy()
		highlights[player] = nil
	end
end

local function createESP(player, character)
	if player == LocalPlayer then return end
	if not ESP_ATIVO then return end

	local h = Instance.new("Highlight")
	h.Name = "ESPHighlight"
	h.Adornee = character
	h.Parent = character
	h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	h.FillTransparency = 0.35
	h.FillColor = COLOR
	h.OutlineColor = COLOR

	highlights[player] = h
end

-------------------------------------------------
-- BOTÃO
-------------------------------------------------

local function atualizarBotao()
	if ESP_ATIVO then
		button.Text = "ESP ON"
		button.BackgroundColor3 = Color3.fromRGB(0,170,255)
	else
		button.Text = "ESP OFF"
		button.BackgroundColor3 = Color3.fromRGB(170,0,0)

		for _, h in pairs(highlights) do
			h:Destroy()
		end
		highlights = {}
	end
end

button.MouseButton1Click:Connect(function()
	ESP_ATIVO = not ESP_ATIVO
	atualizarBotao()
end)

-------------------------------------------------
-- LOOP DE DISTÂNCIA (inteligente)
-------------------------------------------------

RunService.RenderStepped:Connect(function()
	if not ESP_ATIVO then return end

	local myChar = LocalPlayer.Character
	local myRoot = getRoot(myChar)
	if not myRoot then return end

	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character then
			local root = getRoot(player.Character)

			if root then
				local dist = (myRoot.Position - root.Position).Magnitude

				if dist <= MAX_DISTANCE then
					if not highlights[player] then
						createESP(player, player.Character)
					end
				else
					removeESP(player)
				end
			end
		end
	end
end)

-------------------------------------------------
-- LIMPEZA
-------------------------------------------------

Players.PlayerRemoving:Connect(removeESP)

atualizarBotao()