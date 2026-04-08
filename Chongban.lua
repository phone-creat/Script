--[[ 
    SYSTEM STEALTH MENU 
    Tính năng: 
    1. Tạo UI hoàn toàn bằng code để tránh bị phát hiện bởi hệ thống quét tĩnh.
    2. Phím tắt bí mật để mở: Left Control + K.
    3. Hiệu ứng làm mờ nền (Blur) chuyên nghiệp.
]]

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

-- Cấu tạo giao diện (Vô hình trong Explorer ban đầu)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "HttpService_Cache" -- Đặt tên giả để tránh bị soi
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = Player:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Name = "DataContainer"
MainFrame.Size = UDim2.new(0, 300, 0, 400)
MainFrame.Position = UDim2.new(0.5, -150, -0.6, 0) -- Khởi đầu ở ngoài màn hình
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

-- Bo góc và viền Neon
local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 15)
Corner.Parent = MainFrame

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(0, 170, 255)
Stroke.Thickness = 1.5
Stroke.Parent = MainFrame

-- Tiêu đề
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundTransparency = 1
Title.Text = "SYSTEM SECURITY"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame

-- Nút bấm mẫu (Bảo vệ)
local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0.8, 0, 0, 45)
Button.Position = UDim2.new(0.1, 0, 0.3, 0)
Button.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
Button.Text = "KÍCH HOẠT CHẾ ĐỘ ẨN"
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.Font = Enum.Font.Gotham
Button.AutoButtonColor = true
Button.Parent = MainFrame

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 8)
ButtonCorner.Parent = Button

-- Hiệu ứng Blur
local Blur = Instance.new("BlurEffect")
Blur.Size = 0
Blur.Parent = Lighting

-- Logic đóng/mở bí mật
local isOpen = false

local function ToggleMenu()
	isOpen = not isOpen
	if isOpen then
		-- Hiệu ứng hiện ra mượt mà
		MainFrame.Visible = true
		TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back), {Position = UDim2.new(0.5, -150, 0.5, -200)}):Play()
		TweenService:Create(Blur, TweenInfo.new(0.5), {Size = 20}):Play()
	else
		-- Hiệu ứng ẩn đi
		TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.QuadIn), {Position = UDim2.new(0.5, -150, -0.6, 0)}):Play()
		TweenService:Create(Blur, TweenInfo.new(0.5), {Size = 0}):Play()
	end
end

-- Lắng nghe tổ hợp phím (Ctrl + K)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if input.KeyCode == Enum.KeyCode.K and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
		ToggleMenu()
	end
end)

-- Xử lý nút bấm
Button.MouseButton1Click:Connect(function()
	Button.Text = "ĐANG BẢO VỆ..."
	Button.TextColor3 = Color3.fromRGB(0, 255, 127)
	-- Thêm code bảo mật của bạn ở đây
end)

print("System Loaded Successfully.")
