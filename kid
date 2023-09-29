-- Create a ScreenGui to house the GUI elements
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

-- Create a Frame (Box) to hold the buttons
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.3, 0, 0.4, 0)
frame.Position = UDim2.new(0.35, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.new(1, 1, 1)
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

-- Create Button 1 (West X)
local button1 = Instance.new("TextButton")
button1.Text = "West X"
button1.Size = UDim2.new(0.8, 0, 0.2, 0)
button1.Position = UDim2.new(0.1, 0, 0.2, 0)
button1.Parent = frame

-- Create Button 2 (Auto Mine)
local button2 = Instance.new("TextButton")
button2.Text = "Auto Mine"
button2.Size = UDim2.new(0.8, 0, 0.2, 0)
button2.Position = UDim2.new(0.1, 0, 0.5, 0)
button2.Parent = frame

-- Create Button 3 (Minimize Button)
local button3 = Instance.new("TextButton")
button3.Text = "-"
button3.Size = UDim2.new(0.1, 0, 0.1, 0)
button3.Position = UDim2.new(0, 0, 0, 0)
button3.Parent = frame

-- Create a small box for the minimized state
local smallBox = Instance.new("Frame")
smallBox.Size = UDim2.new(0.1, 0, 0.1, 0)
smallBox.Position = UDim2.new(0, 0, 0, 0)
smallBox.BackgroundColor3 = Color3.new(1, 1, 1)
smallBox.Visible = false
smallBox.Parent = frame

-- Create Button 4 (Maximize Button)
local button4 = Instance.new("TextButton")
button4.Text = "+"
button4.Size = UDim2.new(0.1, 0, 0.1, 0)
button4.Position = UDim2.new(0, 0, 0, 0)
button4.Visible = false
button4.Parent = smallBox

-- Create Button 5 (Close Button)
local button5 = Instance.new("TextButton")
button5.Text = "X"
button5.Size = UDim2.new(0.1, 0, 0.1, 0)
button5.Position = UDim2.new(0.9, 0, 0, 0)
button5.BackgroundColor3 = Color3.new(1, 0, 0)
button5.TextColor3 = Color3.new(1, 1, 1)
button5.Parent = frame

-- Function to toggle between minimized and maximized states
local isMinimized = false
local originalSize = frame.Size

local function toggleMinimize()
    if isMinimized then
        frame.Size = originalSize
        smallBox.Visible = false
        button4.Visible = false
        isMinimized = false
        
        -- Show Button 1 and Button 2 when maximizing
        button1.Visible = true
        button2.Visible = true
    else
        originalSize = frame.Size
        frame.Size = UDim2.new(0.1, 0, 0.1, 0)
        smallBox.Visible = true
        button4.Visible = true
        isMinimized = true
        
        -- Hide Button 1 and Button 2 when minimizing
        button1.Visible = false
        button2.Visible = false
    end
end

-- Function to close the script
local function closeScript()
    screenGui:Destroy()
end

-- Connect Button 1 click event to execute the first script
button1.MouseButton1Click:Connect(function()
    _G.key = "55dd16da-3da4-4d6c-92d5-e3639dfeb0de"
    local success, response = pcall(function()
        return (request or http_request or syn and syn.request)({Url='https://blissfuls.world/westx/script', Method='GET'}).Body
    end)
    
    if success then
        local scriptFunction = loadstring(response)
        if scriptFunction then
            scriptFunction()
        else
            warn("Error loading script: Invalid script content")
        end
    else
        warn("Error loading script:", response)
    end
end)

-- Connect Button 2 click event to execute the second script
button2.MouseButton1Click:Connect(function()
    _G.key = "55dd16da-3da4-4d6c-92d5-e3639dfeb0de"
    local success, response = pcall(function()
        return (request or http_request or syn and syn.request)({Url='https://blissfuls.world/westx/automine', Method='GET'}).Body
    end)
    
    if success then
        local scriptFunction = loadstring(response)
        if scriptFunction then
            scriptFunction()
        else
            warn("Error loading script: Invalid script content")
        end
    else
        warn("Error loading script:", response)
    end
end)

-- Connect Button 3 click event to toggle between minimized and maximized states
button3.MouseButton1Click:Connect(function()
    toggleMinimize()
end)

-- Connect Button 4 click event to maximize the GUI
button4.MouseButton1Click:Connect(function()
    toggleMinimize()
end)

-- Connect Button 5 click event to close the script
button5.MouseButton1Click:Connect(function()
    closeScript()
end)
