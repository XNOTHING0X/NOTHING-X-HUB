local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Window = Fluent:CreateWindow({
    Title = "NOTHING X HUB",
    SubTitle = " Super League Soccer - Hitbox",
    TabWidth = 0,
    Size = UDim2.fromOffset(315, 413),
    Acrylic = true,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.LeftAlt
})
local Tabs = {
    X = Window:AddTab({Title = "", Icon = ""})
}
Wait (1.5)
game:GetService("CoreGui").ScreenGui:GetChildren()[2].Frame.Frame.BackgroundTransparency = 1
game:GetService("CoreGui").ScreenGui:GetChildren()[2]:GetChildren()[6]:GetChildren()[5]:Destroy()
game:GetService("CoreGui").ScreenGui:GetChildren()[2]:GetChildren()[6]:GetChildren()[4]:Destroy()
game:GetService("CoreGui").ScreenGui:GetChildren()[2]:GetChildren()[5]:Destroy()
game:GetService("CoreGui").ScreenGui:GetChildren()[2].Frame.BackgroundTransparency = 1
game:GetService("CoreGui").ScreenGui.Frame:Destroy()
Window:SelectTab()
local dsx, dsy, dsz = 4.521276473999023, 5.7297587394714355, 2.397878408432007
local dt, dc = 1, Color3.fromRGB(255, 255, 255)
local hsx, hsy, hsz = dsx, dsy, dsz
local ht, hc = dt, dc
local iha = false
local p = game.Players.LocalPlayer
local c = p.Character or p.CharacterAdded:Wait()
local hb = c:FindFirstChild("Hitbox")
local lhp
local function updRealHb()
    if hb then
        hb.Size = Vector3.new(hsx, hsy, hsz)
        hb.Transparency = ht
        hb.Color = hc
    end
end
local function resetHbToDefault()
    if hb then
        hb.Size = Vector3.new(dsx, dsy, dsz)
        hb.Transparency = dt
        hb.Color = dc
    end
end
local function moveOldHbToNewHb()
    local nhp = c:FindFirstChild("Hitbox")
    if nhp and hb then
        hb.CFrame = nhp.CFrame
        if iha then
            updRealHb()
        else
            resetHbToDefault()
        end
    else
    end
end
p.CharacterAdded:Connect(function(c)
    hb = c:WaitForChild("Hitbox", 10)
end)
local tog = Tabs.X:AddToggle("MyToggle", {
    Title = "",
    Default = false
})
tog:OnChanged(function()
    iha = tog.Value
    if iha then
        while iha do
            updRealHb()
            wait(0.1)
        end
    else
        resetHbToDefault()
    end
end)
tog:SetValue(false)
local ix = Tabs.X:AddInput("InputX", {
    Title = "Hitbox (X)",
    Description = "1-2048",
    Default = 1,
    Numeric = true,
    Callback = function(v)
        hsx = tonumber(v)
        if iha then
            updRealHb()
        end
    end
})
local iy = Tabs.X:AddInput("InputY", {
    Title = "Hitbox (Y)",
    Description = "1-2048",
    Default = 1,
    Numeric = true,
    Callback = function(v)
        hsy = tonumber(v)
        if iha then
            updRealHb()
        end
    end
})
local iz = Tabs.X:AddInput("InputZ", {
    Title = "Hitbox (Z)",
    Description = "1-2048",
    Default = 1,
    Numeric = true,
    Callback = function(v)
        hsz = tonumber(v)
        if iha then
            updRealHb()
        end
    end
})
local ts = Tabs.X:AddSlider("TransparencySlider", {
    Title = "Transparency",
    Description = "",
    Default = 1,
    Min = 0,
    Max = 1,
    Rounding = 1.1,
    Callback = function(v)
        ht = v
        if iha then
            updRealHb()
        end
    end
})
ts:SetValue(1)
local cp = Tabs.X:AddColorpicker("Colorpicker", {
    Title = "Hitbox Color",
    Default = Color3.fromRGB(255, 255, 255)
})
cp:OnChanged(function()
    hc = cp.Value
    if iha then
        updRealHb()
    end
end)
