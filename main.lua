-- ==========================================
-- UGUZHUB PRO - MODERN UI & TRADE CALCULATOR
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

-- ScreenGui Kurulumu
local uguzGui = Instance.new("ScreenGui")
uguzGui.Name = "UguzHub_UI"
uguzGui.ResetOnSpawn = false
uguzGui.IgnoreGuiInset = true -- Tam ekran uyumluluğu
uguzGui.Parent = PlayerGui

local function applyRGB(object)
	local hue = 0
	RunService.RenderStepped:Connect(function()
		hue = (hue + 0.006) % 1
		object.TextColor3 = Color3.fromHSV(hue, 0.9, 1)
	end)
end

-- ==========================================
-- GİRİŞ EKRANI (TAM EKRAN + DÜZGÜN ANİMASYON)
-- ==========================================

local loginScreen = Instance.new("Frame")
loginScreen.Name = "LoginScreen"
loginScreen.Size = UDim2.new(1, 0, 1, 0)
loginScreen.Position = UDim2.new(0, 0, 0, 0)
loginScreen.BackgroundColor3 = Color3.fromRGB(10, 10, 12)
loginScreen.BorderSizePixel = 0
loginScreen.ZIndex = 100
loginScreen.Parent = uguzGui

-- UguzHub Başlık Konteynırı (Z Ortasından Büyüme)
local titleContainer = Instance.new("Frame")
titleContainer.Size = UDim2.new(0, 0, 0, 0)
titleContainer.Position = UDim2.new(0.5, 0, 0.45, 0)
titleContainer.BackgroundTransparency = 1
titleContainer.ZIndex = 101
titleContainer.Parent = loginScreen

local textUguz = Instance.new("TextLabel")
textUguz.Text = "Uguz"
textUguz.Size = UDim2.new(0.5, 0, 1, 0)
textUguz.Position = UDim2.new(0, 0, 0, 0)
textUguz.Font = Enum.Font.FredokaOne
textUguz.TextSize = 70
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
textHub.TextSize = 70
textHub.TextXAlignment = Enum.TextXAlignment.Left
textHub.BackgroundTransparency = 1
textHub.ZIndex = 102
textHub.Parent = titleContainer
applyRGB(textHub)

local underline = Instance.new("Frame")
underline.Size = UDim2.new(0, 0, 0, 5)
underline.Position = UDim2.new(0.5, 0, 1, -5)
underline.BorderSizePixel = 0
underline.ZIndex = 102
underline.Parent = titleContainer
applyRGB(underline)

local loadingText = Instance.new("TextLabel")
loadingText.Text = "Loading [ 0 % ]"
loadingText.Size = UDim2.new(0, 300, 0, 30)
loadingText.Position = UDim2.new(0.5, -150, 0.75, 0)
loadingText.Font = Enum.Font.GothamBold
loadingText.TextSize = 18
loadingText.TextColor3 = Color3.fromRGB(180, 180, 180)
loadingText.BackgroundTransparency = 1
loadingText.ZIndex = 101
loadingText.Parent = loginScreen

-- Yükleme Mantığı (10 Saniye Rastgele Sayılar)
local startTick = tick()
local duration = 10

coroutine.wrap(function()
	while tick() - startTick < duration do
		local percent = math.floor(((tick() - startTick) / duration) * 100)
		local randOffset = math.random(-4, 6)
		local displayVal = math.clamp(percent + randOffset, 0, 99)
		loadingText.Text = "Loading [ " .. tostring(displayVal) .. " % ]"
		task.wait(0.2)
	end
	loadingText.Text = "Loading [ 100 % ]"
	task.wait(0.3)

	-- 1. Z'den Ortadan Çıkma
	TweenService:Create(titleContainer, TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		Size = UDim2.new(0, 450, 0, 100),
		Position = UDim2.new(0.5, -225, 0.45, -50)
	}):Play()
	task.wait(0.8)

	-- 2. Uguz Sola, Hub Sağa
	TweenService:Create(textUguz, TweenInfo.new(0.7, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
		Position = UDim2.new(-0.2, 0, 0, 0)
	}):Play()
	TweenService:Create(textHub, TweenInfo.new(0.7, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
		Position = UDim2.new(0.7, 0, 0, 0)
	}):Play()
	task.wait(0.7)

	-- 3. Altı Çizilsin
	TweenService:Create(underline, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		Size = UDim2.new(1, 0, 0, 5),
		Position = UDim2.new(0, 0, 1, -5)
	}):Play()
	task.wait(0.8)

	-- Ekranı Kaldır
	TweenService:Create(loginScreen, TweenInfo.new(0.8, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut), {
		Position = UDim2.new(0, 0, -1, 0)
	}):Play()
	task.wait(0.8)
	loginScreen.Visible = false
	openMainUI()
end)()

-- ==========================================
-- GÖRSEL 1 LAYOUT + GÖRSEL 2 ARKA PLAN
-- ==========================================

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 680, 0, 420)
mainFrame.Position = UDim2.new(0.5, -340, 0.5, -210)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Visible = false
mainFrame.Parent = uguzGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 14)
mainCorner.Parent = mainFrame

-- Görsel 2 Arka Plan
local bgImage = Instance.new("ImageLabel")
bgImage.Name = "BackgroundImage"
bgImage.Size = UDim2.new(1, 0, 1, 0)
bgImage.Position = UDim2.new(0, 0, 0, 0)
bgImage.Image = "rbxassetid://12458428277" -- Yüksek kaliteli Roblox manzara resmi
bgImage.ScaleType = Enum.ScaleType.Crop
bgImage.ImageTransparency = 0.45 -- Menü okunurluğu için hafif saydamlaştırıldı
bgImage.Parent = mainFrame

-- Arka Plan Karartma (Overlay)
local overlay = Instance.new("Frame")
overlay.Size = UDim2.new(1, 0, 1, 0)
overlay.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
overlay.BackgroundTransparency = 0.45
overlay.Parent = mainFrame

-- Üst Bar (TopBar)
local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 40)
topBar.BackgroundTransparency = 1
topBar.ZIndex = 5
topBar.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Text = "UguzHub  |  MM2"
titleLabel.Size = UDim2.new(0, 200, 1, 0)
titleLabel.Position = UDim2.new(0, 15, 0, 0)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 14
titleLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.BackgroundTransparency = 1
titleLabel.Parent = topBar
applyRGB(titleLabel)

-- Katlama Butonu (-)
local collapseBtn = Instance.new("TextButton")
collapseBtn.Text = "—"
collapseBtn.Size = UDim2.new(0, 40, 1, 0)
collapseBtn.Position = UDim2.new(1, -45, 0, 0)
collapseBtn.Font = Enum.Font.GothamBold
collapseBtn.TextSize = 18
collapseBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
collapseBtn.BackgroundTransparency = 1
collapseBtn.ZIndex = 6
collapseBtn.Parent = topBar

local isCollapsed = false
local originalSize = mainFrame.Size

collapseBtn.MouseButton1Click:Connect(function()
	isCollapsed = not isCollapsed
	if isCollapsed then
		TweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
			Size = UDim2.new(0, 680, 0, 40)
		}):Play()
		collapseBtn.Text = "+"
	else
		TweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
			Size = originalSize
		}):Play()
		collapseBtn.Text = "—"
	end
end)

-- Sol Sidebar (Görsel 1 Yapısı)
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 160, 1, -40)
sidebar.Position = UDim2.new(0, 0, 0, 40)
sidebar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
sidebar.BackgroundTransparency = 0.5
sidebar.BorderSizePixel = 0
sidebar.ZIndex = 3
sidebar.Parent = mainFrame

-- Arama Kutusu (Search)
local searchBox = Instance.new("TextBox")
searchBox.PlaceholderText = "🔍 Search..."
searchBox.Text = ""
searchBox.Size = UDim2.new(1, -20, 0, 32)
searchBox.Position = UDim2.new(0, 10, 0, 10)
searchBox.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
searchBox.BackgroundTransparency = 0.3
searchBox.Font = Enum.Font.Gotham
searchBox.TextSize = 13
searchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
searchBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
searchBox.ZIndex = 4
searchBox.Parent = sidebar

local searchCorner = Instance.new("UICorner")
searchCorner.CornerRadius = UDim.new(0, 8)
searchCorner.Parent = searchBox

-- Navigasyon Butonları
local navList = Instance.new("UIListLayout")
navList.SortOrder = Enum.SortOrder.LayoutOrder
navList.Padding = UDim.new(0, 5)
navList.Parent = sidebar

local navContainer = Instance.new("Frame")
navContainer.Size = UDim2.new(1, -20, 1, -60)
navContainer.Position = UDim2.new(0, 10, 0, 50)
navContainer.BackgroundTransparency = 1
navContainer.ZIndex = 4
navContainer.Parent = sidebar

navList.Parent = navContainer

local function createNavButton(name, icon, active)
	local btn = Instance.new("TextButton")
	btn.Text = "   " .. icon .. "  " .. name
	btn.Size = UDim2.new(1, 0, 0, 35)
	btn.Font = Enum.Font.GothamMedium
	btn.TextSize = 13
	btn.TextColor3 = active and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(160, 160, 160)
	btn.TextXAlignment = Enum.TextXAlignment.Left
	btn.BackgroundColor3 = active and Color3.fromRGB(40, 40, 50) or Color3.fromRGB(0, 0, 0)
	btn.BackgroundTransparency = active and 0.4 or 1
	btn.ZIndex = 4
	btn.Parent = navContainer

	local btnCorner = Instance.new("UICorner")
	btnCorner.CornerRadius = UDim.new(0, 6)
	btnCorner.Parent = btn
	return btn
end

createNavButton("Main", "⚡", true)
createNavButton("ESP", "👁️", false)
createNavButton("Skybox", "🌌", false)
createNavButton("Graphics", "🎨", false)

-- Sağ İçerik Alanı (Content Area)
local contentArea = Instance.new("ScrollingFrame")
contentArea.Size = UDim2.new(1, -180, 1, -50)
contentArea.Position = UDim2.new(0, 170, 0, 45)
contentArea.BackgroundTransparency = 1
contentArea.BorderSizePixel = 0
contentArea.ScrollBarThickness = 3
contentArea.ZIndex = 3
contentArea.Parent = mainFrame

local contentList = Instance.new("UIListLayout")
contentList.SortOrder = Enum.SortOrder.LayoutOrder
contentList.Padding = UDim.new(0, 8)
contentList.Parent = contentArea

-- ==========================================
-- TRADE CALCULATOR ROW (GÖRSEL 1 TOGGLE STİLİ)
-- ==========================================

local calcRow = Instance.new("Frame")
calcRow.Size = UDim2.new(1, -10, 0, 45)
calcRow.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
calcRow.BackgroundTransparency = 0.4
calcRow.ZIndex = 4
calcRow.Parent = contentArea

local rowCorner = Instance.new("UICorner")
rowCorner.CornerRadius = UDim.new(0, 8)
rowCorner.Parent = calcRow

local rowLabel = Instance.new("TextLabel")
rowLabel.Text = "Trade Calculator"
rowLabel.Size = UDim2.new(0, 200, 1, 0)
rowLabel.Position = UDim2.new(0, 15, 0, 0)
rowLabel.Font = Enum.Font.GothamSemibold
rowLabel.TextSize = 14
rowLabel.TextColor3 = Color3.fromRGB(240, 240, 240)
rowLabel.TextXAlignment = Enum.TextXAlignment.Left
rowLabel.BackgroundTransparency = 1
rowLabel.ZIndex = 5
rowLabel.Parent = calcRow

-- Pill Switch (Görsel 1'deki Beyaz Yuvarlaklı Buton)
local switchBg = Instance.new("Frame")
switchBg.Size = UDim2.new(0, 42, 0, 22)
switchBg.Position = UDim2.new(1, -55, 0.5, -11)
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

-- Çalıştır Butonu
local runButton = Instance.new("TextButton")
runButton.Text = "Trade Calculator Çalıştır"
runButton.Size = UDim2.new(1, -10, 0, 40)
runButton.BackgroundColor3 = Color3.fromRGB(30, 140, 80)
runButton.BackgroundTransparency = 0.2
runButton.Font = Enum.Font.GothamBold
runButton.TextSize = 14
runButton.TextColor3 = Color3.fromRGB(255, 255, 255)
runButton.Visible = false
runButton.ZIndex = 4
runButton.Parent = contentArea

local runCorner = Instance.new("UICorner")
runCorner.CornerRadius = UDim.new(0, 8)
runCorner.Parent = runButton

local isToggleOn = false
switchBg.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		isToggleOn = not isToggleOn
		if isToggleOn then
			TweenService:Create(switchCircle, TweenInfo.new(0.2), {Position = UDim2.new(1, -19, 0.5, -8)}):Play()
			TweenService:Create(switchBg, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 160, 255)}):Play()
			runButton.Visible = true
		else
			TweenService:Create(switchCircle, TweenInfo.new(0.2), {Position = UDim2.new(0, 3, 0.5, -8)}):Play()
			TweenService:Create(switchBg, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 50, 60)}):Play()
			runButton.Visible = false
		end
	end
end)

function openMainUI()
	mainFrame.Visible = true
	mainFrame.Size = UDim2.new(0, 0, 0, 0)
	mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	TweenService:Create(mainFrame, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		Size = originalSize,
		Position = UDim2.new(0.5, -340, 0.5, -210)
	}):Play()
end

-- ==========================================
-- TAM ÇALIŞAN TRADE CALCULATOR MANTIĞI
-- ==========================================

local function attachValueTag(targetPart, itemData)
	if targetPart:FindFirstChild("TradeValueTag") then
		targetPart.TradeValueTag:Destroy()
	end

	local bb = Instance.new("BillboardGui")
	bb.Name = "TradeValueTag"
	bb.Size = UDim2.new(0, 150, 0, 50)
	bb.AlwaysOnTop = true
	bb.ExtentsOffset = Vector3.new(0, 2, 0)

	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(1, 0, 1, 0)
	frame.BackgroundColor3 = Color3.fromRGB(12, 12, 15)
	frame.BackgroundTransparency = 0.15
	frame.Parent = bb

	local fCorner = Instance.new("UICorner")
	fCorner.CornerRadius = UDim.new(0, 6)
	fCorner.Parent = frame

	local valTxt = Instance.new("TextLabel")
	valTxt.Text = itemData.weapon .. " " .. itemData.name .. "\nVal: " .. itemData.value
	valTxt.Size = UDim2.new(1, 0, 0.6, 0)
	valTxt.Font = Enum.Font.GothamBold
	valTxt.TextSize = 12
	valTxt.TextColor3 = Color3.fromRGB(255, 215, 0)
	valTxt.BackgroundTransparency = 1
	valTxt.Parent = frame

	local demTxt = Instance.new("TextLabel")
	demTxt.Text = "Demand: " .. itemData.demand .. "/10"
	demTxt.Size = UDim2.new(1, 0, 0.4, 0)
	demTxt.Position = UDim2.new(0, 0, 0.6, 0)
	demTxt.Font = Enum.Font.GothamSemibold
	demTxt.TextSize = 10
	demTxt.TextColor3 = Color3.fromRGB(200, 200, 200)
	demTxt.BackgroundTransparency = 1
	demTxt.Parent = frame

	bb.Parent = targetPart
end

local function scanAndApply()
	-- Oyuncuların envanterini ve karakterlerini tara
	for _, p in ipairs(Players:GetPlayers()) do
		local char = p.Character
		if char then
			for _, tool in ipairs(char:GetChildren()) do
				if tool:IsA("Tool") then
					for _, data in ipairs(WEAPONS_DATA) do
						if string.find(string.lower(tool.Name), string.lower(data.name)) then
							local handle = tool:FindFirstChild("Handle") or tool:FindFirstChildOfClass("BasePart")
							if handle then attachValueTag(handle, data) end
						end
					end
				end
			end
		end

		local backpack = p:FindFirstChild("Backpack")
		if backpack then
			for _, tool in ipairs(backpack:GetChildren()) do
				for _, data in ipairs(WEAPONS_DATA) do
					if string.find(string.lower(tool.Name), string.lower(data.name)) then
						local handle = tool:FindFirstChild("Handle") or tool:FindFirstChildOfClass("BasePart")
						if handle then attachValueTag(handle, data) end
					end
				end
			end
		end
	end

	-- Haritada yerdeki itemleri tara
	for _, obj in ipairs(workspace:GetDescendants()) do
		if obj:IsA("Tool") or obj:IsA("Model") then
			for _, data in ipairs(WEAPONS_DATA) do
				if string.find(string.lower(obj.Name), string.lower(data.name)) then
					local part = obj:IsA("Tool") and (obj:FindFirstChild("Handle") or obj:FindFirstChildOfClass("BasePart")) or obj.PrimaryPart
					if part then attachValueTag(part, data) end
				end
			end
		end
	end
end

-- Çalıştır Butonu Tetiklenmesi
runButton.MouseButton1Click:Connect(function()
	runButton.Text = "Taranıyor..."
	runButton.BackgroundColor3 = Color3.fromRGB(200, 140, 0)
	task.wait(1)
	
	scanAndApply()
	
	runButton.Text = "Hesaplayıcı Aktif ✅"
	runButton.BackgroundColor3 = Color3.fromRGB(0, 180, 90)
	
	-- Oyuna yeni item eklendikçe otomatik tarama
	workspace.DescendantAdded:Connect(function()
		task.wait(0.5)
		scanAndApply()
	end)
end)
