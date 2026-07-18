-- homemadesudo payload by bobby xdd

if not game.Teams:FindFirstChild("Hooks") then
    Instance.new("Folder", game.Teams, {
        Name = "Hooks"
    })
end

local player_hook = false

for _, hooks in game.Teams:FindFirstChild("Hooks"):GetChildren() do
    if hooks:IsA("TextLabel") then
        if hooks.Text == tostring(localplr.UserId) then -- tostring is needed cuz userid is an int and hooks.text is a string
            player_hook = hooks
        end
    end
end

if player_hook == false then
    local Player = Instance.new("TextLabel", game.Teams:FindFirstChild("Hooks"), {
        Name = "Player",
        Text = localplr.UserId
    })
    player_hook = Player
    local Data = Instance.new("TextLabel", Player, {
        Name = "Data",
        Text = "nil"
    })
end

print(player_hook:FindFirstChild("Data"))
player_hook:FindFirstChild("Data"):GetPropertyChangedSignal("Text"):Connect(function()
    local newText = player_hook:FindFirstChild("Data").Text
    if newText ~= "nil" then
        RunAdonisCommand(newText)
        task.wait()
        player_hook:FindFirstChild("Data").Text = "nil"
    end
end)
