local opt = 10
local openscript = false
local mainq = Instance.new("ScreenGui",game.Players.LocalPlayer:WaitForChild("PlayerGui"))
mainq.ResetOnSpawn = false
local Frame = Instance.new('Frame',mainq)
Frame.Size = UDim2.new(0.5,0,0.5,0)
Frame.Active = true
Frame.Draggable = true
Frame.BackgroundColor3 = Color3.new(0.8,0.8,0.8)
Frame.BorderSizePixel = 0
local text = Instance.new('TextLabel',Frame)
text.Size = UDim2.new(1,0,0.3,0)
text.BackgroundTransparency = 1
text.Font = Enum.Font.RobotoMono
text.TextScaled = true
text.Text = 'Enable Tab Optimization?'
local b1 = Instance.new('TextButton',Frame)
b1.BackgroundColor3 = Color3.new(0.8,0.8,0.8)
b1.Size = UDim2.new(0.5,0,0.7)
b1.Position = UDim2.new(0,0,0.3,0)
b1.BorderSizePixel = 1
b1.TextScaled = true
b1.Text = 'Turn on'
local b2 = Instance.new('TextButton',Frame)
b2.BackgroundColor3 = Color3.new(0.8,0.8,0.8)
b2.Size = UDim2.new(0.5,0,0.7)
b2.Position = UDim2.new(0.5,0,0.3,0)
b2.BorderSizePixel = 1
b2.TextScaled = true
b2.Text = 'Turn off'
function Activated()
	b1.Active = false
	b2.Active = false
	game:GetService('TweenService'):Create(Frame,TweenInfo.new(2,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Size = UDim2.new(0.5,0,0,0)}):Play()
	task.wait(2)
	mainq:Destroy()
end
b1.Activated:Connect(function()
	openscript = true
end)
b2.Activated:Connect(function()
	opt = 1
	openscript = true
end)
b1.Activated:Connect(Activated)
b2.Activated:Connect(Activated)
while wait(0.1) do
	if openscript == true then
		break
	end
end
local main = Instance.new("ScreenGui")
local Frame = Instance.new("ScrollingFrame")
local ui = Instance.new('UIListLayout',Frame)
local close = Instance.new('TextButton')
local closeframe = Instance.new('Frame')
local leader = false
local leadernumber = 0
local checkteam = false
for _,v in pairs(game.Teams:GetChildren()) do
	if v.ClassName == 'Team' then
		checkteam = true
	end
end
main.Name = "main"
main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
main.IgnoreGuiInset = true
main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
main.ResetOnSpawn = false 

Frame.Parent = main
if game.Players.LocalPlayer:FindFirstChild('leaderstats') then
	leader = true
	for ileader,vleader in pairs(game.Players.LocalPlayer:FindFirstChild('leaderstats'):GetChildren()) do
		leadernumber = ileader
	end
	if leadernumber >= 3 then
		Frame.Position = UDim2.new(0.6,0,0,0)
		Frame.Size = UDim2.new(0.4,0,0.45,0)
	else
		Frame.Position = UDim2.new(0.7,0,0,0)
		Frame.Size = UDim2.new(0.3,0,0.5,0)
end
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
			if leadernumber >= 3 then
				game:GetService('TweenService'):Create(Frame,TweenInfo.new(0.5,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Position = UDim2.new(0.6,0,-2,0)}):Play()
			else
				game:GetService('TweenService'):Create(Frame,TweenInfo.new(0.5,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Position = UDim2.new(0.7,0,-2,0)}):Play()
			end
		end
		task.wait(0.5)
	Frame.Visible = false
		close.Text = 'open'
	else
		if leader == false then
		game:GetService('TweenService'):Create(Frame,TweenInfo.new(0.5,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Position = UDim2.new(0.8,0,0,0)}):Play()
		else
			if leadernumber >= 3 then
				game:GetService('TweenService'):Create(Frame,TweenInfo.new(0.5,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Position = UDim2.new(0.6,0,0,0)}):Play()
			else
				game:GetService('TweenService'):Create(Frame,TweenInfo.new(0.5,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Position = UDim2.new(0.7,0,0,0)}):Play()
			end
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
game.StarterGui:SetCore('SendNotification',{Title = 'Loaded scriptV4';Text = 'SCRIPT BY KOLUA28';Icon = 'http://www.roblox.com/asset/?id=11982227421';})
while wait(opt) do
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
		tabs.BackgroundTransparency = 0.5
		if checkteam == true then
			tabs.BackgroundColor3 = v.TeamColor.Color
			local teamname = Instance.new('TextLabel',tabs)
			teamname.Size = UDim2.new(1,0,0.3,0)
			teamname.BorderSizePixel = 0
			teamname.BackgroundColor3 = Color3.new(0,0,0)
			teamname.BackgroundTransparency = 0.8
			teamname.TextScaled = true
			teamname.TextColor3 = Color3.new(1,1,1)
			teamname.Text = v.Team.Name
			else
		tabs.BackgroundColor3 = Color3.new(1, 1, 1)
		end
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
			if checkteam == true then
				frmtab.BackgroundColor3 = v.TeamColor.Color
				local teamname = Instance.new('TextLabel',frmtab)
				teamname.Size = UDim2.new(0.5,0,0.3,0)
				teamname.BorderSizePixel = 0
				teamname.BackgroundColor3 = Color3.new(0,0,0)
				teamname.BackgroundTransparency = 0.8
				teamname.TextScaled = true
				teamname.TextColor3 = Color3.new(1,1,1)
				teamname.Text = v.Team.Name
			else
				frmtab.BackgroundColor3 = Color3.new(1, 1, 1)
			end
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
			if leadernumber == 1 then
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
			elseif leadernumber == 2 then
				local textvalue = Instance.new('TextLabel',fmtab)
				textvalue.BackgroundTransparency = 1
				textvalue.Size = UDim2.new(0.5,0,0.5,0)
				textvalue.TextScaled = true
				textvalue.Font = Enum.Font.RobotoMono
				local textvalue1 = Instance.new('TextLabel',fmtab)
				textvalue1.BackgroundTransparency = 1
				textvalue1.Size = UDim2.new(0.5,0,0.5,0)
				textvalue1.Position = UDim2.new(0,0,0.5,0)
				textvalue1.TextScaled = true
				textvalue1.Font = Enum.Font.RobotoMono
				local textvalue2 = Instance.new('TextLabel',fmtab)
				textvalue2.BackgroundTransparency = 1
				textvalue2.Size = UDim2.new(0.5,0,0.5,0)
				textvalue2.Position = UDim2.new(0.5,0,0,0)
				textvalue2.TextScaled = true
				textvalue2.Font = Enum.Font.RobotoMono
				local textvalue3 = Instance.new('TextLabel',fmtab)
				textvalue3.BackgroundTransparency = 1
				textvalue3.Size = UDim2.new(0.5,0,0.5,0)
				textvalue3.Position = UDim2.new(0.5,0,0.5,0)
				textvalue3.TextScaled = true
				textvalue3.Font = Enum.Font.RobotoMono
				for im, vm in v:FindFirstChild('leaderstats'):GetChildren() do
					if im == 1 then
					textvalue.Text = vm.Name
					textvalue1.Text = vm.Value
					end
					if im == 2 then
						textvalue2.Text = vm.Name
						textvalue3.Text = vm.Value
					end
					end
			elseif leadernumber == 3 then
				local textvalue = Instance.new('TextLabel',fmtab)
				textvalue.BackgroundTransparency = 1
				textvalue.Size = UDim2.new(0.333,0,0.5,0)
				textvalue.TextScaled = true
				textvalue.Font = Enum.Font.RobotoMono
				local textvalue1 = Instance.new('TextLabel',fmtab)
				textvalue1.BackgroundTransparency = 1
				textvalue1.Size = UDim2.new(0.333,0,0.5,0)
				textvalue1.Position = UDim2.new(0,0,0.5,0)
				textvalue1.TextScaled = true
				textvalue1.Font = Enum.Font.RobotoMono
				local textvalue2 = Instance.new('TextLabel',fmtab)
				textvalue2.BackgroundTransparency = 1
				textvalue2.Size = UDim2.new(0.333,0,0.5,0)
				textvalue2.Position = UDim2.new(0.333,0,0,0)
				textvalue2.TextScaled = true
				textvalue2.Font = Enum.Font.RobotoMono
				local textvalue3 = Instance.new('TextLabel',fmtab)
				textvalue3.BackgroundTransparency = 1
				textvalue3.Size = UDim2.new(0.333,0,0.5,0)
				textvalue3.Position = UDim2.new(0.333,0,0.5,0)
				textvalue3.TextScaled = true
				textvalue3.Font = Enum.Font.RobotoMono
				local textvalue4 = Instance.new('TextLabel',fmtab)
				textvalue4.BackgroundTransparency = 1
				textvalue4.Size = UDim2.new(0.333,0,0.5,0)
				textvalue4.Position = UDim2.new(0.666,0,0,0)
				textvalue4.TextScaled = true
				textvalue4.Font = Enum.Font.RobotoMono
				local textvalue5 = Instance.new('TextLabel',fmtab)
				textvalue5.BackgroundTransparency = 1
				textvalue5.Size = UDim2.new(0.333,0,0.5,0)
				textvalue5.Position = UDim2.new(0.666,0,0.5,0)
				textvalue5.TextScaled = true
				textvalue5.Font = Enum.Font.RobotoMono
				for im, vm in v:FindFirstChild('leaderstats'):GetChildren() do
					if im == 1 then
						textvalue.Text = vm.Name
						textvalue1.Text = vm.Value
					end
					if im == 2 then
						textvalue2.Text = vm.Name
						textvalue3.Text = vm.Value
					end
					if im == 3 then
						textvalue4.Text = vm.Name
						textvalue5.Text = vm.Value
					end
				end
			elseif leadernumber >=4 then
				local textvalue = Instance.new('TextLabel',fmtab)
				textvalue.BackgroundTransparency = 1
				textvalue.Size = UDim2.new(0.25,0,0.5,0)
				textvalue.TextScaled = true
				textvalue.Font = Enum.Font.RobotoMono
				local textvalue1 = Instance.new('TextLabel',fmtab)
				textvalue1.BackgroundTransparency = 1
				textvalue1.Size = UDim2.new(0.25,0,0.5,0)
				textvalue1.Position = UDim2.new(0,0,0.5,0)
				textvalue1.TextScaled = true
				textvalue1.Font = Enum.Font.RobotoMono
				local textvalue2 = Instance.new('TextLabel',fmtab)
				textvalue2.BackgroundTransparency = 1
				textvalue2.Size = UDim2.new(0.25,0,0.5,0)
				textvalue2.Position = UDim2.new(0.25,0,0,0)
				textvalue2.TextScaled = true
				textvalue2.Font = Enum.Font.RobotoMono
				local textvalue3 = Instance.new('TextLabel',fmtab)
				textvalue3.BackgroundTransparency = 1
				textvalue3.Size = UDim2.new(0.25,0,0.5,0)
				textvalue3.Position = UDim2.new(0.25,0,0.5,0)
				textvalue3.TextScaled = true
				textvalue3.Font = Enum.Font.RobotoMono
				local textvalue4 = Instance.new('TextLabel',fmtab)
				textvalue4.BackgroundTransparency = 1
				textvalue4.Size = UDim2.new(0.25,0,0.5,0)
				textvalue4.Position = UDim2.new(0.5,0,0,0)
				textvalue4.TextScaled = true
				textvalue4.Font = Enum.Font.RobotoMono
				local textvalue5 = Instance.new('TextLabel',fmtab)
				textvalue5.BackgroundTransparency = 1
				textvalue5.Size = UDim2.new(0.25,0,0.5,0)
				textvalue5.Position = UDim2.new(0.5,0,0.5,0)
				textvalue5.TextScaled = true
				textvalue5.Font = Enum.Font.RobotoMono
				local textvalue6 = Instance.new('TextLabel',fmtab)
				textvalue6.BackgroundTransparency = 1
				textvalue6.Size = UDim2.new(0.25,0,0.5,0)
				textvalue6.Position = UDim2.new(0.75,0,0,0)
				textvalue6.TextScaled = true
				textvalue6.Font = Enum.Font.RobotoMono
				local textvalue7 = Instance.new('TextLabel',fmtab)
				textvalue7.BackgroundTransparency = 1
				textvalue7.Size = UDim2.new(0.25,0,0.5,0)
				textvalue7.Position = UDim2.new(0.75,0,0.5,0)
				textvalue7.TextScaled = true
				textvalue7.Font = Enum.Font.RobotoMono
				for im, vm in v:FindFirstChild('leaderstats'):GetChildren() do
					if im == 1 then
						textvalue.Text = vm.Name
						textvalue1.Text = vm.Value
					end
					if im == 2 then
						textvalue2.Text = vm.Name
						textvalue3.Text = vm.Value
					end
					if im == 3 then
						textvalue4.Text = vm.Name
						textvalue5.Text = vm.Value
					end
					if im == 4 then
						textvalue6.Text = vm.Name
						textvalue7.Text = vm.Value
					end
				end
			end
		end
	end
end
