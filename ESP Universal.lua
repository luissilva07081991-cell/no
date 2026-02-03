--// Serviços
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer

-------------------------------------------------
-- CONFIG
-------------------------------------------------
_G.HeadSize = 10
local hitboxEnabled = false
local espEnabled = false
local highlights = {}

-------------------------------------------------
-- GUI BASE
-------------------------------------------------
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "PvPMenu"

-------------------------------------------------
-- MENU PRINCIPAL (frame)
-------------------------------------------------
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,250,0,180)
frame.Position = UDim2.new(0.5,-125,0.5,-60)
frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
frame.Visible = true -- já visível
frame.Active = true
frame.Draggable = true
frame.BorderSizePixel = 0
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,14)

-------------------------------------------------
-- TOPO COM BOTÃO MINIMIZAR/ABRIR
-------------------------------------------------
local top = Instance.new("Frame", frame)
top.Size = UDim2.new(1,0,0,30)
top.BackgroundColor3 = Color3.fromRGB(30,30,30)
Instance.new("UICorner", top).CornerRadius = UDim.new(0,14)

local title = Instance.new("TextLabel", top)
title.Size = UDim2.new(1,-30,1,0)
title.BackgroundTransparency = 1
title.Text = "Hub Universal"
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.TextColor3 = Color3.new(1,1,1)

local minimize = Instance.new("TextButton", top)
minimize.Size = UDim2.new(0,30,1,0)
minimize.Position = UDim2.new(1,-30,0,0)
minimize.Text = "-"
minimize.TextScaled = true
minimize.BackgroundTransparency = 1
minimize.TextColor3 = Color3.new(1,1,1)

-------------------------------------------------
-- HITBOX SIZE
-------------------------------------------------
local sizeBox = Instance.new("TextBox", frame)
sizeBox.Position = UDim2.new(0.1,0,0,45)
sizeBox.Size = UDim2.new(0.8,0,0,28)
sizeBox.Text = "10"
sizeBox.PlaceholderText = "Hitbox Size"
sizeBox.TextScaled = true
sizeBox.BackgroundColor3 = Color3.fromRGB(40,40,40)
sizeBox.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", sizeBox)

-------------------------------------------------
-- BOTÃO HITBOX
-------------------------------------------------
local hitboxBtn = Instance.new("TextButton", frame)
hitboxBtn.Position = UDim2.new(0.1,0,0,80)
hitboxBtn.Size = UDim2.new(0.8,0,0,28)
hitboxBtn.Text = "Hitbox OFF"
hitboxBtn.TextScaled = true
hitboxBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
hitboxBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", hitboxBtn)

-------------------------------------------------
-- BOTÃO ESP
-------------------------------------------------
local espBtn = Instance.new("TextButton", frame)
espBtn.Position = UDim2.new(0.1,0,0,115)
espBtn.Size = UDim2.new(0.8,0,0,28)
espBtn.Text = "ESP OFF"
espBtn.TextScaled = true
espBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
espBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", espBtn)

-------------------------------------------------
-- MINIMIZAR / ABRIR
-------------------------------------------------
local minimized = false

minimize.MouseButton1Click:Connect(function()
	minimized = not minimized
	
	if minimized then
		frame.Visible = false
		minimize.Text = "+" -- muda para abrir
	else
		frame.Visible = true
		minimize.Text = "-" -- muda para minimizar
	end
end)

-------------------------------------------------
-- HITBOX (MESMA LÓGICA DO ORIGINAL)
-------------------------------------------------
local function updateHitbox()
	for _,plr in pairs(Players:GetPlayers()) do
		if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
			local hrp = plr.Character.HumanoidRootPart
			
			if hitboxEnabled then
				hrp.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
				hrp.Transparency = 0.3
				hrp.Material = Enum.Material.Neon
				hrp.BrickColor = BrickColor.new("Really blue")
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
	for _,h in pairs(highlights) do
		h:Destroy()
	end
	highlights = {}
end

local function createESP(player)
	if player == LocalPlayer then return end
	
	local h = Instance.new("Highlight")
	h.FillColor = Color3.fromRGB(0,170,255)
	h.OutlineColor = Color3.new(1,1,1)
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
