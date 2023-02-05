--make sure parts have unique names

code = "local model = Instance.new(\"Model\",workspace)\n\n"
scode = ""
tcode = ""

local function newline(line, order)
	if order == 1 then code = code..line.."\n" end
	if order == 2 then scode = scode..line.."\n" end
	if order == 3 then tcode = tcode..line.."\n" end
end

welds = 0

for i,v in pairs(script.Parent:GetDescendants()) do
	if v:IsA("Part") then
		newline("local "..v.Name.." = Instance.new(\"Part\",model)", 1)
		newline(v.Name..".Size = Vector3.new("..v.Size.X..","..v.Size.Y..","..v.Size.Z..")", 1)
		if v.Shape ~= Enum.PartType.Block then
			newline(v.Name..".Shape = "..tostring(v.Shape), 1)
		end
		newline("", 1)
	end
	if v:IsA("Weld") then
		welds = welds + 1
		newline("local weld"..tostring(welds).." = Instance.new(\"Weld\",model)", 2)
		newline("weld"..tostring(welds)..".Part0 = "..tostring(v.Part0), 2)
		newline("weld"..tostring(welds)..".Part1 = "..tostring(v.Part1), 2)
		newline("weld"..tostring(welds)..".C0 = CFrame.new("..tostring(v.C0)..")", 2)
		newline("weld"..tostring(welds)..".C1 = CFrame.new("..tostring(v.C1)..")", 2)
		newline("", 2)
	end
	if v:IsA("HingeConstraint") then
		newline("local hinge = Instance.new(\"HingeConstraint\",model)", 3)
		newline("local att0 = Instance.new(\"Attachment\","..v.Attachment0.Parent.Name..")", 3)
		newline("att0.CFrame = CFrame.new("..tostring(v.Attachment0.CFrame)..")", 3)
		newline("local att1 = Instance.new(\"Attachment\","..v.Attachment1.Parent.Name..")", 3)
		newline("att1.CFrame = CFrame.new("..tostring(v.Attachment1.CFrame)..")", 3)
		newline("hinge.Attachment0 = att0", 3)
		newline("hinge.Attachment1 = att1", 3)
		newline("", 3)
	end
end

code = code..scode..tcode

print(code)

loadstring(code)()
