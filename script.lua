local Players=
game:GetService("Players")
local RunService =
game:GetService("RunService")
local VirtualUser=
game:GetService("VirtualUser")
local LocalPlayer= Players.LocalPlayer

LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()

    VirtualUser:ClickButton2(Vector2.new())
end)

local confif ={
    chestFarm = true,
    mobFarm = true,
    auraHit = ture,
    hitRange = 30,
    tpSpeed = 2,
}

local islands = {
    ["Starter Island"] = Vector3.new(-12463, 331, -7552),
    ["Jungle"] = Vector3.new(-380, 331, 5336),
    ["Pirate Village"] = Vector3.new(-2884, 43, -3253),
    ["Desert"] = Vector3.new(4841, 14, 4426),
    ["Middle Town"] = Vector3.new(-10467, 73, -1257),
    ["Frozen Village"] = Vector3.new(1161, 38, -6849),
    ["Marine Fortress"] = Vector3.new(-9515, 147, 5636),
    ["Skylands"] = Vector3.new(5734, 609, -704),
    ["Prison"] = Vector3.new(-5029, 315, -5356),
    ["Colosseum"] = Vector3.new(-11025, 103, 8780),
    ["Magma Village"] = Vector3.new(5314, 22, 1047),
    ["Underwater City"] = Vector3.new(6116, 12, 1419),
    ["Fountain City"] = Vector3.new(-12224, 5, 10515)
}

local currentIndex =1

local function auraAttack()
    if not config.auraHit then return end
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild
    d("HumanoidRootPart") then return end
    for _, mob in ipairs(workspace.Enemies:GetChildren())
    do
        if mob:FindFirstChild("HumanoidRootPart") and mob:FindFirstChild("Humanoid") then
            local dist =
(mob.HumanoidRootPart.Position - char.HumanoidRootPart.Position).Magnitude
if dist <=config.hitRange then
    local tool =
char.FindFirstChildsOffClass("Tool")
    if tool then
        tool.Activate()
    end
    local args = {
        [1]= mob,
        [2]="Basic",
        [3]=CFrame.new(char.HumanoidRootPart.Position, mob.HumanoidRootPart.Position)
    }
    game:GetService("ReplicatedStorage"):
    WaitForChild("Remotes"):WaitForChild("CommF_"):FireServer(unpack(args)) 
            end
        end
    end
end

local function collectChests()
    if not config.chestFarm then return 
    end
    for _, chestin
    ipairs(workspace:GetChilren()) do 
        if chest.Name == "Chest" and 
        chest:FindFirstChild("TouchInterest")
        then
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart")
then
    firetouchinterest(char.HumanoidRootPart, chest,0)
    task.wait(0.1)
    firetouchinterest(char.HumanoidRootPart, chest,1)
            end
        end
    end
end
task.spawn(function()
    while config.chestFarm do
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart")
        then
            char.HumanoidRootPart.CFrame = C.Frame.new(islands[currentIndex])
            currentIndex = currentIndex %#islands+ 1
        end
        task.wait(config.tpSpeed)
    end
end)

RunService.Heartbear:Connect(function()
pcall(function()
if config.mobFarm then auraAttack()
end
if config.chestFarm then collectChests() end
end)
end)
print("made by m3hm3t_S4rp its working rn")