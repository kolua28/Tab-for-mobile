local main = Instance.new("ScreenGui")
local Frame = Instance.new("ScrollingFrame")
local ui = Instance.new('UIListLayout',Frame)
local close = Instance.new('TextButton')
local closeframe = Instance.new('Frame')
main.Name = "main"
main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
main.IgnoreGuiInset = true
main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
main.ResetOnSpawn = false 

Frame.Parent = main
Frame.Position = UDim2.new(0.8,0,0,0)
Frame.Size = UDim2.new(0.2,0,0.5,0)
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
closeframe.Position = UDim2.new(0.8,0,0.5,0)
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
		game:GetService('TweenService'):Create(Frame,TweenInfo.new(0.5,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Position = UDim2.new(0.8,0,-2,0)}):Play()
		task.wait(0.5)
	Frame.Visible = false
		close.Text = 'open'
	else
		game:GetService('TweenService'):Create(Frame,TweenInfo.new(0.5,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Position = UDim2.new(0.8,0,0,0)}):Play()
		Frame.Visible = true
		task.wait(0.5)
		close.Text = 'close'
	end
end

close.Activated:Connect(closee)

local tabs = Instance.new('TextLabel',Frame)
tabs.BorderSizePixel = 0
tabs.BackgroundTransparency = 0.5
tabs.BackgroundColor3 = Color3.new(1, 1, 1)
tabs.TextScaled = true
tabs.Font = Enum.Font.RobotoMono
tabs.Text = 'Wait...'
tabs.Size = UDim2.new(1,0,0.2,0)
game.StarterGui:SetCore('SendNotification',{Title = 'Loaded script V 0.0.1';Text = 'SCRIPT BY KOLUA28';Icon = 'http://www.roblox.com/asset/?id=11982227421';})
while wait(10) do
	for _,v in pairs(Frame:GetChildren()) do
		if v.ClassName == 'TextLabel' then
			v:Destroy()
		end
	end
	for i,v in pairs(game.Players:GetChildren()) do
		if v.ClassName == 'Player' then
		wait()
		local tabs = Instance.new('TextLabel',Frame)
		tabs.BorderSizePixel = 0
		tabs.BackgroundTransparency = 0.5
		tabs.BackgroundColor3 = Color3.new(1, 1, 1)
		tabs.TextScaled = true
		tabs.Font = Enum.Font.RobotoMono
		tabs.Text = v.Name
		tabs.Size = UDim2.new(1,0,0.2,0)
		end
	end
end