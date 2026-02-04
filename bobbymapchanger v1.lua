task.wait(0.67)
if not map then
    warn("[bobby's map changer] Map not defined! (ex: var map = instance)")
else
    workspace.ChildRemoved:Connect(function(child)
        if child and map and child == map then
            local cl = Clone(map)
            cl.Parent = workspace
            map = cl
        end
    end)
    RunAdonisCommand(":re all")

    local btoolsNames = {"Building Tools", "GameTool", "Hammer", "Clone", "Indexing Tool"}

    local function setupAntiF3X(playuhDetector)
        playuhDetector.Backpack.ChildAdded:Connect(function(newitem)
            if table.find(btoolsNames, newitem.Name) then
                print("ANTII F3X")
                RunAdonisCommand(":removetools "..playuhDetector.Name)
            end
        end)
        playuhDetector.Character.ChildAdded:Connect(function(newitemz)
            if table.find(btoolsNames, newitemz.Name) then
                print("ANTII F3X")
                RunAdonisCommand(":removetools "..playuhDetector.Name)
            end
        end)
    end

    for _, player in game.Players:GetChildren() do
        setupAntiF3X(player)
    end

    game.Players.PlayerAdded:Connect(function(plar)
        setupAntiF3X(plar)
    end)
end

local vec11 = Vector3.new(-255.5, 20.5, -255.5)
local vec22 = Vector3.new(255.5, 20.5, 255.5)

while task.wait(0.05) do
    for _, char in game.Players:GetChildren() do
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
                            end
                        end
                    end
                end
            end
            

        end
    end
end
