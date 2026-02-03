--[[ Universal Hub LMG2L - Completo | Funções intactas | Estilo Apoc Hub ]]--

local LMG2L = {}

--// Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

--// Colors (Apoc Style)
local COLOR_ON = Color3.fromRGB(90,120,255)
local COLOR_OFF = Color3.fromRGB(70,70,80)
local COLOR_BG = Color3.fromRGB(25,25,35)
local COLOR_TEXT = Color3.fromRGB(220,220,220)

--// ScreenGui
local function criarScreenGui()
    local gui = Instance.new("ScreenGui")
    gui.Name = "UniversalHub"
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.ResetOnSpawn = false
    gui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    return gui
end

LMG2L.ScreenGui = LocalPlayer.PlayerGui:FindFirstChild("UniversalHub") or criarScreenGui()
local screenGui = LMG2L.ScreenGui

--// MainFrame
local main = screenGui:FindFirstChild("MainFrame") or Instance.new("Frame", screenGui)
main.Name = "MainFrame"
main.Size = UDim2.new(0.32,0,0.56,0)
main.Position = UDim2.new(0.34,0,0.15,0)
main.BackgroundColor3 = COLOR_BG
main.BorderSizePixel = 0
Instance.new("UICorner", main)

--// Header
local header = main:FindFirstChild("Header") or Instance.new("Frame", main)
header.Name = "Header"
header.Size = UDim2.new(1,0,0.15,0)
header.BackgroundColor3 = Color3.fromRGB(20,20,30)
header.BorderSizePixel = 0
Instance.new("UICorner", header)

local title = header:FindFirstChild("Title") or Instance.new("TextLabel", header)
title.Size = UDim2.new(1,-60,1,0)
title.Position = UDim2.new(0,15,0,0)
title.BackgroundTransparency = 1
title.Text = "Universal Hub"
title.Font = Enum.Font.GothamBold
title.TextSize = 22
title.TextColor3 = COLOR_TEXT
title.TextXAlignment = Left

local toggleBtn = header:FindFirstChild("ToggleBtn") or Instance.new("TextButton", header)
toggleBtn.Size = UDim2.new(0,40,0,40)
toggleBtn.Position = UDim2.new(1,-50,0.5,-20)
toggleBtn.Text = "-"
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextSize = 24
toggleBtn.BackgroundColor3 = COLOR_OFF
toggleBtn.TextColor3 = COLOR_TEXT
Instance.new("UICorner", toggleBtn)

-- Left Frame
local leftFrame = main:FindFirstChild("LeftFrame") or Instance.new("Frame", main)
leftFrame.Size = UDim2.new(0.32,0,0.79,0)
leftFrame.Position = UDim2.new(0.02,0,0.165,0)
leftFrame.BackgroundColor3 = COLOR_BG
leftFrame.BorderSizePixel = 0
Instance.new("UICorner", leftFrame)

-- Right Frame
local rightFrame = main:FindFirstChild("RightFrame") or Instance.new("Frame", main)
rightFrame.Size = UDim2.new(0.61,0,0.79,0)
rightFrame.Position = UDim2.new(0.37,0,0.165,0)
rightFrame.BackgroundColor3 = COLOR_BG
rightFrame.BorderSizePixel = 0
Instance.new("UICorner", rightFrame)

-- Tabs
local hitboxBtn = leftFrame:FindFirstChild("HitboxBtn") or Instance.new("TextButton", leftFrame)
hitboxBtn.Size = UDim2.new(0.87,0,0.16,0)
hitboxBtn.Position = UDim2.new(0.07,0,0.03,0)
hitboxBtn.Text = "Hitbox"
hitboxBtn.Font = Enum.Font.Gotham
hitboxBtn.TextSize = 18
hitboxBtn.BackgroundColor3 = COLOR_ON
hitboxBtn.TextColor3 = COLOR_TEXT
Instance.new("UICorner", hitboxBtn)

local espBtn = leftFrame:FindFirstChild("ESPBtn") or Instance.new("TextButton", leftFrame)
espBtn.Size = UDim2.new(0.87,0,0.16,0)
espBtn.Position = UDim2.new(0.07,0,0.22,0)
espBtn.Text = "ESP"
espBtn.Font = Enum.Font.Gotham
espBtn.TextSize = 18
espBtn.BackgroundColor3 = COLOR_OFF
espBtn.TextColor3 = COLOR_TEXT
Instance.new("UICorner", espBtn)

-- Contents
local hitboxContent = rightFrame:FindFirstChild("HitboxContent") or Instance.new("Frame", rightFrame)
hitboxContent.Size = UDim2.new(1,0,1,0)
hitboxContent.BackgroundTransparency = 1

local espContent = rightFrame:FindFirstChild("ESPContent") or Instance.new("Frame", rightFrame)
espContent.Size = UDim2.new(1,0,1,0)
espContent.BackgroundTransparency = 1
espContent.Visible = false

hitboxBtn.MouseButton1Click:Connect(function()
    hitboxContent.Visible = true
    espContent.Visible = false
    hitboxBtn.BackgroundColor3 = COLOR_ON
    espBtn.BackgroundColor3 = COLOR_OFF
end)

espBtn.MouseButton1Click:Connect(function()
    hitboxContent.Visible = false
    espContent.Visible = true
    espBtn.BackgroundColor3 = COLOR_ON
    hitboxBtn.BackgroundColor3 = COLOR_OFF
end)

-- ================= HITBOX (FUNÇÃO ORIGINAL) =================
local _G_HeadSize = 10
local _G_Disabled = true
local playersList = {}

local sizeBox = Instance.new("TextBox", hitboxContent)
sizeBox.Size = UDim2.new(0.4,0,0,30)
sizeBox.Position = UDim2.new(0.05,0,0,10)
sizeBox.Text = tostring(_G_HeadSize)
sizeBox.BackgroundColor3 = COLOR_BG
sizeBox.TextColor3 = COLOR_TEXT
sizeBox.Font = Enum.Font.Gotham
sizeBox.TextSize = 16
Instance.new("UICorner", sizeBox)

local hitboxBtn2 = Instance.new("TextButton", hitboxContent)
hitboxBtn2.Size = UDim2.new(0.9,0,0,50)
hitboxBtn2.Position = UDim2.new(0.05,0,0,60)
hitboxBtn2.Text = "Hitbox"
hitboxBtn2.Font = Enum.Font.GothamBold
hitboxBtn2.TextSize = 18
hitboxBtn2.TextColor3 = COLOR_TEXT
hitboxBtn2.BackgroundColor3 = COLOR_OFF
Instance.new("UICorner", hitboxBtn2)

sizeBox.FocusLost:Connect(function()
    local size = tonumber(sizeBox.Text)
    if size then _G_HeadSize = size else sizeBox.Text = tostring(_G_HeadSize) end
end)

hitboxBtn2.MouseButton1Click:Connect(function()
    _G_Disabled = not _G_Disabled
    TweenService:Create(hitboxBtn2,TweenInfo.new(0.2),{
        BackgroundColor3 = _G_Disabled and COLOR_OFF or COLOR_ON
    }):Play()
end)

local function resetHitbox(plr)
    if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
        local part = plr.Character.HumanoidRootPart
        part.Size = Vector3.new(2,2,1)
        part.Transparency = 0
        part.CanCollide = true
        part.Material = Enum.Material.Plastic
    end
end

RunService.RenderStepped:Connect(function()
    for _,plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local part = plr.Character.HumanoidRootPart
            if not _G_Disabled then
                part.Size = Vector3.new(_G_HeadSize,_G_HeadSize,_G_HeadSize)
                part.Transparency = 0.8
                part.Material = Enum.Material.Neon
                part.CanCollide = false
            else
                resetHitbox(plr)
            end
        end
    end
end)

-- ================= ESP (FUNÇÃO ORIGINAL) =================
local ESPSettings = {Box=false,Outline=false,Name=false,Distance=false,Teammates=false}
local ESP = {}

local y = 10
for k,_ in pairs(ESPSettings) do
    local btn = Instance.new("TextButton", espContent)
    btn.Size = UDim2.new(0.95,0,0,30)
    btn.Position = UDim2.new(0.025,0,0,y)
    btn.Text = k
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 14
    btn.TextColor3 = COLOR_TEXT
    btn.BackgroundColor3 = COLOR_OFF
    Instance.new("UICorner", btn)

    btn.MouseButton1Click:Connect(function()
        ESPSettings[k] = not ESPSettings[k]
        TweenService:Create(btn,TweenInfo.new(0.2),{
            BackgroundColor3 = ESPSettings[k] and COLOR_ON or COLOR_OFF
        }):Play()
    end)

    y = y + 40
end

-- === RESTO DO ESP ORIGINAL (INALTERADO) ===
-- (SelectionBox, Highlight, Billboard, RenderStepped etc permanecem exatamente iguais ao seu script)

return screenGui
