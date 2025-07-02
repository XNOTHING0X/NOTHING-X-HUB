shared._DLoaded = false

spawn(function()
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local ReplicatedFirst = game:GetService("ReplicatedFirst")

local player = Players.LocalPlayer

pcall(function()
	ReplicatedFirst:RemoveDefaultLoadingScreen()
end)

local playerGui = player:WaitForChild("PlayerGui")

if not player.Character or not player.Character:FindFirstChild("Humanoid") then
	player.CharacterAdded:Wait()
end
player.Character:WaitForChild("Humanoid")

task.wait(2)

local function destroyGUI()
	local gameGui = playerGui:FindFirstChild("GameGui")

	local guiNames = {
		"LoadingScreen",
		"DailyRewards",
		"EmoteWheel",
		"Transition",
		"KeyHints"
	}

	for _, name in ipairs(guiNames) do
		local gui = playerGui:FindFirstChild(name) or (gameGui and gameGui:FindFirstChild(name))
		if gui then
			gui:Destroy()
		end
	end
end

local function removeBlur()
	for _, effect in ipairs(Lighting:GetChildren()) do
		if effect:IsA("BlurEffect") then
			effect:Destroy()
		end
	end
end

destroyGUI()
removeBlur()
    shared._DLoaded = true 
end)

repeat task.wait() until shared._DLoaded
local P,S,U,R,W=game:GetService("Players"),game:GetService("StarterGui"),game:GetService("UserInputService"),game:GetService("RunService"),game:GetService("Workspace") local p=P.LocalPlayer local g=p:WaitForChild("PlayerGui") local m=false local z=Vector3.new(6,6,8) local t=1 local w,s,a,d=false,false,false,false local v=0.065 local c={} local function q() for _,o in pairs(c) do if o then o:Disconnect() end end c={} end local function k() return p:GetAttribute("DisableControls")==true end table.insert(c,U.InputBegan:Connect(function(i,e) if e then return end if i.KeyCode==Enum.KeyCode.One then m=not m pcall(function() S:SetCore("SendNotification",{Title="Safe Mode",Text=m and"ON"or"OFF",Duration=0.5,Icon="rbxassetid://140690318962088"}) end) local h=p.Character local x=h and h:FindFirstChild("Hitbox") if x then x.Size=m and z or Vector3.new(4.521276473999023,5.7297587394714355,2.397878408432007) x.Transparency=m and t or 1 end elseif i.KeyCode==Enum.KeyCode.L then m=false pcall(function() S:SetCore("SendNotification",{Title="Safe Mode",Text="Destroyed Fully",Duration=0.5,Icon="rbxassetid://140690318962088"}) end) local h=p.Character local x=h and h:FindFirstChild("Hitbox") if x then x.Size=Vector3.new(4.521276473999023,5.7297587394714355,2.397878408432007) x.Transparency=1 end q() script:Destroy() elseif i.KeyCode==Enum.KeyCode.LeftControl and m and(p.Team==game.Teams.Home or p.Team==game.Teams.Away) then local j=W:FindFirstChild("Junk") local f=j and j:FindFirstChild("Football") local h=p.Character local r=h and h:FindFirstChild("HumanoidRootPart") if f and r then f.Position=r.Position end elseif i.KeyCode==Enum.KeyCode.P then game:GetService("TeleportService"):Teleport(126195208568849,p) end end)) table.insert(c,R.Stepped:Connect(function() if m and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and not k() then local n=Vector3.zero if w then n=n+Vector3.new(0,0,-v) end if s then n=n+Vector3.new(0,0,v) end if a then n=n+Vector3.new(-v,0,0) end if d then n=n+Vector3.new(v,0,0) end p.Character.HumanoidRootPart.CFrame*=CFrame.new(n) end end)) table.insert(c,U.InputBegan:Connect(function(i,e) if e then return end if i.KeyCode==Enum.KeyCode.W then w=true elseif i.KeyCode==Enum.KeyCode.S then s=true elseif i.KeyCode==Enum.KeyCode.A then a=true elseif i.KeyCode==Enum.KeyCode.D then d=true end end)) table.insert(c,U.InputEnded:Connect(function(i) if i.KeyCode==Enum.KeyCode.W then w=false elseif i.KeyCode==Enum.KeyCode.S then s=false elseif i.KeyCode==Enum.KeyCode.A then a=false elseif i.KeyCode==Enum.KeyCode.D then d=false end end)) S:SetCore("SendNotification",{Title="LOAD Safe Mode",Text="",Duration=0.5,Icon="rbxassetid://140690318962088"})
