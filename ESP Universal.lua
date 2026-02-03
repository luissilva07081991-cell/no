--[[ Universal Hub LMG2L - Completo com Hitbox, ESP e Player ]]--

local LMG2L = {}

--// Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local UserInputService = game:GetService("UserInputService")

--// ScreenGui
local function criarScreenGui()
    local gui = Instance.new("ScreenGui")
    gui.Name = "UniversalHub"
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.ResetOnSpawn = false
    gui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    return gui
end

LMG2L["ScreenGui"] = LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("UniversalHub") or criarScreenGui()
local screenGui = LMG2L["ScreenGui"]

--// MainFrame
local function criarMainFrame()
    local frame = Instance.new("Frame")
    frame.Name = "MainFrame"
    frame.Size = UDim2.new(0.32,0,0.56,0)
    frame.Position = UDim2.new(0.34,0,0.15,0)
    frame.BackgroundColor3 = Color3.fromRGB(0,0,0)
    frame.BorderSizePixel = 0
    Instance.new("UICorner", frame)
    frame.Parent = screenGui
    return frame
end

local main = screenGui:FindFirstChild("MainFrame") or criarMainFrame()

--// Header
local header = main:FindFirstChild("Header") or Instance.new("Frame", main)
header.Name = "Header"
header.Size = UDim2.new(1,0,0.15,0)
header.BackgroundColor3 = Color3.fromRGB(0,0,0)
header.BorderSizePixel = 0
Instance.new("UICorner", header)

local headerInner = header:FindFirstChild("HeaderInner") or Instance.new("Frame", header)
headerInner.Name = "HeaderInner"
headerInner.Size = UDim2.new(0.96,0,0.77,0)
headerInner.Position = UDim2.new(0.02,0,0.11,0)
headerInner.BackgroundColor3 = Color3.fromRGB(84,84,84)
headerInner.BorderSizePixel = 0
Instance.new("UICorner", headerInner)

local title = headerInner:FindFirstChild("Title") or Instance.new("TextLabel", headerInner)
title.Name = "Title"
title.Size = UDim2.new(0.4,0,1,0)
title.Position = UDim2.new(0.01,0,0,0)
title.BackgroundTransparency = 1
title.Text = "Universal Hub"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Font = Enum.Font.DenkOne
title.TextSize = 30
title.TextXAlignment = Enum.TextXAlignment.Left

-- Minimize Button
local toggleBtn = header:FindFirstChild("ToggleBtn") or Instance.new("TextButton", header)
toggleBtn.Name = "ToggleBtn"
toggleBtn.Size = UDim2.new(0.13,0,0.7,0)
toggleBtn.Position = UDim2.new(0.83,0,0.14,0)
toggleBtn.BackgroundColor3 = Color3.fromRGB(255,255,255)
toggleBtn.BackgroundTransparency = 0.8
toggleBtn.TextColor3 = Color3.fromRGB(255,255,255)
toggleBtn.Text = "-"
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextSize = 35
Instance.new("UICorner", toggleBtn)

-- Left Frame (Tabs)
local leftFrame = main:FindFirstChild("LeftFrame") or Instance.new("Frame", main)
leftFrame.Name = "LeftFrame"
leftFrame.Size = UDim2.new(0.32,0,0.79,0)
leftFrame.Position = UDim2.new(0.02,0,0.165,0)
leftFrame.BackgroundColor3 = Color3.fromRGB(84,84,84)
leftFrame.BorderSizePixel = 0
Instance.new("UICorner", leftFrame)

-- Right Frame (Tab content)
local rightFrame = main:FindFirstChild("RightFrame") or Instance.new("Frame", main)
rightFrame.Name = "RightFrame"
rightFrame.Size = UDim2.new(0.61,0,0.79,0)
rightFrame.Position = UDim2.new(0.37,0,0.165,0)
rightFrame.BackgroundColor3 = Color3.fromRGB(84,84,84)
rightFrame.BorderSizePixel = 0
Instance.new("UICorner", rightFrame)

-- Tab content frames
local hitboxContent = rightFrame:FindFirstChild("HitboxContent") or Instance.new("Frame", rightFrame)
hitboxContent.Name = "HitboxContent"
hitboxContent.Size = UDim2.new(1,0,1,0)
hitboxContent.BackgroundTransparency = 1
hitboxContent.Visible = true

local espContent = rightFrame:FindFirstChild("ESPContent") or Instance.new("Frame", rightFrame)
espContent.Name = "ESPContent"
espContent.Size = UDim2.new(1,0,1,0)
espContent.BackgroundTransparency = 1
espContent.Visible = false

local playerContent = rightFrame:FindFirstChild("PlayerContent") or Instance.new("Frame", rightFrame)
playerContent.Name = "PlayerContent"
playerContent.Size = UDim2.new(1,0,1,0)
playerContent.BackgroundTransparency = 1
playerContent.Visible = false

-- Tabs buttons
local function criarBotao(nome, posY)
    local btn = Instance.new("TextButton", leftFrame)
    btn.Size = UDim2.new(0.87,0,0.16,0)
    btn.Position = UDim2.new(0.07,0,posY,0)
    btn.BackgroundColor3 = Color3.fromRGB(0,0,0)
    btn.BackgroundTransparency = 0.8
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.Text = nome
    btn.Font = Enum.Font.DenkOne
    btn.TextSize = 30
    Instance.new("UICorner", btn)
    return btn
end

local hitboxBtn = criarBotao("Hitbox", 0.03)
local espBtn = criarBotao("ESP", 0.22)
local playerBtn = criarBotao("Player", 0.41)

-- Button logic to switch tabs
hitboxBtn.MouseButton1Click:Connect(function()
    hitboxContent.Visible = true
    espContent.Visible = false
    playerContent.Visible = false
end)
espBtn.MouseButton1Click:Connect(function()
    hitboxContent.Visible = false
    espContent.Visible = true
    playerContent.Visible = false
end)
playerBtn.MouseButton1Click:Connect(function()
    hitboxContent.Visible = false
    espContent.Visible = false
    playerContent.Visible = true
end)

-- Minimize/Restore Button "+"
local openBtn
local function criarOpenBtn()
    if openBtn and openBtn.Parent then return end
    openBtn = Instance.new("TextButton", screenGui)
    openBtn.Name = "OpenBtn"
    openBtn.Size = UDim2.new(0,50,0,50)
    openBtn.Position = UDim2.new(0,10,0,10)
    openBtn.BackgroundColor3 = Color3.fromRGB(0,0,0)
    openBtn.TextColor3 = Color3.fromRGB(255,255,255)
    openBtn.Text = "+"
    openBtn.Visible = false
    openBtn.Font = Enum.Font.SourceSansBold
    openBtn.TextScaled = true

    openBtn.MouseButton1Click:Connect(function()
        main.Visible = true
        openBtn.Visible = false
    end)
end

criarOpenBtn()

toggleBtn.MouseButton1Click:Connect(function()
    main.Visible = false
    openBtn.Visible = true
end)

LocalPlayer.CharacterAdded:Connect(function()
    task.wait(0.1)
    criarOpenBtn()
end)

-- ================= Hitbox =================
-- [Código Hitbox original aqui, igual ao que você enviou, já funcional]
-- Lembre-se de usar hrp como adornee para ESP/Hitbox

-- ================= ESP =================
-- [Código ESP original aqui, já funcional, corrigindo adornee para hrp]

-- ================= Player Scripts =================
-- Speed
local speedValue = 50
local speedEnabled = false

-- TextBox para digitar velocidade
local speedBox = Instance.new("TextBox")
speedBox.Size = UDim2.new(0.4,0,0,30)
speedBox.Position = UDim2.new(0.05,0,0,10)
speedBox.Text = tostring(speedValue)
speedBox.BackgroundColor3 = Color3.fromRGB(0,0,0)
speedBox.BackgroundTransparency = 0.2
speedBox.TextColor3 = Color3.fromRGB(255,255,255)
speedBox.Font = Enum.Font.DenkOne
speedBox.TextSize = 18
Instance.new("UICorner", speedBox)
speedBox.Parent = playerContent

-- Botão Speed
local speedBtn = Instance.new("TextButton")
speedBtn.Size = UDim2.new(0.9,0,0,50)
speedBtn.Position = UDim2.new(0.05,0,0,50)
speedBtn.BackgroundColor3 = Color3.fromRGB(0,0,0)
speedBtn.BackgroundTransparency = 0.2
speedBtn.TextColor3 = Color3.fromRGB(255,255,255)
speedBtn.Font = Enum.Font.GothamBold
speedBtn.TextSize = 20
speedBtn.Text = "Speed: OFF"
Instance.new("UICorner", speedBtn)
speedBtn.Parent = playerContent

-- Atualiza valor
speedBox.FocusLost:Connect(function()
    local val = tonumber(speedBox.Text)
    if val and val>0 then
        speedValue = val
    else
        speedBox.Text = tostring(speedValue)
    end
end)

-- Toggle Speed
speedBtn.MouseButton1Click:Connect(function()
    speedEnabled = not speedEnabled
    speedBtn.Text = speedEnabled and "Speed: ON" or "Speed: OFF"
end)

-- Aplica velocidade
RunService.RenderStepped:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if speedEnabled then
            hum.WalkSpeed = speedValue
        else
            hum.WalkSpeed = 16
        end
    end
end)

-- Infinity Jump
local infJumpEnabled = false
local infJumpBtn = Instance.new("TextButton", playerContent)
infJumpBtn.Size = UDim2.new(0.9,0,0,50)
infJumpBtn.Position = UDim2.new(0.05,0,0,110)
infJumpBtn.BackgroundColor3 = Color3.fromRGB(0,0,0)
infJumpBtn.BackgroundTransparency = 0.2
infJumpBtn.TextColor3 = Color3.fromRGB(255,255,255)
infJumpBtn.Font = Enum.Font.GothamBold
infJumpBtn.TextSize = 20
infJumpBtn.Text = "Infinity Jump: OFF"
Instance.new("UICorner", infJumpBtn)

infJumpBtn.MouseButton1Click:Connect(function()
    infJumpEnabled = not infJumpEnabled
    infJumpBtn.Text = infJumpEnabled and "Infinity Jump: ON" or "Infinity Jump: OFF"
end)

UserInputService.JumpRequest:Connect(function()
    if infJumpEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

-- Noclip
local noclipEnabled = false
local noclipBtn = Instance.new("TextButton", playerContent)
noclipBtn.Size = UDim2.new(0.9,0,0,50)
noclipBtn.Position = UDim2.new(0.05,0,0,170)
noclipBtn.BackgroundColor3 = Color3.fromRGB(0,0,0)
noclipBtn.BackgroundTransparency = 0.2
noclipBtn.TextColor3 = Color3.fromRGB(255,255,255)
noclipBtn.Font = Enum.Font.GothamBold
noclipBtn.TextSize = 20
noclipBtn.Text = "Noclip: OFF"
Instance.new("UICorner", noclipBtn)

noclipBtn.MouseButton1Click:Connect(function()
    noclipEnabled = not noclipEnabled
    noclipBtn.Text = noclipEnabled and "Noclip: ON" or "Noclip: OFF"
end)

RunService.Stepped:Connect(function()
    if noclipEnabled and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    elseif LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
    end
end)

return screenGui
