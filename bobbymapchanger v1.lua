-- bobby's Map Changer v1 --

-- SET THE MAP Using:
-- var map = INSTANCEHERE

loadstring(http.Get("https://raw.githubusercontent.com/daredjumper/bobbyscripts/refs/heads/main/antiadminhouse.lua"))

if not map then
    warn("[bobby's map changer] Map not defined! (ex: var map = instance)")
else
    workspace:ClearAllChildren()
    game.Teams:ClearAllChildren()
    game.Lighting:ClearAllChildren()
    workspace.ChildRemoved:Connect(function(child)
        if child and child == map then
            local cl = Clone(map)
            cl.Parent = workspace
            map = cl
        end
    end)
    workspace.ChildAdded:Connect(function(childre)
        if childre ~= map then
            childre:Destroy()
        end
    end)
    RunAdonisCommand(":re all")

    local btools = {
        "Building Tools",
        "F3X",
        "Clone",
        "GameTool",
        "Hammer"
    }

    local function setupAntiF3X(plr)
        if plr then
            plr.Backpack.ChildAdded:Connect(function(tool)
                print(tool)
                if table.find(btools, tool.Name) then
                    plr.Backpack:ClearAllChildren()
                    RunAdonisCommand(":removetools "..plr.Name)
                end
            end)
        end
    end

    for _, player in game.Players:GetChildren() do
        setupAntiF3X(player)
    end

    game.Players.PlayerAdded:Connect(function(plar)
        setupAntiF3X(plar)
    end)
end

