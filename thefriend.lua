var cachedEaten = nil
var cachedPlayer = false
var oldName = localplr.DisplayName

local function randomBetween(min, max)
	return math.random() * (max - min) + min
end

local phrases = {
	"feed me",
	"me friend",
	"hallo :)",
	"im yuor frien",
	"i need fod",
	"me bob friend :)",
	"lets be friends forever :)",
	"keep me safe pls i dont want eaten",
	"HELLLOO!O!!!!!!!",
	"i leiik all of you :3"
}

local didntEatPhrases = {
	"i didnt eat anything",
	"I NO EAT!!",
	"i no eat nothing"
}

local eatPhrases = {
	"but im hungry...",
	"fine..",
	"aw man"
	"sowwy :(",
	"my bad gng"
}

local abandonedPhrases = {
	"nnoOOOOO MY FRIIEND!!! :(((",
	"AAAAA",
	"help me",
	oldName.." COME BACK :("
}

local actionPhrases = {
	"MMM YUMMY",
	"YAY FOOD",
	"DELICOISU!!!!",
	"FOOD :33333"
}

local faceDecals = {
	"http://www.roblox.com/asset/?id=152527250",
	"http://www.roblox.com/asset/?id=15477500214",
	"http://www.roblox.com/asset/?id=7075492",
	"http://www.roblox.com/asset/?id=7131482",
	"http://www.roblox.com/asset/?id=7046277",
	"http://www.roblox.com/asset/?id=405706156"
}

local ballColors = {
	Color3.fromRGB(255, 188, 5),
	Color3.fromRGB(68, 5, 255),
	Color3.fromRGB(255,255,255),
	Color3.fromRGB(3, 255, 57),
	Color3.fromRGB(255, 100, 3),
	Color3.fromRGB(3, 251, 255),
	Color3.fromRGB(238, 3, 255),
	Color3.fromRGB(0,0,0)
}

local ballNames = {
	"Alex","Sam","Jordan","Taylor","Casey","Riley","Morgan","Jamie","Avery","Peyton",
	"Quinn","Dakota","Emerson","Reese","Parker","Rowan","Skyler","Cameron","Hayden","Logan",
	"Finley","Blake","Charlie","Drew","Elliot","Phoenix","Kai","River","Sage","Harper",
	"Jesse","Remy","Arden","Bailey","Brook","Corey","Devin","Evan","Gray","Hunter",
	"Jaden","Kendall","Lane","Marley","Micah","Noel","Oakley","Payton","Robin","Spencer",
	"Toby","Winter","Zion","Ali","Angel","Ash","Aubrey","Brett","Cory","Dallas",
	"Dylan","Ellis","Frankie","Gale","Harley","Indigo","Jay","Justice","Kris","Lee",
	"Lennon","Lou","Max","Milan","Montana","Murphy","Nico","Paris","Pat","Reagan",
	"Reed","Rory","Scout","Shawn","Sidney","Storm","Tatum","Teagan","Terry","Tristan",
	"Val","Wren","Zane","Addison","Adrian","Ainsley","Amari","Andy","Ari","Ashton",
	"Austin","Bell","Blair","Blue","Bowie","Bryn","Carter","Cassidy","Cedar","Channing",
	"Cody","Colby","Courtney","Dakari","Darian","Denver","Dorian","Eden","Emery","Everest",
	"Fletcher","Florian","Forrest","Hollis","Ira","Jasper","Jules","Kade","Karsyn","Keegan",
	"Kelsey","Kingsley","Kit","Laken","Landry","Lex","Linden","London","Luca","Maddox",
	"Marlow","Mason","Merritt","Monroe","Navy","Nell","Nolan","North","Onyx","Palmer",
	"Paxton","Presley","Quincy","Raleigh","Remington","Rene","Ridge","Ripley","Salem","Sawyer",
	"Shiloh","Sloan","Spence","Stevie","Sutton","Tanner","True","Vale","Vesper","Walker",
	"West","Wilder","Zephyr","Abby","Ace","Adley","Aiden","Alek","Amos","Arlo",
	"Ashley","Axton","Beck","Bennie","Berk","Blaine","Brett","Bronx","Campbell","Carmen",
	"Chance","Chris","Clarke","Conrad","Crew","Cruz","Dale","Darian","Dax","Denver",
	"Devon","Drew","Easton","Eli","Emmet","Erin","Ezra","Faris","Fin","Flynn",
	"Grey","Hale","Haven","Hero","Hugh","Indiana","Ivy","Jackie","Jett","Jo",
	"Joey","Jory","Kairo","Kasey","Kendrix","Kory","Lake","Lark","Lior","Lowell",
	"Lumi","Mack","Maddie","Marin","Mars","Maxwell","Mickey","Moe","Nash","Neo",
	"Oak","Ocean","Ollie","Orion","Perry","Raine","Rex","Rio","Roan","Rome",
	"Rumi","Saint","Sky","Sol","Sonny","Tate","Tiger","Toni","Trace","Truex",
	"Urban","Valeo","Vince","Weston","Wolf","Xen","Yale","Zen","Zuri","Adair",
	"Aiko","Alden","Ami","Aris","Asha","Aspen","Auden","Ayla","Banks","Basil",
	"Beau","Bellamy","Bex","Blaire","Brady","Briar","Cairo","Callan","Cato","Ciel",
	"Cosmo","Cy","Demi","Eliot","Elio","Ellery","Emrys","Fable","Ferris","Harlow",
	"Indy","Io","Jalen","Karma","Kei","Koda","Leighton","Lior","Lynx","Matis",
	"Merrick","Nova","Nuri","Odin","Page","Reef","Riven","Roux","Sable","Seven",
	"Skye","Sora","Talon","Toby","Torin","Vail","Waverly","Yael","Zaire","Zola"
}

local chosenFace = faceDecals[math.random(1, #faceDecals)]
local chosenColor = ballColors[math.random(1, #ballColors)]
local chosenName = ballNames[math.random(1, #ballNames)]

RunAdonisCommand(":chatnotifyc all 212,212,212 "..oldName.."s FRIEND, "..chosenName..", has joined the experience.")

local tool = Instance.new("Tool", workspace, {
	Grip = CFrame.fromMatrix(Vector3.new(0, 0, 1), Vector3.new(1, 0, 0), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1)),
	WorldPivot = CFrame.fromMatrix(Vector3.new(-2.69, 2.5, -3.0999), Vector3.new(1, 0, 0), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1)),
	Name = "Friend"
})

local friend = Instance.new("Part", tool, {
	Shape = Enum.PartType.Ball,
	BottomSurface = Enum.SurfaceType.Smooth,
	CFrame = localplr.Character.HumanoidRootPart.CFrame,
	Massless = true,
	Material = Enum.Material.SmoothPlastic,
	Reflectance = 0.8,
	Size = Vector3.new(3, 3, 3),
	Color = chosenColor
	TopSurface = Enum.SurfaceType.Smooth,
	Name = "Handle",
})

local face = Instance.new("Decal", friend, {
	Texture = chosenFace,
})

local soundMeow = Instance.new("Sound", friend, {
	SoundId = "rbxassetid://7148585764",
	Volume = 1.5
})

local soundEat = Instance.new("Sound", friend, {
	SoundId = "rbxassetid://1278031541",
	Volume = 1.5,
	PlaybackSpeed = 1.5
})

local soundSad = Instance.new("Sound", friend, {
	SoundId = "rbxassetid://6033154249",
	Volume = 1.5
})

local soundNo = Instance.new("Sound", friend, {
	SoundId = "rbxassetid://12221967",
	Volume = 1.5
})

local music = Instance.new("Sound", friend, {
	SoundId = "rbxassetid://120407167512855",
	Volume = 1,
	PlaybackSpeed = 0.9,
	Looped = true
})

local function speak(chat, noise)
	if noise then
		npc.DisplayBubble(friend, chat)
		soundMeow.PlaybackSpeed = randomBetween(0.5, 1.5)
		soundMeow:Play()
	else
		npc.DisplayBubble(friend, chat)
	end
	--RunAdonisCommand(":chatnotifyc all 255,255,255 "..oldName.." friend: "..chat)
end
local holdingFriend = false
local firstTime = true

local function eat(parst)
	if parst then
		local cache = Clone(parst)
		cache.Parent = game.Lighting
		cachedEaten = cache
		parst:Destroy()
		soundEat:Play()
		speak(actionPhrases[math.random(1, #actionPhrases)], false)
		task.spawn(function()
			face.Texture = "http://www.roblox.com/asset/?id=18510266566"
			task.wait(0.5)
			face.Texture = "http://www.roblox.com/asset/?id=152527250"
		end)
		task.spawn(function()
			friend.Size = Vector3.new(4,4,4)
			task.wait(0.5)
			friend.Size = Vector3.new(3,3,3)
		end)
	end
end

friend.Touched:Connect(function(hit)
	if hit and hit.Parent ~= localplr.Character and hit.Parent.Parent ~= localplr.Character and holdingFriend then
		if hit.Parent.Name ~= "Friend" then
			if hit.Parent:FindFirstChild("Humanoid") then
				local possiblePlayer = game.Players:GetPlayerFromCharacter(hit.Parent)
				if possiblePlayer.Parent == game.Players then
					cachedPlayer = possiblePlayer
					cachedPlayer.Character.Humanoid.RequiresNeck = false
				end
				eat(hit)
			elseif hit.Parent.Parent:FindFirstChild("Humanoid") then
				local possiblePlayer = game.Players:GetPlayerFromCharacter(hit.Parent.Parent)
				if possiblePlayer.Parent == game.Players then
					cachedPlayer = possiblePlayer
					cachedPlayer.Character.Humanoid.RequiresNeck = false
				end
				eat(hit)
			else
				cachedPlayer = false
				eat(hit)
			end
		else
			speak("NEW FRIEND HIIII :)", true)
		end
	end
end)

tool.Equipped:Connect(function()
	speak("YAY HELLO "..tool.Parent.Name.."!!!!!", true)
	if firstTime then
		firstTime = false
		music.Playing = true
		task.wait(0.45)
		speak("my name is "..string.lower(chosenName).." :)", true)
	end
	if localplr.Character:FindFirstChild("Humanoid") then
		localplr.Character:FindFirstChild("Humanoid").DisplayName = oldName.." with FREND!!1!"
	end
	holdingFriend = true
	task.spawn(function()
		while holdingFriend do
			if not holdingFriend then
				break
			end
			task.wait(10)
			if holdingFriend then
				speak(phrases[math.random(1, #phrases)], true)
			end
		end
	end)
end)

tool.Unequipped:Connect(function()
	if localplr.Character:FindFirstChild("Humanoid") then
		localplr.Character:FindFirstChild("Humanoid").DisplayName = ""
	end
	holdingFriend = false
	if tool.Parent ~= workspace then
		friend.CFrame = friend.CFrame * CFrame.new(0, 400, 0)
	else
		speak("nnooOOOOOO MY FRIEND!! :((", true)
	end
end)

local chatConnection
chatConnection = localplr.Chatted:Connect(function(msg)
	if string.find(string.lower(msg), "spit") then
		if cachedEaten == nil then
			speak(didntEatPhrases[math.random(1, #didntEatPhrases)], false)
			soundNo:Play()
		else
			speak(eatPhrases[math.random(1, #eatPhrases)], false)
			if cachedPlayer ~= false then
				cachedPlayer:LoadCharacter()
				local temppart = Instance.new("Part", cachedPlayer.Character)
				cachedPlayer.Character:PivotTo(friend.CFrame * CFrame.new(0,3,-7))
				task.wait(0.15)
				cachedPlayer.Character:FindFirstChild("Humanoid").Sit = true
			else
				cachedEaten.Parent = workspace
			end
			task.spawn(function()
				face.Texture = "http://www.roblox.com/asset/?id=75212746"
				task.wait(1)
				face.Texture = "http://www.roblox.com/asset/?id=152527250"
			end)
			soundSad:Play()
			--cachedEaten = nil
			--cachedPlayer = false
		end
	end
	if string.find(string.lower(msg), "friend") or string.find(string.lower(msg), string.lower(chosenName)) then
		if string.find(string.lower(msg), "your name") then
			speak("my name is "..chosenName.." ya!!", true)
		end
		if string.find(string.lower(msg), "your owner") or string.find(string.lower(msg), "your friend") then
			speak(oldName.." is my BEST FREND!!!!!", true)
		end
		if string.find(string.lower(msg), "escape") then
			speak("GET AWAY FROM ME "..tool.Parent.Name.."!!!!!", true)
			RunAdonisCommand(":droptools "..tool.Parent.Name)
		end
	end
end)

tool.Destroying:Connect(function()
	if chattedConnection then
		chattedConnection:Disconnect()
		chattedConnection = nil
	end
end)
