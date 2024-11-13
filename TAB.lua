local main = Instance.new("ScreenGui")
local Frame = Instance.new("ScrollingFrame")
local ui = Instance.new('UIListLayout',Frame)
local close = Instance.new('TextButton')
local closeframe = Instance.new('Frame')
local leader
main.Name = "main"
main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
main.IgnoreGuiInset = true
main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
main.ResetOnSpawn = false 

Frame.Parent = main
if game.Players.LocalPlayer:FindFirstChild('leaderstats') then
	leader = true
	Frame.Position = UDim2.new(0.7,0,0,0)
Frame.Size = UDim2.new(0.3,0,0.5,0)
else
	leader = false
	Frame.Position = UDim2.new(0.8,0,0,0)
Frame.Size = UDim2.new(0.2,0,0.5,0)
end
Frame.BackgroundColor3 = Color3.new(0.172549, 0.172549, 0.172549)
Frame.BorderSizePixel = 0
Frame.BackgroundTransparency = 0.5
Frame.ScrollBarThickness = 2
Frame.AutomaticCanvasSize = Enum.AutomaticSize.Y

closeframe.Size = UDim2.new(0.1,0,0.1,0)
closeframe.Active = true
closeframe.Draggable = true
closeframe.BackgroundColor3 = Color3.new(0, 0, 0)
closeframe.BorderSizePixel = 3
closeframe.Position = UDim2.new(0.9,0,0.5,0)
closeframe.Parent = main

close.Parent = closeframe
close.Size = UDim2.new(0.5,0,0.9,0)
close.BorderSizePixel = 0
close.BackgroundColor3 = Color3.new(0.819608, 0.819608, 0.819608)
close.Position = UDim2.new(0.05,0,0.05,0)
close.TextScaled = true
close.Font = Enum.Font.RobotoMono
close.Text = 'close'

function closee()
	if Frame.Visible == true then
		if leader == false then
		game:GetService('TweenService'):Create(Frame,TweenInfo.new(0.5,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Position = UDim2.new(0.8,0,-2,0)}):Play()
		else
		game:GetService('TweenService'):Create(Frame,TweenInfo.new(0.5,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Position = UDim2.new(0.7,0,-2,0)}):Play()
		end
		task.wait(0.5)
	Frame.Visible = false
		close.Text = 'open'
	else
		if leader == false then
		game:GetService('TweenService'):Create(Frame,TweenInfo.new(0.5,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Position = UDim2.new(0.8,0,0,0)}):Play()
		else
			game:GetService('TweenService'):Create(Frame,TweenInfo.new(0.5,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Position = UDim2.new(0.7,0,0,0)}):Play()
		end
		Frame.Visible = true
		task.wait(0.5)
		close.Text = 'close'
	end
end

close.Activated:Connect(closee)

local tabs = Instance.new('TextLabel',Frame)
tabs.Name = 'deletethis'
tabs.BorderSizePixel = 0
tabs.BackgroundTransparency = 0.5
tabs.BackgroundColor3 = Color3.new(1, 1, 1)
tabs.TextScaled = true
tabs.Font = Enum.Font.RobotoMono
tabs.Text = 'Wait...'
tabs.Size = UDim2.new(1,0,0.2,0)
game.StarterGui:SetCore('SendNotification',{Title = 'Loaded scriptV2';Text = 'SCRIPT BY KOLUA28';Icon = 'http://www.roblox.com/asset/?id=11982227421';})
while wait(10) do
	for _,v in pairs(Frame:GetChildren()) do
		if v.Name == 'deletethis' then
			v:Destroy()
		end
	end
	for i,v in pairs(game.Players:GetChildren()) do
		if v.ClassName == 'Player' and leader == false then
		wait()
		local tabs = Instance.new('TextLabel',Frame)
		tabs.Name = 'deletethis'
		tabs.BorderSizePixel = 0
		tabs.BackgroundTransparency = 0.8
		tabs.BackgroundColor3 = Color3.new(1, 1, 1)
		tabs.TextScaled = true
		tabs.Font = Enum.Font.RobotoMono
		tabs.Text = v.Name
		tabs.Size = UDim2.new(1,0,0.2,0)
		elseif v.ClassName == 'Player' and leader == true then
			local frmtab = Instance.new('Frame',Frame)
			frmtab.Name = 'deletethis'
			frmtab.Size = UDim2.new(1,0,0.2,0)
			frmtab.BorderSizePixel = 0
			frmtab.BackgroundTransparency = 0.5
			frmtab.BackgroundColor3 = Color3.new(1, 1, 1)
			local fmtab = Instance.new('Frame',frmtab)
			fmtab.Size = UDim2.new(0.5,0,1,0)
			fmtab.Position = UDim2.new(0.5,0,0,0)
			fmtab.BackgroundTransparency = 1
			local tabs = Instance.new('TextLabel',frmtab)
			tabs.BackgroundTransparency = 1
			tabs.TextScaled = true
			tabs.Font = Enum.Font.RobotoMono
			tabs.Text = v.Name
			tabs.Size = UDim2.new(0.5,0,1,0)
			local textvalue = Instance.new('TextLabel',fmtab)
			textvalue.BackgroundTransparency = 1
			textvalue.Size = UDim2.new(1,0,0.5,0)
			textvalue.TextScaled = true
			textvalue.Font = Enum.Font.RobotoMono
			local textvalue1 = Instance.new('TextLabel',fmtab)
			textvalue1.BackgroundTransparency = 1
			textvalue1.Size = UDim2.new(1,0,0.5,0)
			textvalue1.Position = UDim2.new(0,0,0.5,0)
			textvalue1.TextScaled = true
			textvalue1.Font = Enum.Font.RobotoMono
			for _, vm in v:FindFirstChild('leaderstats'):GetChildren() do
				textvalue.Text = vm.Name
				textvalue1.Text = vm.Value
			end
		end
	end
end
