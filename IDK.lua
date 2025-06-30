local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Window = Fluent:CreateWindow({
    Title = "NOTHING X HUB",
    SubTitle = "Quiet or Die",
    TabWidth = 0,
    Size = UDim2.fromOffset(260, 350),
    Acrylic = true,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.LeftAlt
})
local Tabs = {
    X = Window:AddTab({ Title = "", Icon = "" }),
}
Window:SelectTab(1)
game:GetService("CoreGui").ScreenGui:GetChildren()[2].Frame.Frame.BackgroundTransparency = 1
game:GetService("CoreGui").ScreenGui:GetChildren()[2]:GetChildren()[6]:GetChildren()[5]:Destroy()
game:GetService("CoreGui").ScreenGui:GetChildren()[2]:GetChildren()[6]:GetChildren()[4]:Destroy()
game:GetService("CoreGui").ScreenGui:GetChildren()[2]:GetChildren()[5]:Destroy()
game:GetService("CoreGui").ScreenGui:GetChildren()[2].Frame.BackgroundTransparency = 1
local Toggle = Tabs.X:AddToggle("Tog_spam_C", {
    Title = "SPAM Click Killer", 
    Default = false
})
local spamClicking = false
Toggle:OnChanged(function(value)
    spamClicking = value
    while spamClicking do
        game:GetService("ReplicatedStorage"):WaitForChild("PlayerTouchedOrClicked"):FireServer()
        wait() 
    end
end)
local Toggle = Tabs.X:AddToggle("Tog_spam_D", {
    Title = "Show Players", 
    Default = false
})
local XXXX = false
Toggle:OnChanged(function(value)
    XXXX = value
    while XXXX do
        local args = {3}
        game:GetService("ReplicatedStorage"):WaitForChild("AbilityEvent"):FireServer(unpack(args))
        wait() 
    end
end)
local Button = Tabs.X:AddButton({
    Title = "Show Players",
    Callback = function()
        local args = {3}
        game:GetService("ReplicatedStorage"):WaitForChild("AbilityEvent"):FireServer(unpack(args))
    end
})
local isSpamming = false
local Button = Tabs.X:AddButton({
    Title = "EMOTE",
    Callback = function()
        local args = {1}
        game:GetService("ReplicatedStorage"):WaitForChild("AbilityEvent"):FireServer(unpack(args))
    end
})
local Toggle = Tabs.X:AddToggle("Tog_spam_E", {
    Title = "SPAM EMOTE", 
    Default = false 
})
Toggle:OnChanged(function(value)
    isSpamming = value
    while isSpamming do
        local args = {1}
        game:GetService("ReplicatedStorage"):WaitForChild("AbilityEvent"):FireServer(unpack(args))
        wait() 
    end
end)
    local SpeedX = false
    local SpeedValue = 16 
    local Input = Tabs.X:AddInput("Input", {
        Title = "",
    Default = tostring(SpeedValue),
        Placeholder = "Enter Speed",
        Numeric = true, 
        Finished = false, 
        Callback = function(Value)
                SpeedValue = tonumber(Value) or SpeedValue
        end
    })
local Toggle = Tabs.X:AddToggle("Tog_spam_E", {
    Title = "Speed", 
    Default = false 
})
Toggle:OnChanged(function(value)
    SpeedX = value
    if SpeedX then
        spawn(function() 
            while SpeedX do
                if game.Players.LocalPlayer.Character then
                    local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        humanoid.WalkSpeed = SpeedValue
                    end
                end
                wait()
            end
            if game.Players.LocalPlayer.Character then
                local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.WalkSpeed = 16
                end
            end
        end)
    else
        if game.Players.LocalPlayer.Character then
            local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = 16
            end
        end
    end
end)
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local XXVXX = false
local Toggle = Tabs.X:AddToggle("Tog_Jump", {
    Title = "Inf Jump",
    Default = false
})
Toggle:OnChanged(function(value)
    XXVXX = value
end)
UserInputService.JumpRequest:Connect(function()
    if XXVXX and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Toggle = Tabs.X:AddToggle("Tog_NOC", {
    Title = "Noclip",
    Default = false
})
local XXXVX = false
Toggle:OnChanged(function(value)
    XXXVX = value
    local LocalPlayer = Players.LocalPlayer
    local Character = LocalPlayer.Character
    local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
    if not Character or not HumanoidRootPart then
        XXXVX = false
        return
    end
    if XXXVX then
        for _, part in pairs(Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
        local connection
        connection = RunService.RenderStepped:Connect(function()
            if XXXVX and Character and Character.Parent then
                for _, part in pairs(Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            else
                connection:Disconnect()
            end
        end)
    else
        for _, part in pairs(Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
    end
end)
local VX = false
local Toggle = Tabs.X:AddToggle("Tog_spam_CC", {
    Title = "Set 0 Hold Revive", 
    Default = false 
})
Toggle:OnChanged(function(value)
    VX = value
    while VX do
    for _, playerModel in ipairs(workspace.PlayersFolder:GetChildren()) do
        local humanoidRootPart = playerModel:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            local reviveAttachment = humanoidRootPart:FindFirstChild("ReviveAttachment")
            if reviveAttachment then
                local revivePrompt = reviveAttachment:FindFirstChild("RevivePrompt")
                if revivePrompt and revivePrompt:IsA("ProximityPrompt") then
                    revivePrompt.HoldDuration = 0
                end
            end
        end
    end        
        wait() 
    end
end)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local workspace = game:GetService("Workspace")
local function createHighlight(name, parent, fillColor, outlineColor)
    local highlight = Instance.new("Highlight")
    highlight.Name = name
    highlight.FillColor = fillColor
    highlight.FillTransparency = 0.9
    highlight.OutlineColor = outlineColor
    highlight.OutlineTransparency = 0
    highlight.Adornee = parent
    highlight.Parent = parent
    return highlight
end
local function createBillboard(name, parent, adornee, displayText)
    local billboard = Instance.new("BillboardGui")
    billboard.Name = name
    billboard.Size = UDim2.new(0, 200, 0, 30)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.MaxDistance = 1000
    billboard.LightInfluence = 0
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Text = displayText
    nameLabel.Size = UDim2.new(1, 0, 1, 0)
    nameLabel.TextScaled = false
    nameLabel.TextSize = 13
    nameLabel.BackgroundTransparency = 1
    nameLabel.TextColor3 = Color3.new(1, 1, 1)
    nameLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    nameLabel.TextStrokeTransparency = 0.3
    nameLabel.Font = Enum.Font.SourceSansBold
    nameLabel.Parent = billboard
    billboard.Adornee = adornee
    billboard.Parent = parent
    return billboard
end
local function setPartsNonCollidable(model)
    for _, part in ipairs(model:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
        end
    end
end
local playerEspEnabled = false
local playerEspConnections = {}
local playerEspObjects = {}
local function setupPlayerESP(playerModel)
    local player = Players:GetPlayerFromCharacter(playerModel)
    if player and player == LocalPlayer then
        return
    end
    local function isModelReady()
        return playerModel:FindFirstChildOfClass("Humanoid") and playerModel:FindFirstChild("Head")
    end
    while not isModelReady() do
        task.wait(1) 
    end
    if playerModel:FindFirstChild("ESP_Highlight_Player") then
        playerModel:FindFirstChild("ESP_Highlight_Player"):Destroy()
        playerModel:FindFirstChild("ESP_Billboard_Player"):Destroy()
    end
    if not playerEspEnabled then return end
    local highlight = createHighlight("ESP_Highlight_Player", playerModel, Color3.new(0, 0, 0), Color3.new(0, 1, 0))
    local head = playerModel:FindFirstChild("Head")
    local billboard = createBillboard("ESP_Billboard_Player", playerModel, head, playerModel.Name)
    setPartsNonCollidable(playerModel)
    table.insert(playerEspObjects, highlight)
    table.insert(playerEspObjects, billboard)
end
local function monitorPlayersFolder()
    local playersFolder = workspace:FindFirstChild("PlayersFolder") or Instance.new("Folder", workspace)
    playersFolder.Name = "PlayersFolder"
    spawn(function()
        while playerEspEnabled do
            for _, model in ipairs(playersFolder:GetChildren()) do
                if model:IsA("Model") then
                    setupPlayerESP(model)
                end
            end
            task.wait(1) 
        end
    end)
end
local function clearPlayerESP()
    for _, obj in ipairs(playerEspObjects) do
        if obj and obj.Parent then
            obj:Destroy()
        end
    end
    playerEspObjects = {}
    for _, connection in ipairs(playerEspConnections) do
        connection:Disconnect()
    end
    playerEspConnections = {}
end
local killerEspEnabled = false
local killerEspConnections = {}
local killerEspObjects = {}
local function setupKillerESP(playerModel)
    local player = Players:GetPlayerFromCharacter(playerModel)
    if player and player == LocalPlayer then
        return
    end
    local function isModelReady()
        return playerModel:FindFirstChildOfClass("Humanoid") and playerModel:FindFirstChild("Head")
    end
    while not isModelReady() do
        task.wait(1) 
    end
    if playerModel:FindFirstChild("ESP_Highlight_Killer") then
        playerModel:FindFirstChild("ESP_Highlight_Killer"):Destroy()
        playerModel:FindFirstChild("ESP_Billboard_Killer"):Destroy()
    end
    if not killerEspEnabled then return end
    local highlight = createHighlight("ESP_Highlight_Killer", playerModel, Color3.new(0, 0, 0), Color3.new(1, 0, 0))
    local head = playerModel:FindFirstChild("Head")
    local billboard = createBillboard("ESP_Billboard_Killer", playerModel, head, player and player.Name or playerModel.Name)
    setPartsNonCollidable(playerModel)
    table.insert(killerEspObjects, highlight)
    table.insert(killerEspObjects, billboard)
end
local function monitorKillerFolder()
    local killerFolder = workspace:FindFirstChild("KillerFolder") or Instance.new("Folder", workspace)
    killerFolder.Name = "KillerFolder"
    spawn(function()
        while killerEspEnabled do
            for _, model in ipairs(killerFolder:GetChildren()) do
                if model:IsA("Model") then
                    setupKillerESP(model)
                end
            end
            task.wait(1) 
        end
    end)
end
local function clearKillerESP()
    for _, obj in ipairs(killerEspObjects) do
        if obj and obj.Parent then
            obj:Destroy()
        end
    end
    killerEspObjects = {}
    for _, connection in ipairs(killerEspConnections) do
        connection:Disconnect()
    end
    killerEspConnections = {}
end
local playerToggle = Tabs.X:AddToggle("Tog_spam_P", {
    Title = "ESP Players",
    Default = false
})
playerToggle:OnChanged(function(value)
    playerEspEnabled = value
    if value then
        monitorPlayersFolder()
    else
        clearPlayerESP()
    end
end)
local killerToggle = Tabs.X:AddToggle("Tog_spam_K", {
    Title = "ESP Killer",
    Default = false
})
killerToggle:OnChanged(function(value)
    killerEspEnabled = value
    if value then
        monitorKillerFolder()
    else
        clearKillerESP()
    end
end)
local function markLocalPlayer(character)
    if not character or character:FindFirstChild("IsLocalPlayer") then
        return
    end
    local marker = Instance.new("BoolValue")
    marker.Name = "IsLocalPlayer"
    marker.Parent = character
end
if LocalPlayer.Character then
    markLocalPlayer(LocalPlayer.Character)
end
LocalPlayer.CharacterAdded:Connect(markLocalPlayer)
local XXXX = false
local Toggle = Tabs.X:AddToggle("Tog_spam_TP_K", {
    Title = "Spam Tp Killer", 
    Default = false 
})
Toggle:OnChanged(function(value)
    XXXX = value
    if XXXX then
        spawn(function()
            while XXXX do
                if game.Players.LocalPlayer.Character and 
                   game.Players.LocalPlayer.Character.Parent == workspace.PlayersFolder then
                    local killer = nil
                    for _, v in pairs(workspace.KillerFolder:GetChildren()) do
                        if v:IsA("Model") and v ~= game.Players.LocalPlayer.Character then
                            killer = v
                            break
                        end
                    end
                    if killer and killer:FindFirstChild("HumanoidRootPart") and 
                       game.Players.LocalPlayer.Character and 
                       game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = killer.HumanoidRootPart.CFrame
                    end
                end
                wait()
            end
        end)
    end
end)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local function getPlayerNames()
    local names = {"None"} 
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            table.insert(names, player.Name)
        end
    end
    return names
end
local Dropdown = Tabs.X:AddDropdown("Dropdown_player", {
    Title = "Player",
    Values = getPlayerNames(),
    Multi = false,
    Default = "None"
})
local Button = Tabs.X:AddButton({
    Title = "Teleport to Player",
    Callback = function()
        local selectedPlayerName = Dropdown:GetValue()
        if selectedPlayerName and selectedPlayerName ~= "None" then
            local targetPlayer = Players:FindFirstChild(selectedPlayerName)
            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
            else
            end
        else
        end
    end
})
