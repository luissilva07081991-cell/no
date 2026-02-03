--// Serviços
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer

-------------------------------------------------
-- CONFIG
-------------------------------------------------
local IMAGE_ID = "rbxassetid://95222549791537"

_G.HeadSize = 10
_G.HitboxTransparency = 0.3

local hitboxEnabled = false
local espEnabled = false
local highlights = {}

-------------------------------------------------
-- GUI BASE
-------------------------------------------------
local gui = Instance.new("ScreenGui", game.CoreGui)

-------------------------------------------------
-- BOTÃO IMAGEM
-------------------------------------------------
local openBtn = Instance.new("ImageButton", gui)
openBtn.Size = UDim2.new(0,80,0,80)
openBtn.Position = UDim2.new(0,20,0.5,-40)
openBtn.Image = IMAGE_ID
openBtn.BackgroundTransparency = 1
openBtn.Active = true
openBtn.Draggable = true

Instance.new("UICorner", openBtn).CornerRadius = UDim.new(1,0)

-------------------------------------------------
-- MENU
-------------------------------------------------
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,260,0,210)
frame.Position = UDim2.new(0.5,-130,0.5,-105)
frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
frame.Visible = false
frame.Active = true
frame.Draggable = true
frame.BorderSizePixel = 0
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,14)

-------------------------------------------------
-- TOPO
-------------------------------------------------
local top = Instance.new("Frame", frame)
top.Size = UDim2.new(1,0,0,30)
top.BackgroundColor3 = Color3.fromRGB(30,30,30)
Instance.new("UICorner", top).CornerRadius = UDim.new(0,14)

local title = Instance.new("TextLabel", top)
title.Size = UDim2.new(1,-30,1,0)
title.BackgroundTransparency = 1
title.Text = "⚔ PvP MENU"
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.new(1,1,1)

local minimize = Instance.new("TextButton", top)
minimize.Size = UDim2.new(0,30,1,0)
minimize.Position = UDim2.new(1,-30,0,0)
minimize.Text = "-"
minimize.TextScaled = true
minimize.BackgroundTransparency = 1
minimize.TextColor3 = Color3.new(1,1,1)

-------------------------------------------------
-- ABRIR/FECHAR
-------------------------------------------------
openBtn.MouseButton1Click:Connect(function()
	frame.Visible = not frame.Visible
end)

-------------------------------------------------
-- HITBOX SIZE
-------------------------------------------------
local sizeBox = Instance.new("TextBox", frame)
sizeBox.Position = UDim2.new(0.1,0,0,45)
sizeBox.Size = UDim2.new(0.8,0,0,25)
sizeBox.Text = "10"
sizeBox.PlaceholderText = "Hitbox Size"
sizeBox.TextScaled = true
sizeBox.BackgroundColor3 = Color3.fromRGB(40,40,40)
sizeBox.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", sizeBox)

-------------------------------------------------
-- TRANSPARÊNCIA
-------------------------------------------------
local transBox = Instance.new("TextBox", frame)
transBox.Position = UDim2.new(0.1,0,0,75)
transBox.Size = UDim2.new(0.8,0,0,25)
transBox.Text = "0.3"
transBox.PlaceholderText = "Transparency (0-1)"
transBox.TextScaled = true
transBox.BackgroundColor3 = Color3.fromRGB(40,40,40)
transBox.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", transBox)

-------------------------------------------------
-- BOTÕES
-------------------------------------------------
local hitboxBtn = Instance.new("TextButton", frame)
hitboxBtn.Position = UDim2.new(0.1,0,0,105)
hitboxBtn.Size = UDim2.new(0.8,0,0,25)
hitboxBtn.Text = "Hitbox OFF"
hitboxBtn.TextScaled = true
hitboxBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
hitboxBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", hitboxBtn)

local espBtn = Instance.new("TextButton", frame)
espBtn.Position = UDim2.new(0.1,0,0,135)
espBtn.Size = UDim2.new(0.8,0,0,25)
espBtn.Text = "ESP OFF"
espBtn.TextScaled = true
espBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
espBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", espBtn)

-------------------------------------------------
-- MINIMIZAR
-------------------------------------------------
local minimized = false
minimize.MouseButton1Click:Connect(function()
	minimized = not minimized
	local goal = minimized and UDim2.new(0,260,0,30) or UDim2.new(0,260,0,210)
	TweenService:Create(frame, TweenInfo.new(0.25), {Size = goal}):Play()
end)

-------------------------------------------------
-- HITBOX FUNÇÃO
-------------------------------------------------
local function updateHitbox()
	for _,plr in pairs(Players:GetPlayers()) do
		if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
			local hrp = plr.Character.HumanoidRootPart
			
			if hitboxEnabled then
				hrp.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
				hrp.Transparency = _G.HitboxTransparency
				hrp.Material = Enum.Material.Neon
				hrp.CanCollide = false
			else
				hrp.Size = Vector3.new(2,2,1)
				hrp.Transparency = 1
			end
		end
	end
end

-------------------------------------------------
-- ESP
-------------------------------------------------
local function clearESP()
	for _,h in pairs(highlights) do h:Destroy() end
	highlights = {}
end

local function createESP(player)
	if player == LocalPlayer then return end
	
	local h = Instance.new("Highlight")
	h.FillColor = Color3.fromRGB(0,170,255)
	h.FillTransparency = 0.5
	h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	h.Adornee = player.Character
	h.Parent = player.Character
	
	highlights[player] = h
end

-------------------------------------------------
-- EVENTOS
-------------------------------------------------
sizeBox.FocusLost:Connect(function()
	_G.HeadSize = tonumber(sizeBox.Text) or 10
end)

transBox.FocusLost:Connect(function()
	local val = tonumber(transBox.Text)
	if val then
		_G.HitboxTransparency = math.clamp(val,0,1)
	end
end)

hitboxBtn.MouseButton1Click:Connect(function()
	hitboxEnabled = not hitboxEnabled
	hitboxBtn.Text = hitboxEnabled and "Hitbox ON" or "Hitbox OFF"
end)

espBtn.MouseButton1Click:Connect(function()
	espEnabled = not espEnabled
	espBtn.Text = espEnabled and "ESP ON" or "ESP OFF"
	if not espEnabled then clearESP() end
end)

-------------------------------------------------
-- LOOP
-------------------------------------------------
RunService.RenderStepped:Connect(function()
	if hitboxEnabled then
		updateHitbox()
	end
	
	if espEnabled then
		for _,plr in pairs(Players:GetPlayers()) do
			if plr.Character and not highlights[plr] then
				createESP(plr)
			end
		end
	end
end)
