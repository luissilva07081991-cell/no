--[[ Universal Hub LMG2L - Completo e funcional (ESP Really Blue + Hitbox) ]]--

local LMG2L = {}

--// Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

--// ScreenGui
LMG2L["ScreenGui"] = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
LMG2L["ScreenGui"].Name = "UniversalHub"
LMG2L["ScreenGui"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling

--// MainFrame
LMG2L["MainFrame"] = Instance.new("Frame", LMG2L["ScreenGui"])
local main = LMG2L["MainFrame"]
main.Size = UDim2.new(0.32,0,0.56,0)
main.Position = UDim2.new(0.34,0,0.15,0)
main.BackgroundColor3 = Color3.fromRGB(0,0,0)
main.BorderSizePixel = 0
Instance.new("UICorner", main)

--// Header
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

-- Button container (left)
local leftFrame = Instance.new("Frame", main)
leftFrame.Size = UDim2.new(0.32,0,0.79,0)
leftFrame.Position = UDim2.new(0.02,0,0.165,0)
leftFrame.BackgroundColor3 = Color3.fromRGB(84,84,84)
leftFrame.BorderSizePixel = 0
Instance.new("UICorner", leftFrame)

-- Tabs buttons
local hitboxBtn = Instance.new("TextButton", leftFrame)
hitboxBtn.Size = UDim2.new(0.87,0,0.16,0)
hitboxBtn.Position = UDim2.new(0.07,0,0.03,0)
hitboxBtn.BackgroundColor3 = Color3.fromRGB(0,0,0)
hitboxBtn.BackgroundTransparency = 0.8
hitboxBtn.TextColor3 = Color3.fromRGB(255,255,255)
hitboxBtn.Text = "Hitbox"
hitboxBtn.Font = Enum.Font.DenkOne
hitboxBtn.TextSize = 30
Instance.new("UICorner", hitboxBtn)

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

-- Tabs content frame (right)
local rightFrame = Instance.new("Frame", main)
rightFrame.Size = UDim2.new(0.61,0,0.79,0)
rightFrame.Position = UDim2.new(0.37,0,0.165,0)
rightFrame.BackgroundColor3 = Color3.fromRGB(84,84,84)
rightFrame.BorderSizePixel = 0
Instance.new("UICorner", rightFrame)

-- ================== Aba Hitbox ==================
local hitboxContent = Instance.new("Frame", rightFrame)
hitboxContent.Size = UDim2.new(1,0,1,0)
hitboxContent.BackgroundTransparency = 1
hitboxContent.Visible = true

-- ================== Script ofuscado dentro da aba Hitbox ==================
do
    local v0=game:GetService("Players")
    local v1=game:GetService("RunService")
    local v2=v0.LocalPlayer
    local v3=game:GetService("TweenService")
    local v4=Instance.new("ScreenGui")
    local v5=Instance.new("Frame")
    local v6=Instance.new("UICorner")
    local v7=Instance.new("TextBox")
    local v8=Instance.new("UICorner")
    local v9=Instance.new("TextButton")
    local v10=Instance.new("UICorner")
    local v11=Instance.new("TextButton")
    local v12=Instance.new("UICorner")
    local v13=false
    v4.Parent=hitboxContent -- << apenas alterado para ficar dentro da aba Hitbox
    v5.Parent=v4
    v7.Parent=v5
    v9.Parent=v5
    v11.Parent=v5
    v6.Parent=v5
    v8.Parent=v7
    v10.Parent=v9
    v12.Parent=v11
    -- (restante do script ofuscado exatamente como você enviou)
    v5.Size=UDim2.new(1637 -(1523 + 114) ,144 + 16 ,0 -0 ,110)
    v5.Position=UDim2.new(0.5, -80,0.5, -(1120 -(68 + 997)))
    v5.BackgroundColor3=Color3.fromRGB(1320 -(226 + 1044) ,217 -167 ,167 -(32 + 85) )
    v5.BorderSizePixel=0 + 0 
    v5.Active=true
    v5.Draggable=true
    v5.ClipsDescendants=true
    v5.BackgroundTransparency=0.2
    v5.Visible=true
    v6.CornerRadius=UDim.new(0,3 + 7 )
    v11.Size=UDim2.new(1117 -(892 + 65) ,20)
    v11.Position=UDim2.new(0,0,0,0)
    v11.Text="▼"
    v11.BackgroundColor3=Color3.fromRGB(430 -(87 + 263) ,260 -(67 + 113) ,59 + 21 )
    v11.TextColor3=Color3.fromRGB(255,626 -371 ,188 + 67 )
    v12.CornerRadius=UDim.new(0,10)
    v7.Size=UDim2.new(952 -(802 + 150) ,376 -236 ,0 -0 ,19 + 6 )
    v7.Position=UDim2.new(997 -(915 + 82) ,10,0 -0 ,15 + 10 )
    v7.Text="10"
    v7.BackgroundColor3=Color3.fromRGB(92 -22 ,1257 -(1069 + 118) ,70)
    v7.TextColor3=Color3.fromRGB(578 -323 ,557 -302 ,45 + 210 )
    v8.CornerRadius=UDim.new(0,10)
    v9.Size=UDim2.new(791 -(368 + 423) ,439 -299 ,18 -(10 + 8) ,96 -71 )
    v9.Position=UDim2.new(442 -(416 + 26) ,31 -21 ,0,96 -41 )
    v9.Text="Enable Hitbox"
    v9.BackgroundColor3=Color3.fromRGB(528 -(145 + 293) ,520 -(44 + 386) ,90)
    v9.TextColor3=Color3.fromRGB(255,1741 -(998 + 488) ,82 + 173 )
    v10.CornerRadius=UDim.new(0,782 -(201 + 571) )
    _G.HeadSize=tonumber(v7.Text) or (1148 -(116 + 1022))
    _G.Disabled=true
    local v52={}
    local function v53() 
        v52={}
        for _,v67 in ipairs(v0:GetPlayers()) do
            if v67~=v2 and v67.Character and v67.Character:FindFirstChild("HumanoidRootPart") then
                table.insert(v52,v67)
            end
        end
    end
    v7.FocusLost:Connect(function()
        local v56=tonumber(v7.Text)
        if v56 then _G.HeadSize=v56 else v7.Text=tostring(_G.HeadSize) end
    end)
    v9.MouseButton1Click:Connect(function()
        _G.Disabled = not _G.Disabled
        v9.Text = (_G.Disabled and "Enable Hitbox") or "Disable Hitbox"
    end)
    v11.MouseButton1Click:Connect(function()
        v13 = not v13
        v11.Text = (v13 and "▲") or "▼"
    end)
    v1.RenderStepped:Connect(function()
        if not _G.Disabled then
            for _,v65 in ipairs(v52) do
                if v65.Character and v65.Character:FindFirstChild("HumanoidRootPart") then
                    local v70=v65.Character.HumanoidRootPart
                    v70.Size=Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
                    v70.Transparency=0
                    v70.BrickColor=BrickColor.new("Really blue")
                    v70.Material=Enum.Material.Neon
                    v70.CanCollide=false
                end
            end
        end
    end)
    while true do
        v53()
        wait(1)
    end
end

-- ================== Aba ESP ==================
local espContent = Instance.new("Frame", rightFrame)
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

-- ================= Minimize/Restore =================
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

-- ================= ESP Settings inside the ESP tab =================
local ESPSettings = {Box=false,Outline=false,Name=false,Distance=false,Teammates=false}
local ESPElements = {}

-- Function to create toggles in ESP tab
local function createESPUI(parent)
    local y = 10
    for k,v in pairs({"Box","Outline","Name","Distance","Teammates"}) do
        local btn = Instance.new("TextButton", parent)
        btn.Size = UDim2.new(0.95,0,0,30)
        btn.Position = UDim2.new(0.025,0,0, y)
        btn.BackgroundColor3 = Color3.fromRGB(0,0,0)
        btn.BackgroundTransparency = 0.5
        btn.TextColor3 = Color3.fromRGB(255,255,255)
        btn.Font = Enum.Font.DenkOne
        btn.TextSize = 14
        btn.Text = v.." OFF"
        Instance.new("UICorner", btn)
        btn.MouseButton1Click:Connect(function()
            ESPSettings[v] = not ESPSettings[v]
            btn.Text = v.." "..(ESPSettings[v] and "ON" or "OFF")
        end)
        table.insert(ESPElements, btn)
        y = y + 40
    end
end

createESPUI(espContent)

-- ================= ESP Logic =================
local ESP = {}
local function shouldESP(p)
    if p==LocalPlayer then return false end
    if not ESPSettings.Teammates then
        if LocalPlayer.Team and p.Team and LocalPlayer.Team==p.Team then return false end
    end
    return true
end

--// Really Blue ESP
local function getColor(p)
    return Color3.fromRGB(0,0,255) -- Really Blue
end

local function setupESP(p)
    if ESP[p] then return end
    local box = Instance.new("SelectionBox")
    box.LineThickness = 0.05
    box.SurfaceTransparency = 1
    box.Parent = workspace

    local hl = Instance.new("Highlight")
    hl.FillTransparency = 1
    hl.Parent = workspace

    local bb = Instance.new("BillboardGui")
    bb.Size = UDim2.new(0,200,0,40)
    bb.StudsOffset = Vector3.new(0,3,0)
    bb.AlwaysOnTop = true
    bb.Parent = workspace

    local txt = Instance.new("TextLabel", bb)
    txt.Size = UDim2.new(1,0,1,0)
    txt.BackgroundTransparency = 1
    txt.Font = Enum.Font.Gotham
    txt.TextSize = 13

    ESP[p] = {Box=box,HL=hl,BB=bb,TXT=txt}
end

for _,p in pairs(Players:GetPlayers()) do
    if p~=LocalPlayer then setupESP(p) end
end
Players.PlayerAdded:Connect(setupESP)
Players.PlayerRemoving:Connect(function(p)
    if ESP[p] then for _,v in pairs(ESP[p]) do v:Destroy() end ESP[p]=nil end
end)

RunService.RenderStepped:Connect(function()
    for p,e in pairs(ESP) do
        local c = p.Character
        local hrp = c and c:FindFirstChild("HumanoidRootPart")
        local hum = c and c:FindFirstChildOfClass("Humanoid")
        local isVisible = hum and hum.Health>0 and hrp and c and shouldESP(p)
        if isVisible then
            local col = getColor(p)
            e.Box.Color3 = col
            e.HL.OutlineColor = col
            e.TXT.TextColor3 = col

            e.Box.Visible = ESPSettings.Box
            e.Box.Adornee = ESPSettings.Box and c or nil

            e.HL.Enabled = ESPSettings.Outline
            e.HL.Adornee = ESPSettings.Outline and c or nil

            local showBB = ESPSettings.Name or ESPSettings.Distance
            e.BB.Enabled = showBB
            e.BB.Adornee = showBB and hrp or nil

            if showBB then
                local t = ""
                if ESPSettings.Name then t=p.Name end
                if ESPSettings.Distance then
                    local dist = math.floor((Camera.CFrame.Position-hrp.Position).Magnitude)
                    if ESPSettings.Name then t=t.." ["..dist.." studs]" else t=dist.." studs" end
                end
                e.TXT.Text = t
            end
        else
            e.Box.Visible=false
            e.Box.Adornee=nil
            e.HL.Enabled=false
            e.HL.Adornee=nil
            e.BB.Enabled=false
            e.BB.Adornee=nil
        end
    end
end)

return LMG2L["ScreenGui"], require
