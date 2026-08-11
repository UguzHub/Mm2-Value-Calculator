-- ==========================================
-- UGUZHUB PRO - COMPACT MM2 TRADE CALCULATOR
-- ==========================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- 1. VERİ TABANI (WEAPONS_DATA)
local WEAPONS_DATA = {
    {name = "Corrupt", type = "Unique", weapon = "🔫", value = "460", demand = "4", rarity = "3", change = "(-10) -2.1%"},
    {name = "slouse's Clown (Gun)", type = "Unique", weapon = "🔫", value = "Priceless", demand = "11", rarity = "0", change = "N/A"},
    {name = "slouse's Clown (Knife)", type = "Unique", weapon = "🔪", value = "Priceless", demand = "11", rarity = "0", change = "N/A"},
    {name = "Gingerscope", type = "Ancient", weapon = "🔫", value = "17,750", demand = "6", rarity = "0", change = "(+250) +1.4%"},
    {name = "Traveler's Axe", type = "Ancient", weapon = "🔪", value = "8,100", demand = "5", rarity = "0", change = "(-100) -1.2%"},
    {name = "Celestial", type = "Ancient", weapon = "🔪", value = "2,225", demand = "6", rarity = "0", change = "(+50) +2.3%"},
    {name = "Vampire's Axe", type = "Ancient", weapon = "🔪", value = "1,225", demand = "5", rarity = "0", change = "(+25) +2.1%"},
    {name = "Harvester", type = "Ancient", weapon = "🔪", value = "250", demand = "3", rarity = "0", change = "(-10) -3.8%"},
    {name = "Icepiercer", type = "Ancient", weapon = "🔪", value = "160", demand = "3", rarity = "0", change = "(-10) -5.9%"},
    {name = "Icebreaker", type = "Ancient", weapon = "🔪", value = "65", demand = "1", rarity = "0", change = "(-2) -3.0%"},
    {name = "Batwing", type = "Ancient", weapon = "🔪", value = "42", demand = "1", rarity = "0", change = "(-1) -2.3%"},
    {name = "Elderwood Scythe", type = "Ancient", weapon = "🔪", value = "38", demand = "1", rarity = "0", change = "(-2) -5.0%"},
    {name = "C. Traveler's Gun", type = "Chroma", weapon = "🔫", value = "220,000", demand = "9", rarity = "0", change = "(-5,000) -2.2%"},
    {name = "Chroma Evergun", type = "Chroma", weapon = "🔫", value = "75,000", demand = "8", rarity = "0", change = "(-1,000) -1.3%"},
    {name = "Chroma Evergreen", type = "Chroma", weapon = "🔪", value = "49,000", demand = "7", rarity = "0", change = "(-1,000) -2.0%"}
}

local uguzGui = Instance.new("ScreenGui")
uguzGui.Name = "UguzHub_UI"
uguzGui.ResetOnSpawn = false
uguzGui.IgnoreGuiInset = true
uguzGui.Parent = PlayerGui

local function applyRGB(object)
	local hue = 0
	RunService.RenderStepped:Connect(function()
		hue = (hue + 0.006) % 1
		object.TextColor3 = Color3.fromHSV(hue, 0.9, 1)
	end)
end

-- ==========================================
-- GİRİŞ EKRANI (TAM EKRAN UGUZHUB)
-- ==========================================

local loginScreen = Instance.new("Frame")
loginScreen.Size = UDim2.new(1, 0, 1, 0)
loginScreen.BackgroundColor3 = Color3.fromRGB(10, 10, 12)
loginScreen.BorderSizePixel = 0
loginScreen.ZIndex = 100
loginScreen.Parent = uguzGui

local titleContainer = Instance.new("Frame")
titleContainer.Size = UDim2.new(0, 0, 0, 0)
titleContainer.Position = UDim2.new(0.5, 0, 0.45, 0)
titleContainer.BackgroundTransparency = 1
titleContainer.ZIndex = 101
titleContainer.Parent = loginScreen

local textUguz = Instance.new("TextLabel")
textUguz.Text = "Uguz"
textUguz.Size = UDim2.new(0.5, 0, 1, 0)
textUguz.Font = Enum.Font.FredokaOne
textUguz.TextSize = 65
textUguz.TextXAlignment = Enum.TextXAlignment.Right
textUguz.BackgroundTransparency = 1
textUguz.ZIndex = 102
textUguz.Parent = titleContainer
applyRGB(textUguz)

local textHub = Instance.new("TextLabel")
textHub.Text = "Hub"
textHub.Size = UDim2.new(0.5, 0, 1, 0)
textHub.Position = UDim2.new(0.5, 0, 0, 0)
textHub.Font = Enum.Font.FredokaOne
textHub.TextSize = 65
textHub.TextXAlignment = Enum.TextXAlignment.Left
textHub.BackgroundTransparency = 1
textHub.ZIndex = 102
textHub.Parent = titleContainer
applyRGB(textHub)

local underline = Instance.new("Frame")
underline.Size = UDim2.new(0, 0, 0, 4)
underline.Position = UDim2.new(0.5, 0, 1, -4)
underline.BorderSizePixel = 0
underline.ZIndex = 102
underline.Parent = titleContainer
applyRGB(underline)

local loadingText = Instance.new("TextLabel")
loadingText.Text = "Loading [ 0 % ]"
loadingText.Size = UDim2.new(0, 300, 0, 30)
loadingText.Position = UDim2.new(0.5, -150, 0.75, 0)
loadingText.Font = Enum.Font.GothamBold
loadingText.TextSize = 16
loadingText.TextColor3 = Color3.fromRGB(180, 180, 180)
loadingText.BackgroundTransparency = 1
loadingText.ZIndex = 101
loadingText.Parent = loginScreen

local startTick = tick()
local duration = 10

coroutine.wrap(function()
	while tick() - startTick < duration do
		local percent = math.floor(((tick() - startTick) / duration) * 100)
		loadingText.Text = "Loading [ " .. tostring(math.clamp(percent + math.random(-3, 3), 0, 99)) .. " % ]"
		task.wait(0.2)
	end
	loadingText.Text = "Loading [ 100 % ]"
	task.wait(0.3)

	TweenService:Create(titleContainer, TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		Size = UDim2.new(0, 400, 0, 90),
		Position = UDim2.new(0.5, -200, 0.45, -45)
	}):Play()
	task.wait(0.8)

	TweenService:Create(textUguz, TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(-0.2, 0, 0, 0)}):Play()
	TweenService:Create(textHub, TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(0.7, 0, 0, 0)}):Play()
	task.wait(0.6)

	TweenService:Create(underline, TweenInfo.new(0.5), {Size = UDim2.new(1, 0, 0, 4), Position = UDim2.new(0, 0, 1, -4)}):Play()
	task.wait(0.8)

	TweenService:Create(loginScreen, TweenInfo.new(0.7), {Position = UDim2.new(0, 0, -1, 0)}):Play()
	task.wait(0.7)
	loginScreen.Visible = false
	openMainUI()
end)()

-- ==========================================
-- KÜÇÜK VE KOMPAKT MENÜ (GÖRSEL 1 STİLİ)
-- ==========================================

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 420, 0, 220) -- Küçük boyut!
mainFrame.Position = UDim2.new(0.5, -210, 0.5, -110)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Visible = false
mainFrame.Parent = uguzGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 10)
mainCorner.Parent = mainFrame

-- Görsel 2 Arka Planı
local bgImage = Instance.new("ImageLabel")
bgImage.Size = UDim2.new(1, 0, 1, 0)
bgImage.Image = "rbxassetid://12458428277"
bgImage.ScaleType = Enum.ScaleType.Crop
bgImage.ImageTransparency = 0.5
bgImage.Parent = mainFrame

local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 35)
topBar.BackgroundTransparency = 1
topBar.ZIndex = 5
topBar.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Text = "UguzHub"
titleLabel.Size = UDim2.new(0, 150, 1, 0)
titleLabel.Position = UDim2.new(0, 12, 0, 0)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 14
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.BackgroundTransparency = 1
titleLabel.ZIndex = 6
titleLabel.Parent = topBar
applyRGB(titleLabel)

-- Katlama Butonu (-)
local collapseBtn = Instance.new("TextButton")
collapseBtn.Text = "—"
collapseBtn.Size = UDim2.new(0, 35, 1, 0)
collapseBtn.Position = UDim2.new(1, -38, 0, 0)
collapseBtn.Font = Enum.Font.GothamBold
collapseBtn.TextSize = 16
collapseBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
collapseBtn.BackgroundTransparency = 1
collapseBtn.ZIndex = 6
collapseBtn.Parent = topBar

local isCollapsed = false
collapseBtn.MouseButton1Click:Connect(function()
	isCollapsed = not isCollapsed
	if isCollapsed then
		TweenService:Create(mainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 420, 0, 35)}):Play()
		collapseBtn.Text = "+"
	else
		TweenService:Create(mainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 420, 0, 220)}):Play()
		collapseBtn.Text = "—"
	end
end)

-- Sol Bölüm Paneli (SADECE 1 BÖLÜM: Trade Calculator)
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 140, 1, -35)
sidebar.Position = UDim2.new(0, 0, 0, 35)
sidebar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
sidebar.BackgroundTransparency = 0.6
sidebar.BorderSizePixel = 0
sidebar.ZIndex = 3
sidebar.Parent = mainFrame

local singleNavBtn = Instance.new("Frame")
singleNavBtn.Size = UDim2.new(1, -16, 0, 32)
singleNavBtn.Position = UDim2.new(0, 8, 0, 10)
singleNavBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
singleNavBtn.BackgroundTransparency = 0.3
singleNavBtn.ZIndex = 4
singleNavBtn.Parent = sidebar

local navCorner = Instance.new("UICorner")
navCorner.CornerRadius = UDim.new(0, 6)
navCorner.Parent = singleNavBtn

local singleNavTxt = Instance.new("TextLabel")
singleNavTxt.Text = "⚡ Trade Calc"
singleNavTxt.Size = UDim2.new(1, 0, 1, 0)
singleNavTxt.Font = Enum.Font.GothamMedium
singleNavTxt.TextSize = 12
singleNavTxt.TextColor3 = Color3.fromRGB(255, 255, 255)
singleNavTxt.BackgroundTransparency = 1
singleNavTxt.ZIndex = 5
singleNavTxt.Parent = singleNavBtn

-- Sağ İçerik Alanı
local contentArea = Instance.new("Frame")
contentArea.Size = UDim2.new(1, -150, 1, -45)
contentArea.Position = UDim2.new(0, 145, 0, 40)
contentArea.BackgroundTransparency = 1
contentArea.ZIndex = 3
contentArea.Parent = mainFrame

-- Trade Calculator Satırı (Görsel 1 Toggle)
local calcRow = Instance.new("Frame")
calcRow.Size = UDim2.new(1, -10, 0, 40)
calcRow.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
calcRow.BackgroundTransparency = 0.4
calcRow.ZIndex = 4
calcRow.Parent = contentArea

local rowCorner = Instance.new("UICorner")
rowCorner.CornerRadius = UDim.new(0, 6)
rowCorner.Parent = calcRow

local rowLabel = Instance.new("TextLabel")
rowLabel.Text = "Trade Calculator"
rowLabel.Size = UDim2.new(0, 140, 1, 0)
rowLabel.Position = UDim2.new(0, 10, 0, 0)
rowLabel.Font = Enum.Font.GothamSemibold
rowLabel.TextSize = 13
rowLabel.TextColor3 = Color3.fromRGB(240, 240, 240)
rowLabel.TextXAlignment = Enum.TextXAlignment.Left
rowLabel.BackgroundTransparency = 1
rowLabel.ZIndex = 5
rowLabel.Parent = calcRow

-- Pill Switch (Sağa Kayma Efektli)
local switchBg = Instance.new("Frame")
switchBg.Size = UDim2.new(0, 42, 0, 22)
switchBg.Position = UDim2.new(1, -50, 0.5, -11)
switchBg.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
switchBg.ZIndex = 5
switchBg.Parent = calcRow

local switchCorner = Instance.new("UICorner")
switchCorner.CornerRadius = UDim.new(1, 0)
switchCorner.Parent = switchBg

local switchCircle = Instance.new("Frame")
switchCircle.Size = UDim2.new(0, 16, 0, 16)
switchCircle.Position = UDim2.new(0, 3, 0.5, -8)
switchCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
switchCircle.ZIndex = 6
switchCircle.Parent = switchBg

local circleCorner = Instance.new("UICorner")
circleCorner.CornerRadius = UDim.new(1, 0)
circleCorner.Parent = switchCircle

local isCalculatorActive = false

function openMainUI()
	mainFrame.Visible = true
	mainFrame.Size = UDim2.new(0, 0, 0, 0)
	mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	TweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		Size = UDim2.new(0, 420, 0, 220),
		Position = UDim2.new(0.5, -210, 0.5, -110)
	}):Play()
end

-- ==========================================
-- GERÇEK TRADE EKRANI DEĞER OKUYUCU (MM2)
-- ==========================================

local function getItemData(itemName)
	for _, data in ipairs(WEAPONS_DATA) do
		if string.find(string.lower(itemName), string.lower(data.name)) then
			return data
		end
	end
	return nil
end

local function applyValueToGuiSlot(slotFrame, itemData)
	if slotFrame:FindFirstChild("UguzValueOverlay") then
		slotFrame.UguzValueOverlay:Destroy()
	end

	local overlayLabel = Instance.new("TextLabel")
	overlayLabel.Name = "UguzValueOverlay"
	overlayLabel.Size = UDim2.new(1, 0, 0, 18)
	overlayLabel.Position = UDim2.new(0, 0, 1, -18)
	overlayLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	overlayLabel.BackgroundTransparency = 0.2
	overlayLabel.Font = Enum.Font.GothamBold
	overlayLabel.TextSize = 10
	overlayLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
	overlayLabel.Text = "V:" .. itemData.value .. " | D:" .. itemData.demand
	overlayLabel.ZIndex = 20
	overlayLabel.Parent = slotFrame
end

-- MM2 Trade Penceresini Otomatik Tarayıcı
local function startTradeMonitoring()
	RunService.RenderStepped:Connect(function()
		if not isCalculatorActive then return end

		-- MM2 GUI'lerinde Trade Penceresini Tara
		local tradeGui = PlayerGui:FindFirstChild("Trade") or PlayerGui:FindFirstChild("TradeFrame") or PlayerGui:FindFirstChild("MainGui")
		if tradeGui then
			for _, descendant in ipairs(tradeGui:GetDescendants()) do
				if descendant:IsA("TextLabel") or descendant:IsA("ImageLabel") then
					local itemData = getItemData(descendant.Name) or getItemData(descendant.Parent.Name)
					if itemData then
						local containerSlot = descendant:IsA("ImageLabel") and descendant or descendant.Parent
						applyValueToGuiSlot(containerSlot, itemData)
					end
				end
			end
		end
	end)
end

-- Switch Tıklama Mantığı
switchBg.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		isCalculatorActive = not isCalculatorActive
		if isCalculatorActive then
			-- Sağa Kayma Animasyonu
			TweenService:Create(switchCircle, TweenInfo.new(0.2), {Position = UDim2.new(1, -19, 0.5, -8)}):Play()
			TweenService:Create(switchBg, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 160, 255)}):Play()
			startTradeMonitoring()
		else
			-- Sola Kayma Animasyonu
			TweenService:Create(switchCircle, TweenInfo.new(0.2), {Position = UDim2.new(0, 3, 0.5, -8)}):Play()
			TweenService:Create(switchBg, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 50, 60)}):Play()
		end
	end
end) 
