--[[ Universal Hub LMG2L - UI estilo Apoc Hub (sem alterar funções) ]]--

local LMG2L = {}

--// Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

--// ScreenGui
local function criarScreenGui()
    local gui = Instance.new("ScreenGui")
    gui.Name = "UniversalHub"
    gui.ResetOnSpawn = false
    gui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    return gui
end

local screenGui = LocalPlayer.PlayerGui:FindFirstChild("UniversalHub") or criarScreenGui()

--// Main Frame
local main = Instance.new("Frame", screenGui)
main.Size = UDim2.new(0.32,0,0.56,0)
main.Position = UDim2.new(0.34,0,0.15,0)
main.BackgroundColor3 = Color3.fromRGB(20,20,30)
main.BorderSizePixel = 0
Instance.new("UICorner", main)

-- Header
local header = Instance.new("Frame", main)
header.Size = UDim2.new(1,0,0.15,0)
header.BackgroundColor3 = Color3.fromRGB(15,15,25)
Instance.new("UICorner", header)

local title = Instance.new("TextLabel", header)
title.Size = UDim2.new(1,-60,1,0)
title.Position = UDim2.new(0,15,0,0)
title.BackgroundTransparency = 1
title.Text = "Universal Hub"
title.Font = Enum.Font.GothamBold
title.TextSize = 22
title.TextColor3 = Color3.fromRGB(220,220,220)
title.TextXAlignment = Left

local toggleBtn = Instance.new("TextButton", header)
toggleBtn.Size = UDim2.new(0,40,0,40)
toggleBtn.Position = UDim2.new(1,-50,0.5,-20)
toggleBtn.Text = "-"
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextSize = 26
toggleBtn.BackgroundColor3 = Color3.fromRGB(60,60,80)
toggleBtn.TextColor3 = Color3.fromRGB(255,255,255)
Instance.new("UICorner", toggleBtn)

-- Frames laterais
local leftFrame = Instance.new("Frame", main)
leftFrame.Size = UDim2.new(0.3,0,0.8,0)
leftFrame.Position = UDim2.new(0.02,0,0.17,0)
leftFrame.BackgroundColor3 = Color3.fromRGB(25,25,35)
Instance.new("UICorner", leftFrame)

local rightFrame = Instance.new("Frame", main)
rightFrame.Size = UDim2.new(0.64,0,0.8,0)
rightFrame.Position = UDim2.new(0.34,0,0.17,0)
rightFrame.BackgroundColor3 = Color3.fromRGB(25,25,35)
Instance.new("UICorner", rightFrame)

-- Tabs
local function criarTab(texto, pos)
    local b = Instance.new("TextButton", leftFrame)
    b.Size = UDim2.new(0.9,0,0,40)
    b.Position = UDim2.new(0.05,0,0,pos)
    b.Text = texto
    b.Font = Enum.Font.Gotham
    b.TextSize = 16
    b.BackgroundColor3 = Color3.fromRGB(40,40,60)
    b.TextColor3 = Color3.fromRGB(220,220,220)
    Instance.new("UICorner", b)
    return b
end

local hitboxBtn = criarTab("Hitbox",10)
local espBtn = criarTab("ESP",60)

local hitboxContent = Instance.new("Frame", rightFrame)
hitboxContent.Size = UDim2.new(1,0,1,0)
hitboxContent.BackgroundTransparency = 1

local espContent = Instance.new("Frame", rightFrame)
espContent.Size = UDim2.new(1,0,1,0)
espContent.BackgroundTransparency = 1
espContent.Visible = false

hitboxBtn.MouseButton1Click:Connect(function()
    hitboxContent.Visible = true
    espContent.Visible = false
end)
espBtn.MouseButton1Click:Connect(function()
    hitboxContent.Visible = false
    espContent.Visible = true
end)

-- ================= TOGGLE ESTILO APOC HUB =================
local function criarToggle(parent, texto, estadoInicial, callback, y)
    local container = Instance.new("Frame", parent)
    container.Size = UDim2.new(0.95,0,0,36)
    container.Position = UDim2.new(0.025,0,0,y)
    container.BackgroundColor3 = Color3.fromRGB(30,30,45)
    Instance.new("UICorner", container).CornerRadius = UDim.new(0,8)

    local label = Instance.new("TextLabel", container)
    label.Size = UDim2.new(0.7,0,1,0)
    label.Position = UDim2.new(0.04,0,0,0)
    label.BackgroundTransparency = 1
    label.Text = texto
    label.Font = Enum.Font.Gotham
    label.TextSize = 14
    label.TextColor3 = Color3.fromRGB(220,220,220)
    label.TextXAlignment = Left

    local switch = Instance.new("Frame", container)
    switch.Size = UDim2.new(0,46,0,22)
    switch.Position = UDim2.new(1,-56,0.5,-11)
    switch.BackgroundColor3 = estadoInicial and Color3.fromRGB(90,120,255) or Color3.fromRGB(80,80,80)
    Instance.new("UICorner", switch).CornerRadius = UDim.new(1,0)

    local ball = Instance.new("Frame", switch)
    ball.Size = UDim2.new(0,18,0,18)
    ball.Position = estadoInicial and UDim2.new(1,-20,0.5,-9) or UDim2.new(0,2,0.5,-9)
    ball.BackgroundColor3 = Color3.fromRGB(255,255,255)
    Instance.new("UICorner", ball).CornerRadius = UDim.new(1,0)

    local estado = estadoInicial

    container.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then
            estado = not estado
            callback(estado)

            TweenService:Create(ball,TweenInfo.new(0.2),{
                Position = estado and UDim2.new(1,-20,0.5,-9) or UDim2.new(0,2,0.5,-9)
            }):Play()

            TweenService:Create(switch,TweenInfo.new(0.2),{
                BackgroundColor3 = estado and Color3.fromRGB(90,120,255) or Color3.fromRGB(80,80,80)
            }):Play()
        end
    end)
end

-- ================= HITBOX (FUNÇÃO ORIGINAL) =================
local _G_HeadSize = 10
local _G_Disabled = true

criarToggle(hitboxContent,"Hitbox",not _G_Disabled,function(v)
    _G_Disabled = not v
end,20)

-- ================= ESP (FUNÇÃO ORIGINAL) =================
local ESPSettings = {Box=false,Outline=false,Name=false,Distance=false,Teammates=false}

local y = 20
for k,_ in pairs(ESPSettings) do
    criarToggle(espContent,k,ESPSettings[k],function(v)
        ESPSettings[k] = v
    end,y)
    y += 45
end

-- (RESTO DO SEU CÓDIGO ESP E HITBOX CONTINUA IGUAL — NÃO FOI ALTERADO)
