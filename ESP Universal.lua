--[[ Universal Hub LMG2L - Silent Aim + ESP ]]--

local LMG2L = {}

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera

-- ScreenGui
LMG2L["ScreenGui"] = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
LMG2L["ScreenGui"].Name = "UniversalHub"
LMG2L["ScreenGui"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- MainFrame
local main = Instance.new("Frame", LMG2L["ScreenGui"])
main.Size = UDim2.new(0.32,0,0.56,0)
main.Position = UDim2.new(0.34,0,0.15,0)
main.BackgroundColor3 = Color3.fromRGB(0,0,0)
main.BorderSizePixel = 0
Instance.new("UICorner", main)

-- Header
local header = Instance.new("Frame", main)
header.Size = UDim2.new(1,0,0.15,0)
header.BackgroundColor3 = Color3.fromRGB(0,0,0)
header.BorderSizePixel = 0
Instance.new("UICorner", header)

-- Header inner frame
local headerInner = Instance.new("Frame", header)
headerInner.Size = UDim2.new(0.96,0,0.77,0)
headerInner.Position = UDim2.new(0.02,0,0.11,0)
headerInner.BackgroundColor3 = Color3.fromRGB(84,84,84)
headerInner.BorderSizePixel = 0
Instance.new("UICorner", headerInner)

-- Title
local title = Instance.new("TextLabel", headerInner)
title.Size = UDim2.new(0.4,0,1,0)
title.Position = UDim2.new(0.01,0,0,0)
title.BackgroundTransparency = 1
title.Text = "Universal Hub"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Font = Enum.Font.DenkOne
title.TextSize = 30
title.TextXAlignment = Enum.TextXAlignment.Left

-- Minimize Button
local toggleBtn = Instance.new("TextButton", header)
toggleBtn.Size = UDim2.new(0.13,0,0.7,0)
toggleBtn.Position = UDim2.new(0.83,0,0.14,0)
toggleBtn.BackgroundColor3 = Color3.fromRGB(255,255,255)
toggleBtn.BackgroundTransparency = 0.8
toggleBtn.TextColor3 = Color3.fromRGB(255,255,255)
toggleBtn.Text = "-"
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextSize = 35
Instance.new("UICorner", toggleBtn)

-- Open button when minimized
local openBtn = Instance.new("TextButton", LMG2L["ScreenGui"])
openBtn.Size = UDim2.new(0,50,0,50)
openBtn.Position = UDim2.new(0,10,0,10)
openBtn.BackgroundColor3 = Color3.fromRGB(0,0,0)
openBtn.TextColor3 = Color3.fromRGB(255,255,255)
openBtn.Text = "+"
openBtn.Visible = false
openBtn.Font = Enum.Font.SourceSansBold
openBtn.TextScaled = true

toggleBtn.MouseButton1Click:Connect(function()
    main.Visible = false
    openBtn.Visible = true
end)
openBtn.MouseButton1Click:Connect(function()
    main.Visible = true
    openBtn.Visible = false
end)

-- Left panel with tabs
local leftFrame = Instance.new("Frame", main)
leftFrame.Size = UDim2.new(0.32,0,0.79,0)
leftFrame.Position = UDim2.new(0.02,0,0.165,0)
leftFrame.BackgroundColor3 = Color3.fromRGB(84,84,84)
leftFrame.BorderSizePixel = 0
Instance.new("UICorner", leftFrame)

-- Tab buttons
local silentBtn = Instance.new("TextButton", leftFrame)
silentBtn.Size = UDim2.new(0.87,0,0.16,0)
silentBtn.Position = UDim2.new(0.07,0,0.03,0)
silentBtn.BackgroundColor3 = Color3.fromRGB(0,0,0)
silentBtn.BackgroundTransparency = 0.8
silentBtn.TextColor3 = Color3.fromRGB(255,255,255)
silentBtn.Text = "Silent Aim"
silentBtn.Font = Enum.Font.DenkOne
silentBtn.TextSize = 30
Instance.new("UICorner", silentBtn)

local espBtn = Instance.new("TextButton", leftFrame)
espBtn.Size = UDim2.new(0.87,0,0.16,0)
espBtn.Position = UDim2.new(0.07,0,0.22,0)
espBtn.BackgroundColor3 = Color3.fromRGB(0,0,0)
espBtn.BackgroundTransparency = 0.8
espBtn.TextColor3 = Color3.fromRGB(255,255,255)
espBtn.Text = "ESP"
espBtn.Font = Enum.Font.DenkOne
espBtn.TextSize = 30
Instance.new("UICorner", espBtn)

-- Right frame to hold tab content
local rightFrame = Instance.new("Frame", main)
rightFrame.Size = UDim2.new(0.61,0,0.79,0)
rightFrame.Position = UDim2.new(0.37,0,0.165,0)
rightFrame.BackgroundColor3 = Color3.fromRGB(84,84,84)
rightFrame.BorderSizePixel = 0
Instance.new("UICorner", rightFrame)

-- Silent Aim Content
local silentContent = Instance.new("Frame", rightFrame)
silentContent.Size = UDim2.new(1,0,1,0)
silentContent.BackgroundTransparency = 1
silentContent.Visible = true

-- ESP Content
local espContent = Instance.new("Frame", rightFrame)
espContent.Size = UDim2.new(1,0,1,0)
espContent.BackgroundTransparency = 1
espContent.Visible = false

-- Tab functionality
silentBtn.MouseButton1Click:Connect(function()
    silentContent.Visible = true
    espContent.Visible = false
end)
espBtn.MouseButton1Click:Connect(function()
    silentContent.Visible = false
    espContent.Visible = true
end)

-- ==================== Silent Aim Elements ====================

local FOV = 100 -- default radius
local active = false
local targetCircle = Instance.new("Frame", LMG2L["ScreenGui"])
targetCircle.Size = UDim2.new(0,FOV,0,FOV)
targetCircle.AnchorPoint = Vector2.new(0.5,0.5)
targetCircle.BackgroundColor3 = Color3.fromRGB(0,170,255)
targetCircle.BackgroundTransparency = 0.7
targetCircle.BorderSizePixel = 2
targetCircle.BorderColor3 = Color3.fromRGB(255,255,255)
targetCircle.Visible = false
targetCircle.ZIndex = 999
Instance.new("UICorner", targetCircle)

-- Toggle Button
local toggleSA = Instance.new("TextButton", silentContent)
toggleSA.Size = UDim2.new(0.6,0,0,35)
toggleSA.Position = UDim2.new(0.2,0,0.05,0)
toggleSA.Text = "Silent Aim: OFF"
toggleSA.Font = Enum.Font.DenkOne
toggleSA.TextSize = 20
toggleSA.TextColor3 = Color3.fromRGB(255,255,255)
toggleSA.BackgroundColor3 = Color3.fromRGB(45,45,45)
Instance.new("UICorner", toggleSA)

toggleSA.MouseButton1Click:Connect(function()
    active = not active
    toggleSA.Text = active and "Silent Aim: ON" or "Silent Aim: OFF"
    targetCircle.Visible = active and targetCircle.Visible or false
end)

-- FOV Slider
local sliderLabel = Instance.new("TextLabel", silentContent)
sliderLabel.Size = UDim2.new(0.6,0,0,20)
sliderLabel.Position = UDim2.new(0.2,0,0.15,0)
sliderLabel.BackgroundTransparency = 1
sliderLabel.TextColor3 = Color3.fromRGB(255,255,255)
sliderLabel.Text = "FOV: "..FOV
sliderLabel.Font = Enum.Font.DenkOne
sliderLabel.TextSize = 18

local slider = Instance.new("TextButton", silentContent)
slider.Size = UDim2.new(0.6,0,0,20)
slider.Position = UDim2.new(0.2,0,0.2,0)
slider.BackgroundColor3 = Color3.fromRGB(0,170,255)
slider.Text = ""
Instance.new("UICorner", slider)

local dragging = false
slider.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
    end
end)
slider.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)
RunService.RenderStepped:Connect(function()
    if dragging then
        local mouse = UserInputService:GetMouseLocation()
        local rel = math.clamp(mouse.X - slider.AbsolutePosition.X, 0, slider.AbsoluteSize.X)
        FOV = math.floor((rel/slider.AbsoluteSize.X)*300) -- max 300 px
        targetCircle.Size = UDim2.new(0,FOV,0,FOV)
        sliderLabel.Text = "FOV: "..FOV
    end
end)

-- Click detection
UserInputService.InputBegan:Connect(function(input,gameProcessed)
    if active and input.UserInputType == Enum.UserInputType.MouseButton1 then
        local mousePos = input.Position
        if mousePos.X >= Camera.ViewportSize.X/2 then -- right half of screen
            targetCircle.Position = UDim2.new(0,mousePos.X,0,mousePos.Y)
            targetCircle.Visible = true

            -- Detect players inside circle
            local closestPlayer = nil
            local shortestDist = math.huge
            for _,player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    local screenPos, onScreen = Camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position)
                    if onScreen then
                        local dist = (Vector2.new(screenPos.X,screenPos.Y) - Vector2.new(mousePos.X,mousePos.Y)).Magnitude
                        if dist <= FOV/2 and dist < shortestDist then
                            closestPlayer = player
                            shortestDist = dist
                        end
                    end
                end
            end

            if closestPlayer then
                print("Alvo detectado dentro do clique:", closestPlayer.Name)
                -- Aqui você pode chamar a função do seu tiro e passar closestPlayer
            end
        end
    end
end)
