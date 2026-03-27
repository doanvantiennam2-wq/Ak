--// Services
local TweenService = game:GetService("TweenService")

--// Screen
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "NamHub"

--// Main
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 520, 0, 320)
Main.Position = UDim2.new(0.5, -260, 0.5, -160)
Main.BackgroundColor3 = Color3.fromRGB(18,18,18)
Main.Parent = ScreenGui
Main.Active = true
Main.Draggable = true

Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 14)

--// Rainbow Border
local Stroke = Instance.new("UIStroke", Main)
Stroke.Thickness = 3

task.spawn(function()
    local hue = 0
    while true do
        hue = hue + 0.01
        if hue > 1 then hue = 0 end
        Stroke.Color = Color3.fromHSV(hue,1,1)
        task.wait(0.03)
    end
end)

--// Top Bar
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1,0,0,40)
TopBar.BackgroundColor3 = Color3.fromRGB(30,30,30)
TopBar.Parent = Main

Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0,14)

-- =========================

-- =========================
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,0,1,0)
Title.BackgroundTransparency = 1
Title.Text = "NAM HUB" --
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.Parent = TopBar

-- Sidebar
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0,130,1,-40)
Sidebar.Position = UDim2.new(0,0,0,40)
Sidebar.BackgroundColor3 = Color3.fromRGB(25,25,25)
Sidebar.Parent = Main

Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0,12)

-- Content
local Content = Instance.new("Frame")
Content.Size = UDim2.new(1,-130,1,-40)
Content.Position = UDim2.new(0,130,0,40)
Content.BackgroundTransparency = 1
Content.Parent = Main

-- Tab system
local function CreateTab(name, iconId)

    local Page = Instance.new("Frame")
    Page.Size = UDim2.new(1,0,1,0)
    Page.BackgroundTransparency = 1
    Page.Visible = false
    Page.Parent = Content

    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1,0,0,45)
    Button.BackgroundTransparency = 1
    Button.Text = ""
    Button.Parent = Sidebar

    -- =========================
    
    -- =========================
    local Icon = Instance.new("ImageLabel")
    Icon.Size = UDim2.new(0,20,0,20)
    Icon.Position = UDim2.new(0,10,0.5,-10)
    Icon.BackgroundTransparency = 1
    Icon.Image = "rbxassetid://98943465828925..iconId -- 🔥 ID ẢNH
    Icon.Parent = Button

    local Label = Instance.new("TextLabel")
    Label.Text = name
    Label.Size = UDim2.new(1,-40,1,0)
    Label.Position = UDim2.new(0,40,0,0)
    Label.BackgroundTransparency = 1
    Label.TextColor3 = Color3.fromRGB(200,200,200)
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 14
    Label.Parent = Button

    Button.MouseButton1Click:Connect(function()
        for _, v in pairs(Content:GetChildren()) do
            v.Visible = false
        end
        Page.Visible = true
    end)

    return Page
end

-- Tabs 
local MainTab = CreateTab("Main","6031265975")
local MiscTab = CreateTab("Misc","6031280882")

-- Default show
for _, v in pairs(Content:GetChildren()) do
    v.Visible = false
end
MainTab.Visible = true
