--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    @uniquadev
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER 

designed using localmaze gui creator
]=]

local LMG2L = {};

-- ScreenGui
LMG2L["ScreenGui_1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
LMG2L["ScreenGui_1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

-- MainFrame
LMG2L["MainFrame_2"] = Instance.new("Frame", LMG2L["ScreenGui_1"]);
LMG2L["MainFrame_2"]["BorderSizePixel"] = 0;
LMG2L["MainFrame_2"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
LMG2L["MainFrame_2"]["Size"] = UDim2.new(0.32059, 0, 0.56651, 0);
LMG2L["MainFrame_2"]["Position"] = UDim2.new(0.33971, 0, 0.15649, 0);
LMG2L["MainFrame_2"]["Name"] = [[MainFrame]];
Instance.new("UICorner", LMG2L["MainFrame_2"]);

-- Header
LMG2L["Header_4"] = Instance.new("Frame", LMG2L["MainFrame_2"]);
LMG2L["Header_4"]["BorderSizePixel"] = 0;
LMG2L["Header_4"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
LMG2L["Header_4"]["Size"] = UDim2.new(1, 0, 0.14917, 0);
Instance.new("UICorner", LMG2L["Header_4"]);

-- Header inner frame
LMG2L["Frame_6"] = Instance.new("Frame", LMG2L["Header_4"]);
LMG2L["Frame_6"]["BorderSizePixel"] = 0;
LMG2L["Frame_6"]["BackgroundColor3"] = Color3.fromRGB(84, 84, 84);
LMG2L["Frame_6"]["Size"] = UDim2.new(0.9633, 0, 0.77778, 0);
LMG2L["Frame_6"]["Position"] = UDim2.new(0.01835, 0, 0.11111, 0);
Instance.new("UICorner", LMG2L["Frame_6"]);

-- Title
LMG2L["Title_8"] = Instance.new("TextLabel", LMG2L["Frame_6"]);
LMG2L["Title_8"]["BorderSizePixel"] = 0;
LMG2L["Title_8"]["TextSize"] = 30;
LMG2L["Title_8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["Title_8"]["FontFace"] = Font.new([[rbxasset://fonts/families/DenkOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
LMG2L["Title_8"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["Title_8"]["BackgroundTransparency"] = 1;
LMG2L["Title_8"]["Size"] = UDim2.new(0.39524, 0, 1, 0);
LMG2L["Title_8"]["Text"] = [[Universal Hub]];
LMG2L["Title_8"]["Position"] = UDim2.new(0.01429, 0, 0, 0);

-- Minimize Button
LMG2L["TextButton_9"] = Instance.new("TextButton", LMG2L["Header_4"]);
LMG2L["TextButton_9"]["BorderSizePixel"] = 0;
LMG2L["TextButton_9"]["TextSize"] = 35;
LMG2L["TextButton_9"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["TextButton_9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["TextButton_9"]["BackgroundTransparency"] = 0.8;
LMG2L["TextButton_9"]["Size"] = UDim2.new(0.13303, 0, 0.7037, 0);
LMG2L["TextButton_9"]["Text"] = [[-]];
LMG2L["TextButton_9"]["Position"] = UDim2.new(0.83945, 0, 0.14815, 0);
Instance.new("UICorner", LMG2L["TextButton_9"]);

-- Left buttons frame (Hitbox / ESP)
LMG2L["Frame_b"] = Instance.new("Frame", LMG2L["MainFrame_2"]);
LMG2L["Frame_b"]["BorderSizePixel"] = 0;
LMG2L["Frame_b"]["BackgroundColor3"] = Color3.fromRGB(84, 84, 84);
LMG2L["Frame_b"]["Size"] = UDim2.new(0.3211, 0, 0.79006, 0);
LMG2L["Frame_b"]["Position"] = UDim2.new(0.02294, 0, 0.16575, 0);
Instance.new("UICorner", LMG2L["Frame_b"]);

-- Hitbox Button
LMG2L["TextButton_d"] = Instance.new("TextButton", LMG2L["Frame_b"]);
LMG2L["TextButton_d"]["BorderSizePixel"] = 0;
LMG2L["TextButton_d"]["TextSize"] = 30;
LMG2L["TextButton_d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["TextButton_d"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
LMG2L["TextButton_d"]["FontFace"] = Font.new([[rbxasset://fonts/families/DenkOne.json]]);
LMG2L["TextButton_d"]["BackgroundTransparency"] = 0.8;
LMG2L["TextButton_d"]["Size"] = UDim2.new(0.87143, 0, 0.16084, 0);
LMG2L["TextButton_d"]["Text"] = [[Hitbox]];
LMG2L["TextButton_d"]["Position"] = UDim2.new(0.07143, 0, 0.02797, 0);
Instance.new("UICorner", LMG2L["TextButton_d"]);

-- ESP Button
LMG2L["TextButton_f"] = Instance.new("TextButton", LMG2L["Frame_b"]);
LMG2L["TextButton_f"]["BorderSizePixel"] = 0;
LMG2L["TextButton_f"]["TextSize"] = 30;
LMG2L["TextButton_f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["TextButton_f"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
LMG2L["TextButton_f"]["FontFace"] = Font.new([[rbxasset://fonts/families/DenkOne.json]]);
LMG2L["TextButton_f"]["BackgroundTransparency"] = 0.8;
LMG2L["TextButton_f"]["Size"] = UDim2.new(0.87143, 0, 0.16084, 0);
LMG2L["TextButton_f"]["Text"] = [[ESP]];
LMG2L["TextButton_f"]["Position"] = UDim2.new(0.07143, 0, 0.22378, 0);
Instance.new("UICorner", LMG2L["TextButton_f"]);

-- Right frame for tabs content
LMG2L["Frame_11"] = Instance.new("Frame", LMG2L["MainFrame_2"]);
LMG2L["Frame_11"]["BorderSizePixel"] = 0;
LMG2L["Frame_11"]["BackgroundColor3"] = Color3.fromRGB(84, 84, 84);
LMG2L["Frame_11"]["Size"] = UDim2.new(0.61468, 0, 0.79006, 0);
LMG2L["Frame_11"]["Position"] = UDim2.new(0.36697, 0, 0.16575, 0);
Instance.new("UICorner", LMG2L["Frame_11"]);

-- Aspect ratio
Instance.new("UIAspectRatioConstraint", LMG2L["MainFrame_2"]).AspectRatio = 1.20442;

-- LocalScript
LMG2L["LocalScript_14"] = Instance.new("LocalScript", LMG2L["ScreenGui_1"]);

local function C_14()
    local script = LMG2L["LocalScript_14"]
    local screenGui = script.Parent
    local mainFrame = screenGui:WaitForChild("MainFrame")
    local header = mainFrame:WaitForChild("Header")
    local toggleButton = header:WaitForChild("TextButton_9")

    -- Botão "+" para abrir novamente
    local openButton = Instance.new("TextButton")
    openButton.Parent = screenGui
    openButton.Size = UDim2.new(0,50,0,50)
    openButton.Position = UDim2.new(0,10,0,10)
    openButton.BackgroundColor3 = Color3.fromRGB(0,0,0)
    openButton.TextColor3 = Color3.fromRGB(255,255,255)
    openButton.Font = Enum.Font.SourceSansBold
    openButton.TextScaled = true
    openButton.Text = "+"
    openButton.Visible = false

    toggleButton.MouseButton1Click:Connect(function()
        mainFrame.Visible = false
        openButton.Visible = true
    end)
    openButton.MouseButton1Click:Connect(function()
        mainFrame.Visible = true
        openButton.Visible = false
    end)

    -- ================= Tabs =================
    local tabsFrame = mainFrame:WaitForChild("Frame_11")
    local leftFrame = mainFrame:WaitForChild("Frame_b")

    -- Hitbox Content
    local hitboxContent = Instance.new("Frame", tabsFrame)
    hitboxContent.Size = UDim2.new(1,0,1,0)
    hitboxContent.BackgroundTransparency = 1
    hitboxContent.Visible = true

    -- ESP Content
    local espContent = Instance.new("Frame", tabsFrame)
    espContent.Size = UDim2.new(1,0,1,0)
    espContent.BackgroundTransparency = 1
    espContent.Visible = false

    leftFrame.TextButton_d.MouseButton1Click:Connect(function()
        hitboxContent.Visible = true
        espContent.Visible = false
    end)
    leftFrame.TextButton_f.MouseButton1Click:Connect(function()
        hitboxContent.Visible = false
        espContent.Visible = true
    end)

    -- ================= ESP Script =================
    local NO_TEAM_COLOR = Color3.fromRGB(0,255,0)
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local LocalPlayer = Players.LocalPlayer
    local Camera = workspace.CurrentCamera

    local Settings = {
        BoxESP = false,
        OutlineESP = false,
        ShowName = false,
        ShowDistance = false,
        ESPTeammates = false
    }

    -- GUI elements for ESP inside the Hub
    local ElementsToHide = {}

    local function createESPUI(parent)
        local title = Instance.new("TextLabel")
        title.Parent = parent
        title.Size = UDim2.new(1,0,0,30)
        title.Position = UDim2.new(0,0,0,0)
        title.BackgroundColor3 = Color3.fromRGB(84,84,84)
        title.Text = "Universal ESP"
        title.TextColor3 = Color3.fromRGB(255,255,255)
        title.Font = Enum.Font.DenkOne
        title.TextSize = 18
        Instance.new("UICorner", title)

        local sub = Instance.new("TextLabel")
        sub.Parent = parent
        sub.Size = UDim2.new(1,0,0,20)
        sub.Position = UDim2.new(0,0,0,30)
        sub.BackgroundTransparency = 1
        sub.Text = "Created by SARpastes"
        sub.TextColor3 = Color3.fromRGB(255,255,255)
        sub.Font = Enum.Font.Gotham
        sub.TextSize = 13
        sub.TextXAlignment = Enum.TextXAlignment.Left

        local settingsList = {
            {name="Box ESP", key="BoxESP"},
            {name="Outline ESP", key="OutlineESP"},
            {name="ESP Name", key="ShowName"},
            {name="ESP Distance", key="ShowDistance"},
            {name="ESP Teammates", key="ESPTeammates"}
        }

        for i,v in ipairs(settingsList) do
            local b = Instance.new("TextButton")
            b.Parent = parent
            b.Size = UDim2.new(0.95,0,0,25)
            b.Position = UDim2.new(0,10,0, 60+(i-1)*35)
            b.BackgroundColor3 = Color3.fromRGB(0,0,0)
            b.BackgroundTransparency = 0.5
            b.TextColor3 = Color3.fromRGB(255,255,255)
            b.Font = Enum.Font.DenkOne
            b.TextSize = 14
            b.Text = v.name..": OFF"
            Instance.new("UICorner", b)
            table.insert(ElementsToHide,b)

            b.MouseButton1Click:Connect(function()
                Settings[v.key] = not Settings[v.key]
                b.Text = v.name..": "..(Settings[v.key] and "ON" or "OFF")
            end)
        end
    end

    createESPUI(espContent)

    -- ================= ESP Logic =================
    local ESP = {}
    local function shouldESP(p)
        if p==LocalPlayer then return false end
        local localTeam = LocalPlayer.Team
        local playerTeam = p.Team
        if not Settings.ESPTeammates then
            if localTeam and playerTeam and localTeam==playerTeam then return false end
            return true
        end
        return true
    end

    local function getColor(p)
        if p.Team then return p.Team.TeamColor.Color end
        return NO_TEAM_COLOR
    end

    local function setup(p)
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
        bb.AlwaysOnTop = true
        bb.StudsOffset = Vector3.new(0,3,0)
        bb.Parent = workspace

        local txt = Instance.new("TextLabel", bb)
        txt.Size = UDim2.new(1,0,1,0)
        txt.BackgroundTransparency = 1
        txt.Font = Enum.Font.Gotham
        txt.TextStrokeTransparency = 0
        txt.TextSize = 13

        ESP[p] = {Box=box, HL=hl, BB=bb, TXT=txt}
    end

    for _,p in pairs(Players:GetPlayers()) do if p~=LocalPlayer then setup(p) end end
    Players.PlayerAdded:Connect(setup)
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

                e.Box.Visible = Settings.BoxESP
                e.Box.Adornee = Settings.BoxESP and c or nil

                e.HL.Enabled = Settings.OutlineESP
                e.HL.Adornee = Settings.OutlineESP and c or nil

                local showBB = Settings.ShowName or Settings.ShowDistance
                e.BB.Enabled = showBB
                e.BB.Adornee = showBB and hrp or nil

                if showBB then
                    local t = ""
                    if Settings.ShowName then t=p.Name end
                    if Settings.ShowDistance then
                        local dist = math.floor((Camera.CFrame.Position-hrp.Position).Magnitude)
                        if Settings.ShowName then t=t.." ["..dist.." studs]" else t=dist.." studs" end
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
end

task.spawn(C_14)
return LMG2L["ScreenGui_1"], require
