--[[ Universal Hub LMG2L - Completo com ESP e Hitbox original integrado ]]--

local LMG2L = {}

--// Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

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

-- Tabs buttons
local hitboxBtn = leftFrame:FindFirstChild("HitboxBtn") or Instance.new("TextButton", leftFrame)
hitboxBtn.Name = "HitboxBtn"
hitboxBtn.Size = UDim2.new(0.87,0,0.16,0)
hitboxBtn.Position = UDim2.new(0.07,0,0.03,0)
hitboxBtn.BackgroundColor3 = Color3.fromRGB(0,0,0)
hitboxBtn.BackgroundTransparency = 0.8
hitboxBtn.TextColor3 = Color3.fromRGB(255,255,255)
hitboxBtn.Text = "Hitbox"
hitboxBtn.Font = Enum.Font.DenkOne
hitboxBtn.TextSize = 30
Instance.new("UICorner", hitboxBtn)

local espBtn = leftFrame:FindFirstChild("ESPBtn") or Instance.new("TextButton", leftFrame)
espBtn.Name = "ESPBtn"
espBtn.Size = UDim2.new(0.87,0,0.16,0)
espBtn.Position = UDim2.new(0.07,0,0.22,0)
espBtn.BackgroundColor3 = Color3.fromRGB(0,0,0)
espBtn.BackgroundTransparency = 0.8
espBtn.TextColor3 = Color3.fromRGB(255,255,255)
espBtn.Text = "ESP"
espBtn.Font = Enum.Font.DenkOne
espBtn.TextSize = 30
Instance.new("UICorner", espBtn)

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

-- Button logic to switch tabs
hitboxBtn.MouseButton1Click:Connect(function()
    hitboxContent.Visible = true
    espContent.Visible = false
end)
espBtn.MouseButton1Click:Connect(function()
    hitboxContent.Visible = false
    espContent.Visible = true
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

-- ================= Hitbox Original Integrado =================
local _G_HeadSize = 10
local _G_Disabled = true
local playersList = {}

-- TextBox de tamanho
local sizeBox = Instance.new("TextBox")
sizeBox.Size = UDim2.new(0.4,0,0,30)
sizeBox.Position = UDim2.new(0.05,0,0,10)
sizeBox.Text = tostring(_G_HeadSize)
sizeBox.BackgroundColor3 = Color3.fromRGB(0,0,0)
sizeBox.BackgroundTransparency = 0.2
sizeBox.TextColor3 = Color3.fromRGB(255,255,255)
sizeBox.Font = Enum.Font.DenkOne
sizeBox.TextSize = 18
Instance.new("UICorner", sizeBox)
sizeBox.Parent = hitboxContent

-- Botão profissional Hitbox
local hitboxBtn2 = Instance.new("TextButton")
hitboxBtn2.Size = UDim2.new(0.9,0,0,50)
hitboxBtn2.Position = UDim2.new(0.05,0,0,60)
hitboxBtn2.BackgroundColor3 = Color3.fromRGB(0,0,0)
hitboxBtn2.BackgroundTransparency = 0.2
hitboxBtn2.TextColor3 = Color3.fromRGB(255,255,255)
hitboxBtn2.Font = Enum.Font.GothamBold
hitboxBtn2.TextSize = 20
hitboxBtn2.Text = "Enable Hitbox"
Instance.new("UICorner", hitboxBtn2)
hitboxBtn2.Parent = hitboxContent

-- Hover effect
local uigrad = Instance.new("UIGradient")
uigrad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(84,84,84)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0,0,0))
}
uigrad.Rotation = 45
uigrad.Parent = hitboxBtn2

hitboxBtn2.MouseEnter:Connect(function() hitboxBtn2.BackgroundTransparency = 0 end)
hitboxBtn2.MouseLeave:Connect(function() hitboxBtn2.BackgroundTransparency = 0.2 end)

-- Atualiza tamanho
sizeBox.FocusLost:Connect(function()
    local size = tonumber(sizeBox.Text)
    if size then
        _G_HeadSize = size
    else
        sizeBox.Text = tostring(_G_HeadSize)
    end
end)

-- Toggle Hitbox
hitboxBtn2.MouseButton1Click:Connect(function()
    _G_Disabled = not _G_Disabled
    hitboxBtn2.Text = _G_Disabled and "Enable Hitbox" or "Disable Hitbox"
end)

-- Função reset hitbox
local function resetHitbox(plr)
    if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
        local part = plr.Character.HumanoidRootPart
        part.Size = Vector3.new(2,2,1)
        part.Transparency = 0
        part.BrickColor = BrickColor.new("Medium stone grey")
        part.Material = Enum.Material.Plastic
        part.CanCollide = true
    end
end

-- Aplica hitbox
RunService.RenderStepped:Connect(function()
    playersList = {}
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            table.insert(playersList, plr)
        end
    end

    for _, plr in ipairs(playersList) do
        local part = plr.Character.HumanoidRootPart
        if not _G_Disabled then
            part.Size = Vector3.new(_G_HeadSize,_G_HeadSize,_G_HeadSize)
            part.Transparency = 0.8
            part.BrickColor = BrickColor.new("Really blue")
            part.Material = Enum.Material.Neon
            part.CanCollide = false
        else
            resetHitbox(plr)
        end
    end
end)

-- ================= ESP =================
-- (Seu ESP original aqui)

return screenGui
