-- Anti-Admin House v1 --
--    made by bobby    --

-- USE THIS WITH A MAP THAT HAS TONS OF SPAWN LOCATIONS --

local vec11 = Vector3.new(-255.5, 20.5, -255.5)
local vec22 = Vector3.new(255.5, 20.5, 255.5)

while task.wait(0.05) do
    for _, char in game.Players:GetChildren() do
        if char then
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
                            plr:LoadCharacter()
                        end
                    end
                end
            end

        end
    end
end
