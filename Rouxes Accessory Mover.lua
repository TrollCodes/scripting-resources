--Made by rouxhaver/1+1=2
--Run with a netbypass

player = game.Players.LocalPlayer
char = player.Character
vbreak = false

function rotate(X,Y,Z)
	return CFrame.Angles(math.rad(X),math.rad(Y),math.rad(Z))
end

function Join(Hat,Part,Offset,Rotation,Mesh)
	if Mesh == false then Hat.Handle:FindFirstChildWhichIsA("SpecialMesh"):Destroy() end
	Hat.Handle.AccessoryWeld:Destroy()
	local method = Instance.new("RopeConstraint",player.Character)
	method.Length = math.huge
	method.Attachment0 = Instance.new("Attachment",char.Head)
	method.Attachment1 = Instance.new("Attachment",Hat.Handle)
	coroutine.wrap(function()
		while task.wait() do
			Hat.Handle.CFrame = (Part.CFrame + Part.CFrame.LookVector * Offset.Z + Part.CFrame.RightVector * Offset.X + Part.CFrame.UpVector * Offset.Y) * Rotation
			if vbreak == true then break end
		end
	end)()
end

Join(
	player.Character["Pal Hair"], -- the Accessory
	player.Character.Torso, -- Part to attach to
	Vector3.new(3,1,0), -- offset
	rotate(0,45,0), -- Rotation
	false -- Keep mesh
)
