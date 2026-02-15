task.wait(0.67)
var btoolsNames = {"Building Tools", "GameTool", "Hammer", "Clone", "Indexing Tool"}
if not map then
    warn("[bobby's map changer] Map not defined! (ex: var map = instance)")
else
    game.Workspace.ChildRemoved:Connect(function(child)
        if child and map and child == map then
            local cl = Clone(map)
            cl.Parent = workspace
            map = cl
        end
    end)
    RunAdonisCommand(":re all")
    
    function antif3x(playuhDetector)
        task.wait()
        pcall(function()
            playuhDetector.Backpack.ChildAdded:Connect(function(newitem)
                if newitem and table.find(btoolsNames, newitem.Name) then
                    RunAdonisCommand(":removetools "..playuhDetector.Name)
                end
            end)
            playuhDetector.Character.ChildAdded:Connect(function(newitemz)
                if newitemz and table.find(btoolsNames, newitemz.Name) then
                    RunAdonisCommand(":removetools "..playuhDetector.Name)
                end
            end)
        end)
    end

    for _, player in game.Players:GetChildren() do
        antif3x(player)
        player.CharacterAdded:Connect(function()
            antif3x(player)
        end)
    end

    game.Players.PlayerAdded:Connect(function(player)
        antif3x(player)
        player.CharacterAdded:Connect(function()
            antif3x(player)
        end)
    end)
end

local vec11 = Vector3.new(-255.5, 20.5, -255.5)
local vec22 = Vector3.new(255.5, 20.5, 255.5)

while task.wait(0.05) do
    for _, char in game.Players:GetChildren() do
        pcall(function()
            if char then
                if char.Character and char.Character:FindFirstChild("HumanoidRootPart") then
                    local partX = char.Character:FindFirstChild("HumanoidRootPart").Position.X
                    local partZ = char.Character:FindFirstChild("HumanoidRootPart").Position.Z
                    local checkX = false
                    local checkZ = false
                    if partX >= vec11.X then
                        if partX <= vec22.X then
                            checkX = true
                        end
                    end

                    if partZ >= vec11.Z then
                        if partZ <= vec22.Z then
                            checkZ = true
                        end
                    end
                    if checkX and checkZ then
                        if char.Character then
                            local plr = char
                            if plr and plr.Parent then
                                if plr.Parent == game.Players then
                                    RunAdonisCommand(":re "..plr.Name)
                                    task.wait(0.5)
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
    collectgarbage(char)
end
