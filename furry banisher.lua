local gun = Instance.new("Tool", workspace, {
    TextureId = "rbxassetid://12150325584",
    Name = "furry banisher",
    Grip = CFrame.fromMatrix(Vector3.new(-0.033493295311927795, 0, -1.6353727579116821), Vector3.new(-1, 0, 0.026427321135997772), Vector3.new(0, 1, 0), Vector3.new(-0.026427321135997772, 0, -1)),
    WorldPivot = CFrame.fromMatrix(Vector3.new(13.7999849319458, 7.5, 14.199984550476074), Vector3.new(1, 0, 0), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1)),
})

local handle = Instance.new("Part", gun, {
    BottomSurface = Enum.SurfaceType.Smooth,
    CFrame = localplr.Character:WaitForChild("HumanoidRootPart").CFrame,
    Size = Vector3.new(4, 1, 2),
    TopSurface = Enum.SurfaceType.Smooth,
    Name = "Handle",
})

local mesh = Instance.new("SpecialMesh", handle, {
    MeshType = Enum.MeshType.FileMesh,
    MeshId = "rbxassetid://129746279349684",
    TextureId = "rbxassetid://736312657",
})

local sparkle = Instance.new("ParticleEmitter", handle, {
    Acceleration = Vector3.new(0, 1, 0),
    Brightness = 2,
    Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(1, 0.180392, 1)), ColorSequenceKeypoint.new(1, Color3.new(0.968627, 0.0941176, 1))}),
    Drag = 1,
    Lifetime = NumberRange.new(3, 3),
    Speed = NumberRange.new(6, 6),
    LightEmission = 1,
    Rate = 21,
    RotSpeed = NumberRange.new(500, 500),
    Rotation = NumberRange.new(-360, 360),
    Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.20000000298023224), NumberSequenceKeypoint.new(1, 0.20000000298023224)}),
    Speed = NumberRange.new(6, 6),
    SpreadAngle = Vector2.new(360, -360),
    Texture = "rbxassetid://242109931",
    Name = "Sparkle",
})

local energy = Instance.new("ParticleEmitter", handle, {
    Brightness = 2,
    Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(1, 0.615686, 0.992157)), ColorSequenceKeypoint.new(1, Color3.new(0.333333, 0, 1))}),
    Lifetime = NumberRange.new(3, 3),
    LightEmission = 1,
    LockedToPart = false,
    Orientation = Enum.ParticleOrientation.VelocityPerpendicular,
    Rate = 65,
    RotSpeed = NumberRange.new(300, 300),
    Rotation = NumberRange.new(-360, 360),
    Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 4.749999523162842), NumberSequenceKeypoint.new(1, 0)}),
    Speed = NumberRange.new(0.0010000000474974513, 0.0010000000474974513),
    SpreadAngle = Vector2.new(15,-15),
    Texture = "http://www.roblox.com/asset/?id=7387058218",
    Name = "energy",
})

local music = Instance.new("Sound", handle, {
    SoundId = "rbxassetid://105185396986135",
    Volume = 3,
    Playing = true,
    Looped = true
})

local sounds = {
    "rbxassetid://81724141724491",
}

local userids = {
    "8331245980",
    "10747362143",
    "5282677594"
}

local function spawnRGBPulseCube(pos)
    local cube = Instance.new("Part", Workspace, {
        Size = Vector3.new(0, 0, 0),
        Position = pos,
        Anchored = true,
        CanCollide = false,
        Material = Enum.Material.Neon,
        Color = boltColor,
        Transparency = 0
    })

    local cubeRot = CFrame.Angles(
        math.rad(math.random(0, 360)),
        math.rad(math.random(0, 360)),
        math.rad(math.random(0, 360))
    )
    cube.CFrame = CFrame.new(pos) * cubeRot

    local outline = Instance.new("Part", Workspace, {
        Size = Vector3.new(0, 0, 0),
        Position = pos,
        Anchored = true,
        CanCollide = false,
        Material = Enum.Material.SmoothPlastic,
        Color = Color3.new(0, 0, 0),
        Transparency = 0.7
    })

    local outlineRot = CFrame.Angles(
        math.rad(math.random(0, 360)),
        math.rad(math.random(0, 360)),
        math.rad(math.random(0, 360))
    )
    outline.CFrame = CFrame.new(pos) * outlineRot

    local info = TweenInfo.new(0.3, Enum.EasingStyle.Sine)

    Tween.Create(cube, info, {
        Size = Vector3.new(4, 4, 4),
        Transparency = 1
    }).Play()

    Tween.Create(outline, info, {
        Size = Vector3.new(5, 5, 5),
        Transparency = 1
    }).Play()

    task.spawn(function()
        task.wait(0.35)
        cube:Destroy()
        outline:Destroy()
    end)
end

local function furrify(specified)
    local currentStatus = specified

    if specified.Parent and specified.Parent ~= workspace then
        currentStatus = specified.Parent
    end

    -- walk up until direct child of Workspace or game
    while currentStatus.Parent ~= workspace and currentStatus.Parent ~= game and currentStatus.Parent ~= nil do
        currentStatus = currentStatus.Parent
    end

    if currentStatus == nil or not currentStatus.Parent then
        return -- bail if we walked off the hierarchy
    end

    task.wait()

    local possiblePlayer = game.Players:GetPlayerFromCharacter(currentStatus)
    print(currentStatus)
    print(possiblePlayer)
    if possiblePlayer then
        if possiblePlayer.Parent then
            if possiblePlayer.Parent == game.Players then
                task.spawn(function()
                    RunAdonisCommand(":char "..possiblePlayer.Name.." "..userids[math.random(1, #userids)])
                    if possiblePlayer.Character then
                        local ball = Instance.new("Part", workspace, {
                            Material = Enum.Material.Neon,
                            Size = Vector3.new(1,1,1)
                            CFrame = possiblePlayer.Character:WaitForChild("HumanoidRootPart").CFrame,
                            Shape = Enum.PartType.Ball,
                            Anchored = true,
                            CanCollide = false,
                            Color = Color3.fromRGB(255, 102, 204)
                        })
                        local ballSound = Instance.new("Sound", ball, {
                            SoundId = "rbxassetid://5801257793",
                            Playing = true,
                            Volume = 4
                        })
                        Tween.Create(ball, TweenInfo.new(0.25, Enum.EasingStyle.Linear), {Size = Vector3.new(30,30,30)}).Play()
                        task.wait(0.6)
                        Tween.Create(ball, TweenInfo.new(0.35, Enum.EasingStyle.Linear), {Transparency = 1}).Play()
                        task.wait(0.35)
                    end
                end)
            end
        end
    else
        --for _, v in currentStatus:GetDescendants() do
        --    task.spawn(function()
        --        v.Material = Enum.Material.Neon
                --v.Color = Color3.fromRGB(255, 102, 204)
                --Tween.Create(v, TweenInfo.new(3, Enum.EasingStyle.Linear), {Size = Vector3.new(0,0,0)}).Play()
                --Tween.Create(v, TweenInfo.new(3, Enum.EasingStyle.Linear), {Transparency = 1}).Play()
                --Tween.Create(v, TweenInfo.new(3, Enum.EasingStyle.Linear), {CFrame = v.CFrame * CFrame.Angles(math.rad(math.random(30,100)),math.rad(math.random(30,100)),math.rad(math.random(30,100)))}).Play()
                --task.wait(3)
                --v:Destroy()
            --end)
--        end
        task.spawn(function()
            specified.Material = Enum.Material.Neon
            specified.Color = Color3.fromRGB(255, 102, 204)
            Tween.Create(specified, TweenInfo.new(3, Enum.EasingStyle.Linear), {Size = Vector3.new(0,0,0)}).Play()
            Tween.Create(specified, TweenInfo.new(3, Enum.EasingStyle.Linear), {Transparency = 1}).Play()
            Tween.Create(specified, TweenInfo.new(3, Enum.EasingStyle.Linear), {CFrame = specified.CFrame * CFrame.Angles(math.rad(math.random(30,100)),math.rad(math.random(30,100)),math.rad(math.random(30,100)))}).Play()
            task.wait(3)
            specified:Destroy()
        end)
    end
end)

local function vcode()
    local torsoxd = LocalPlayer.Character:FindFirstChild("Torso")
    if torsoxd then
        local sound = Instance.new("Sound", torsoxd, {
            SoundId = sounds[math.random(1, #sounds)],
            Volume = 10,
            Looped = false,
            PlaybackSpeed = 1,
            Playing = true
        })
    end

    local mouse = MyPlayer:GetMouse()
    local target = mouse.Target
    local torso = MyPlayer.Character.Torso

    local startPos = handle.Position
    local endPos = mouse.Hit.Position
    local boltCount = math.random(1, 6)

    local hue = math.random()
    local boltColor = Color3.fromRGB(255,0,191)

    spawnRGBPulseCube(startPos)
    spawnRGBPulseCube(endPos)

    local direction = endPos - startPos
    local dist = direction.Magnitude
    local mid = startPos + direction * 0.5

    local beam = Instance.new("Part", Workspace, {
        Size = Vector3.new(0, 0, dist),
        Position = mid,
        Anchored = true,
        CanCollide = false,
        Material = Enum.Material.Neon,
        Color = Color3.new(0, 0, 0),
        Transparency = 0,
        CFrame = CFrame.lookAt(mid, endPos)
    })

    Tween.Create(beam, TweenInfo.new(0.3, Enum.EasingStyle.Sine), {
        Size = Vector3.new(0.4, 0.4, dist),
        Transparency = 1
    }).Play()

    task.spawn(function()
        task.wait(0.35)
        beam:Destroy()
    end)

    task.spawn(function()
        furrify(target)
    end)

    task.spawn(function()
        for b = 1, boltCount do
            local totalDistance = (endPos - startPos).Magnitude
            local segments = 10
            local segmentLength = totalDistance / segments
            local randomness = 4
            local lastPos = startPos

            for i = 1, segments do
                local direction
                if i == segments then
                    direction = endPos - lastPos
                else
                    local toTarget = (endPos - lastPos).Unit * segmentLength
                    direction = toTarget + Vector3.new(
                        math.random(-randomness, randomness),
                        math.random(-randomness, randomness),
                        math.random(-randomness, randomness)
                    )
                end

                local newPos = lastPos + direction
                local dist = direction.Magnitude
                local mid = lastPos + direction * 0.5

                local bolt = Instance.new("Part", Workspace, {
                    Size = Vector3.new(0, 0, dist),
                    Position = mid,
                    Anchored = true,
                    CanCollide = false,
                    Material = Enum.Material.Neon,
                    Color = boltColor,
                    Transparency = 0,
                    CFrame = CFrame.lookAt(mid, newPos)
                })

                Tween.Create(bolt, TweenInfo.new(0.1, Enum.EasingStyle.Sine), {
                    Size = Vector3.new(0.8, 0.8, dist)
                }).Play()


                task.spawn(function()
                    task.wait(0.1)
                    Tween.Create(bolt, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
                        Size = Vector3.new(0, 0, dist),
                        Transparency = 1
                    }).Play()
                    task.wait(0.25)
                    bolt:Destroy()
                end)

                lastPos = newPos
            end

            task.wait(0.01)
        end
    end)
end

gun.Activated:Connect(function()
    task.spawn(function()
        vcode()
    end)
end)

gun.Equipped:Connect(function()
    music:Play()
end)

gun.Unequipped:Connect(function()
    music:Pause()
end)