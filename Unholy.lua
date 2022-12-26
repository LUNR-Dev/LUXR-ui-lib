local lib = {}

local ScreenGui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")




local UICorner_8 = Instance.new("UICorner")
local DragA = Instance.new("Frame")
local UICorner_9 = Instance.new("UICorner")
local Blocker = Instance.new("Frame")




function lib:SetupName(Text)
	local SetupName = Instance.new("TextLabel")
	SetupName.Name = "Setup Name"
	SetupName.Parent = DragA
	SetupName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SetupName.BackgroundTransparency = 1.000
	SetupName.Position = UDim2.new(0.178913742, 0, 0, 0)
	SetupName.Size = UDim2.new(0, 200, 0, 36)
	SetupName.Font = Enum.Font.GothamBold
	SetupName.Text = Text
	SetupName.TextColor3 = Color3.fromRGB(255, 255, 255)
	SetupName.TextSize = 14.000
end

function lib:Drag()
	local function DTRFE_fake_script() -- Main.Smooth GUI Dragging 
		local script = Instance.new('LocalScript', Main)

		local UserInputService = game:GetService("UserInputService")
		local runService = (game:GetService("RunService"));

		local gui = script.Parent
		local dragger = script.Parent.DragA

		local dragging
		local dragInput
		local dragStart
		local startPos

		function Lerp(a, b, m)
			return a + (b - a) * m
		end;

		local lastMousePos
		local lastGoalPos
		local DRAG_SPEED = (8); -- // The speed of the UI darg.
		function Update(dt)
			if not (startPos) then return end;
			if not (dragging) and (lastGoalPos) then
				gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED))
				return 
			end;

			local delta = (lastMousePos - UserInputService:GetMouseLocation())
			local xGoal = (startPos.X.Offset - delta.X);
			local yGoal = (startPos.Y.Offset - delta.Y);
			lastGoalPos = UDim2.new(startPos.X.Scale, xGoal, startPos.Y.Scale, yGoal)
			gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, xGoal, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, yGoal, dt * DRAG_SPEED))
		end;

		dragger.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = true
				dragStart = input.Position
				startPos = gui.Position
				lastMousePos = UserInputService:GetMouseLocation()

				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragging = false
					end
				end)
			end
		end)

		dragger.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end)

		runService.Heartbeat:Connect(Update)
	end
	coroutine.wrap(DTRFE_fake_script)()
end



function lib:MakeToggle(Text,callback)
	local Toggle = Instance.new("Frame")
	local UICorner_4 = Instance.new("UICorner")
	local ToggleText = Instance.new("TextLabel")
	local ToggleButton = Instance.new("ImageLabel")
	local Button = Instance.new("TextButton")
	local Circle = Instance.new("ImageLabel")
	Toggle.Name = "Toggle"
	Toggle.Parent = ScrollingFrame
	Toggle.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
	Toggle.Size = UDim2.new(0, 313, 0, 49)

	UICorner_4.Parent = Toggle

	ToggleText.Name = "ToggleText"
	ToggleText.Parent = Toggle
	ToggleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ToggleText.BackgroundTransparency = 1.000
	ToggleText.Position = UDim2.new(0.0191693287, 0, 0.20408164, 0)
	ToggleText.Size = UDim2.new(0, 184, 0, 29)
	ToggleText.Font = Enum.Font.GothamBold
	ToggleText.Text = Text
	ToggleText.TextColor3 = Color3.fromRGB(255, 255, 255)
	ToggleText.TextSize = 14.000
	ToggleText.TextXAlignment = Enum.TextXAlignment.Left

	ToggleButton.Name = "ToggleButton"
	ToggleButton.Parent = Toggle
	ToggleButton.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
	ToggleButton.BackgroundTransparency = 1.000
	ToggleButton.Position = UDim2.new(0.870607018, -23, 0.5, -11)
	ToggleButton.Size = UDim2.new(0, 46, 0, 22)
	ToggleButton.Image = "rbxassetid://3570695787"
	ToggleButton.ImageColor3 = Color3.fromRGB(200, 200, 200)
	ToggleButton.ScaleType = Enum.ScaleType.Slice
	ToggleButton.SliceCenter = Rect.new(100, 100, 100, 100)
	ToggleButton.SliceScale = 0.120

	Button.Name = "Button"
	Button.Parent = ToggleButton
	Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Button.BackgroundTransparency = 1.000
	Button.Size = UDim2.new(1, 0, 1, 0)
	Button.Font = Enum.Font.SourceSans
	Button.TextColor3 = Color3.fromRGB(0, 0, 0)
	Button.TextSize = 14.000
	Button.TextTransparency = 1.000

	Circle.Name = "Circle"
	Circle.Parent = ToggleButton
	Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Circle.BackgroundTransparency = 1.000
	Circle.Position = UDim2.new(0, 2, 0, 2)
	Circle.Size = UDim2.new(0, 18, 0, 18)
	Circle.Image = "rbxassetid://3570695787"
	Circle.ScaleType = Enum.ScaleType.Slice
	Circle.SliceCenter = Rect.new(100, 100, 100, 100)
	Circle.SliceScale = 0.120

	local function RKJW_fake_script() -- ToggleButton.Script 
		local script = Instance.new('LocalScript', ToggleButton)

		local toggled = false -- The start state of the toggle
		local debounce = false -- Debounce / cooldown so you cant spam the toggle and break it

		script.Parent.Button.MouseButton1Click:Connect(function() -- Gets executed when you click the button
			if debounce == false then
				if toggled == true then -- If the toggle is already on
					debounce = true
					game:GetService("TweenService"):Create(script.Parent, TweenInfo.new(0.25), {ImageColor3 = Color3.fromRGB(200, 200, 200)}):Play()
					game:GetService("TweenService"):Create(script.Parent.Circle, TweenInfo.new(0.25), {Position = UDim2.new(0,2,0,2)}):Play()
					wait(0.25)
					debounce = false
					toggled = false
					pcall(callback, false) -- REMOVE THIS IF YOUR NOT GONNA USE THE TOGGLE FOR AN UI LIBRARY!!!
				elseif toggled == false then -- If the toggle isnt already on
					debounce = true
					game:GetService("TweenService"):Create(script.Parent, TweenInfo.new(0.25), {ImageColor3 = Color3.fromRGB(64, 200, 114)}):Play()
					game:GetService("TweenService"):Create(script.Parent.Circle, TweenInfo.new(0.25), {Position = UDim2.new(1,-20,0,2)}):Play()
					wait(0.25)
					debounce = false
					toggled = true
					pcall(callback, true) -- REMOVE THIS IF YOUR NOT GONNA USE THE TOGGLE FOR AN UI LIBRARY!!!
				end
			end
		end)
	end
	coroutine.wrap(RKJW_fake_script)()
end



function lib:MakeSlider(Text,minvalue,maxvalue,callback)
	local SliderButton = Instance.new("TextButton")
	local SliderFill = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local UICorner_3 = Instance.new("UICorner")
	local SliderText = Instance.new("TextLabel")
	local SliderValue = Instance.new("TextLabel")
	local Slider = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")

	SliderButton.Name = "SliderButton"
	SliderButton.Parent = Slider
	SliderButton.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
	SliderButton.Position = UDim2.new(0, 0, 0.591836751, 0)
	SliderButton.Size = UDim2.new(0, 313, 0, 12)
	SliderButton.Font = Enum.Font.SourceSans
	SliderButton.Text = ""
	SliderButton.TextColor3 = Color3.fromRGB(0, 0, 0)
	SliderButton.TextSize = 14.000

	SliderFill.Name = "SliderFill"
	SliderFill.Parent = SliderButton
	SliderFill.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	SliderFill.Size = UDim2.new(0, 0, 1, 0)

	UICorner_2.Parent = SliderFill

	UICorner_3.Parent = SliderButton

	SliderText.Name = "SliderText"
	SliderText.Parent = Slider
	SliderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SliderText.BackgroundTransparency = 1.000
	SliderText.Position = UDim2.new(0.0191693287, 0, 0, 0)
	SliderText.Size = UDim2.new(0, 184, 0, 29)
	SliderText.Font = Enum.Font.GothamBold
	SliderText.Text = Text
	SliderText.TextColor3 = Color3.fromRGB(255, 255, 255)
	SliderText.TextSize = 14.000
	SliderText.TextXAlignment = Enum.TextXAlignment.Left

	SliderValue.Name = "SliderValue"
	SliderValue.Parent = Slider
	SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SliderValue.BackgroundTransparency = 1.000
	SliderValue.Position = UDim2.new(0.357827455, 0, 0, 0)
	SliderValue.Size = UDim2.new(0, 184, 0, 29)
	SliderValue.Font = Enum.Font.GothamBold
	SliderValue.Text = "0"
	SliderValue.TextColor3 = Color3.fromRGB(108, 108, 108)
	SliderValue.TextSize = 14.000
	SliderValue.TextXAlignment = Enum.TextXAlignment.Right
	Slider.Name = "Slider"
	Slider.Parent = ScrollingFrame
	Slider.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
	Slider.Size = UDim2.new(0, 313, 0, 49)

	UICorner.Parent = Slider
	
	
	
	-----Values-----
	minvalue = minvalue or 0
	maxvalue = maxvalue or 100


	-----Callback-----
	callback = callback or function() end


	-----Variables-----
	local mouse = game.Players.LocalPlayer:GetMouse()
	local uis = game:GetService("UserInputService")
	local Value;




	-----Main Code-----

	SliderButton.MouseButton1Down:Connect(function()
		Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 313) * SliderFill.AbsoluteSize.X) + tonumber(minvalue)) or 0
		pcall(function()
			callback(Value)
		end)
		SliderFill.Size = UDim2.new(0, math.clamp(mouse.X - SliderFill.AbsolutePosition.X, 0, 313), 0, 12)
		moveconnection = mouse.Move:Connect(function()
			SliderValue.Text = Value
			Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 313) * SliderFill.AbsoluteSize.X) + tonumber(minvalue))
			pcall(function()
				callback(Value)
			end)
			SliderFill.Size = UDim2.new(0, math.clamp(mouse.X - SliderFill.AbsolutePosition.X, 0, 313), 0, 12)
		end)
		releaseconnection = uis.InputEnded:Connect(function(Mouse)
			if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
				Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 313) * SliderFill.AbsoluteSize.X) + tonumber(minvalue))
				pcall(function()
					callback(Value)
				end)
				SliderFill.Size = UDim2.new(0, math.clamp(mouse.X - SliderFill.AbsolutePosition.X, 0, 313), 0, 12)
				moveconnection:Disconnect()
				releaseconnection:Disconnect()
			end
		end)
	end)
end

function lib:MakeToggleSlider(Text,minvalue,maxvalue,slidercallback,togglecallback)
	local SliderWithToggle = Instance.new("Frame")
	local UICorner_5 = Instance.new("UICorner")
	local ToggleText_2 = Instance.new("TextLabel")
	local ToggleButton_2 = Instance.new("ImageLabel")
	local Button_2 = Instance.new("TextButton")
	local Circle_2 = Instance.new("ImageLabel")
	local SliderButton_2 = Instance.new("TextButton")
	local SliderFill_2 = Instance.new("Frame")
	local UICorner_6 = Instance.new("UICorner")
	local UICorner_7 = Instance.new("UICorner")
	local SliderValue_2 = Instance.new("TextLabel")
	SliderWithToggle.Name = "SliderWithToggle"
	SliderWithToggle.Parent = ScrollingFrame
	SliderWithToggle.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
	SliderWithToggle.Size = UDim2.new(0, 313, 0, 49)

	UICorner_5.Parent = SliderWithToggle

	ToggleText_2.Name = "ToggleText"
	ToggleText_2.Parent = SliderWithToggle
	ToggleText_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ToggleText_2.BackgroundTransparency = 1.000
	ToggleText_2.Position = UDim2.new(0.0191693287, 0, 0, 0)
	ToggleText_2.Size = UDim2.new(0, 135, 0, 23)
	ToggleText_2.Font = Enum.Font.GothamBold
	ToggleText_2.Text = Text
	ToggleText_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	ToggleText_2.TextSize = 14.000
	ToggleText_2.TextXAlignment = Enum.TextXAlignment.Left

	ToggleButton_2.Name = "ToggleButton"
	ToggleButton_2.Parent = SliderWithToggle
	ToggleButton_2.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
	ToggleButton_2.BackgroundTransparency = 1.000
	ToggleButton_2.Position = UDim2.new(0.876996815, -23, 0.683673501, -11)
	ToggleButton_2.Size = UDim2.new(0, 46, 0, 22)
	ToggleButton_2.Image = "rbxassetid://3570695787"
	ToggleButton_2.ImageColor3 = Color3.fromRGB(200, 200, 200)
	ToggleButton_2.ScaleType = Enum.ScaleType.Slice
	ToggleButton_2.SliceCenter = Rect.new(100, 100, 100, 100)
	ToggleButton_2.SliceScale = 0.120

	Button_2.Name = "Button"
	Button_2.Parent = ToggleButton_2
	Button_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Button_2.BackgroundTransparency = 1.000
	Button_2.Size = UDim2.new(1, 0, 1, 0)
	Button_2.Font = Enum.Font.SourceSans
	Button_2.TextColor3 = Color3.fromRGB(0, 0, 0)
	Button_2.TextSize = 14.000
	Button_2.TextTransparency = 1.000

	Circle_2.Name = "Circle"
	Circle_2.Parent = ToggleButton_2
	Circle_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Circle_2.BackgroundTransparency = 1.000
	Circle_2.Position = UDim2.new(0, 2, 0, 2)
	Circle_2.Size = UDim2.new(0, 18, 0, 18)
	Circle_2.Image = "rbxassetid://3570695787"
	Circle_2.ScaleType = Enum.ScaleType.Slice
	Circle_2.SliceCenter = Rect.new(100, 100, 100, 100)
	Circle_2.SliceScale = 0.120

	SliderButton_2.Name = "SliderButton"
	SliderButton_2.Parent = SliderWithToggle
	SliderButton_2.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
	SliderButton_2.Position = UDim2.new(0, 0, 0.591836751, 0)
	SliderButton_2.Size = UDim2.new(0, 237, 0, 12)
	SliderButton_2.Font = Enum.Font.SourceSans
	SliderButton_2.Text = ""
	SliderButton_2.TextColor3 = Color3.fromRGB(0, 0, 0)
	SliderButton_2.TextSize = 14.000

	SliderFill_2.Name = "SliderFill"
	SliderFill_2.Parent = SliderButton_2
	SliderFill_2.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	SliderFill_2.Size = UDim2.new(0, 0, 1, 0)

	UICorner_6.Parent = SliderFill_2

	UICorner_7.Parent = SliderButton_2

	SliderValue_2.Name = "SliderValue"
	SliderValue_2.Parent = SliderWithToggle
	SliderValue_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SliderValue_2.BackgroundTransparency = 1.000
	SliderValue_2.Position = UDim2.new(0.354632556, 0, -0.10204082, 0)
	SliderValue_2.Size = UDim2.new(0, 184, 0, 29)
	SliderValue_2.Font = Enum.Font.GothamBold
	SliderValue_2.Text = "0"
	SliderValue_2.TextColor3 = Color3.fromRGB(108, 108, 108)
	SliderValue_2.TextSize = 14.000
	SliderValue_2.TextXAlignment = Enum.TextXAlignment.Right
	
	
	
	--Toggle


	local function AHKXPIW_fake_script() -- ToggleButton_2.Script 
		local script = Instance.new('LocalScript', ToggleButton_2)

		local toggled = false -- The start state of the toggle
		local debounce = false -- Debounce / cooldown so you cant spam the toggle and break it

		script.Parent.Button.MouseButton1Click:Connect(function() -- Gets executed when you click the button
			if debounce == false then
				if toggled == true then -- If the toggle is already on
					debounce = true
					game:GetService("TweenService"):Create(script.Parent, TweenInfo.new(0.25), {ImageColor3 = Color3.fromRGB(200, 200, 200)}):Play()
					game:GetService("TweenService"):Create(script.Parent.Circle, TweenInfo.new(0.25), {Position = UDim2.new(0,2,0,2)}):Play()
					wait(0.25)
					debounce = false
					toggled = false
					pcall(togglecallback, false) -- REMOVE THIS IF YOUR NOT GONNA USE THE TOGGLE FOR AN UI LIBRARY!!!
				elseif toggled == false then -- If the toggle isnt already on
					debounce = true
					game:GetService("TweenService"):Create(script.Parent, TweenInfo.new(0.25), {ImageColor3 = Color3.fromRGB(64, 200, 114)}):Play()
					game:GetService("TweenService"):Create(script.Parent.Circle, TweenInfo.new(0.25), {Position = UDim2.new(1,-20,0,2)}):Play()
					wait(0.25)
					debounce = false
					toggled = true
					pcall(togglecallback, true) -- REMOVE THIS IF YOUR NOT GONNA USE THE TOGGLE FOR AN UI LIBRARY!!!
				end
			end
		end)
	end
	coroutine.wrap(AHKXPIW_fake_script)()
	
	
	
	--Slider
	-----Values-----
	minvalue = minvalue or 0
	maxvalue = maxvalue or 100


	-----Callback-----
	slidercallback = slidercallback or function() end


	-----Variables-----
	local mouse = game.Players.LocalPlayer:GetMouse()
	local uis = game:GetService("UserInputService")
	local Value;




	-----Main Code-----

	SliderButton_2.MouseButton1Down:Connect(function()
		Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 237) * SliderFill_2.AbsoluteSize.X) + tonumber(minvalue)) or 0
		pcall(function()
			slidercallback(Value)
		end)
		SliderFill_2.Size = UDim2.new(0, math.clamp(mouse.X - SliderFill_2.AbsolutePosition.X, 0, 237), 0, 12)
		moveconnection = mouse.Move:Connect(function()
			SliderValue_2.Text = Value
			Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 237) * SliderFill_2.AbsoluteSize.X) + tonumber(minvalue))
			pcall(function()
				slidercallback(Value)
			end)
			SliderFill_2.Size = UDim2.new(0, math.clamp(mouse.X - SliderFill_2.AbsolutePosition.X, 0, 237), 0, 12)
		end)
		releaseconnection = uis.InputEnded:Connect(function(Mouse)
			if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
				Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 237) * SliderFill_2.AbsoluteSize.X) + tonumber(minvalue))
				pcall(function()
					slidercallback(Value)
				end)
				SliderFill_2.Size = UDim2.new(0, math.clamp(mouse.X - SliderFill_2.AbsolutePosition.X, 0, 237), 0, 12)
				moveconnection:Disconnect()
				releaseconnection:Disconnect()
			end
		end)
	end)
	
	
	
end






--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = ScreenGui
Main.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Main.Position = UDim2.new(0.659073591, 0, 0.337740391, 0)
Main.Size = UDim2.new(0, 313, 0, 395)

ScrollingFrame.Parent = Main
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrollingFrame.BackgroundTransparency = 1.000
ScrollingFrame.Position = UDim2.new(0, 0, 0.101265825, 0)
ScrollingFrame.Size = UDim2.new(1, 0, 0.898734152, 0)
ScrollingFrame.ScrollBarThickness = 0

UIListLayout.Parent = ScrollingFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 7)

UICorner_8.Parent = Main

DragA.Name = "DragA"
DragA.Parent = Main
DragA.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
DragA.Position = UDim2.new(0, 0, -0.0379746817, 0)
DragA.Size = UDim2.new(0, 313, 0, 36)

UICorner_9.Parent = DragA

Blocker.Name = "Blocker"
Blocker.Parent = DragA
Blocker.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Blocker.BorderSizePixel = 0
Blocker.Position = UDim2.new(0, 0, 0.666666687, 0)
Blocker.Size = UDim2.new(0, 313, 0, 12)

return lib
