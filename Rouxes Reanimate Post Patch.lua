wait(2)

Player = game.Players.LocalPlayer
OldChar = Player.Character

for i,v in pairs(OldChar.Humanoid:GetPlayingAnimationTracks()) do
	v:Stop()
end

OldChar.Archivable = true

NewChar = OldChar:Clone()
NewChar.Parent = workspace

NewChar.Name = "New"

NewChar.Head.face:Destroy()

for i,v in pairs(NewChar:GetDescendants()) do
	if v:IsA("Part") then
		v.Transparency = 1
	end
end

OldChar.Torso["Left Shoulder"]:Destroy()
OldChar.Torso["Right Shoulder"]:Destroy()
OldChar.Torso["Left Hip"]:Destroy()
OldChar.Torso["Right Hip"]:Destroy()

Player.Character = NewChar

NewChar.Animate.Disabled = true
NewChar.Animate.Disabled = false
OldChar.Animate.Disabled = true

RunService = game:GetService("RunService")
RunService.Stepped:Connect(function()
	OldChar.Torso.CanCollide = false
	OldChar.Head.CanCollide = false
end)


for i,v in next, OldChar:GetDescendants() do
	if v:IsA("BasePart") and v.Name ~="HumanoidRootPart" then
		game:GetService("RunService").Heartbeat:connect(function()
			v.Velocity = Vector3.new(0,35,0)
			wait(0.5)
		end)
	end
end


coroutine.wrap(function()
	while task.wait() do
		OldChar.HumanoidRootPart.CFrame = NewChar.Torso.CFrame
		OldChar["Left Arm"].CFrame = NewChar["Left Arm"].CFrame
		OldChar["Right Arm"].CFrame = NewChar["Right Arm"].CFrame
		OldChar["Left Leg"].CFrame = NewChar["Left Leg"].CFrame
		OldChar["Right Leg"].CFrame = NewChar["Right Leg"].CFrame
	end
end)()
