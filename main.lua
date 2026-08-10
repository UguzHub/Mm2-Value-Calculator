-- ==========================================
-- UGUZHUB PRO - COMPLETE TRADE CALCULATOR
-- ==========================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local pgui = player:WaitForChild("PlayerGui")

-- 1. VERİ TABANI (WEAPONS_DATA)
local WEAPONS_DATA = {
    -- UNIQUES
    {name = "Corrupt", type = "Unique", weapon = "🔫", value = "460", demand = "4", rarity = "3", change = "(-10) -2.1%"},
    {name = "slouse's Clown (Gun)", type = "Unique", weapon = "🔫", value = "Priceless", demand = "11", rarity = "0", change = "N/A"},
    {name = "slouse's Clown (Knife)", type = "Unique", weapon = "🔪", value = "Priceless", demand = "11", rarity = "0", change = "N/A"},
    {name = "Sharkseeker", type = "Unique", weapon = "🔪", value = "N/A", demand = "0", rarity = "6", change = "N/A"},
    {name = "Dartbringer", type = "Unique", weapon = "🔫", value = "N/A", demand = "0", rarity = "7", change = "N/A"},
    {name = "Gold Candy", type = "Unique", weapon = "🔪", value = "Priceless", demand = "0", rarity = "0", change = "N/A"},
    
    -- ANCIENTS
    {name = "Nik's Scythe", type = "Ancient", weapon = "🔪", value = "Priceless", demand = "11", rarity = "0", change = "N/A"},
    {name = "Gingerscope", type = "Ancient", weapon = "🔫", value = "17,750", demand = "6", rarity = "0", change = "(+250) +1.4%"},
    {name = "Traveler's Axe", type = "Ancient", weapon = "🔪", value = "8,100", demand = "5", rarity = "0", change = "(-100) -1.2%"},
    {name = "Celestial", type = "Ancient", weapon = "🔪", value = "2,225", demand = "6", rarity = "0", change = "(+50) +2.3%"},
    {name = "Vampire's Axe", type = "Ancient", weapon = "🔪", value = "1,225", demand = "5", rarity = "0", change = "(+25) +2.1%"},
    {name = "Harvester", type = "Ancient", weapon = "🔪", value = "250", demand = "3", rarity = "0", change = "(-10) -3.8%"},
    {name = "Icepiercer", type = "Ancient", weapon = "🔪", value = "160", demand = "3", rarity = "0", change = "(-10) -5.9%"},
    {name = "Icebreaker", type = "Ancient", weapon = "🔪", value = "65", demand = "1", rarity = "0", change = "(-2) -3.0%"},
    {name = "Batwing", type = "Ancient", weapon = "🔪", value = "42", demand = "1", rarity = "0", change = "(-1) -2.3%"},
    {name = "Elderwood Scythe", type = "Ancient", weapon = "🔪", value = "38", demand = "1", rarity = "0", change = "(-2) -5.0%"},
    {name = "Swirly Axe", type = "Ancient", weapon = "🔪", value = "38", demand = "1", rarity = "0", change = "(-2) -5.0%"},
    {name = "Hallowscythe", type = "Ancient", weapon = "🔪", value = "30", demand = "1", rarity = "0", change = "(-2) -6.3%"},
    {name = "Logchopper", type = "Ancient", weapon = "🔪", value = "18", demand = "1", rarity = "0", change = "(-2) -10.0%"},
    {name = "Icewing", type = "Ancient", weapon = "🔪", value = "13", demand = "2", rarity = "0", change = "(-2) -13.3%"},
    
    -- VINTAGES
    {name = "Blood", type = "Vintage", weapon = "🔪", value = "8", demand = "1", rarity = "0", change = "(+0)"},
    {name = "Ghost (Vintage)", type = "Vintage", weapon = "🔪", value = "8", demand = "1", rarity = "0", change = "(-2) -20.0%"},
    {name = "Laser (Vintage)", type = "Vintage", weapon = "🔫", value = "8", demand = "1", rarity = "0", change = "(+0)"},
    {name = "America", type = "Vintage", weapon = "🔪", value = "7", demand = "1", rarity = "0", change = "(+0)"},
    {name = "Prince", type = "Vintage", weapon = "🔪", value = "6", demand = "1", rarity = "0", change = "(+0)"},
    {name = "Shadow", type = "Vintage", weapon = "🔪", value = "6", demand = "1", rarity = "0", change = "(+0)"},
    {name = "Phaser", type = "Vintage", weapon = "🔫", value = "5", demand = "1", rarity = "0", change = "(+0)"},
    {name = "Cowboy", type = "Vintage", weapon = "🔪", value = "4", demand = "1", rarity = "0", change = "(-1) -20.0%"},
    {name = "Golden", type = "Vintage", weapon = "🔪", value = "4", demand = "1", rarity = "0", change = "(+0)"},
    {name = "Splitter", type = "Vintage", weapon = "🔪", value = "3", demand = "1", rarity = "0", change = "(+0)"},

    -- CHROMAS
    {name = "C. Traveler's Gun", type = "Chroma", weapon = "🔫", value = "220,000", demand = "9", rarity = "0", change = "(-5,000) -2.2%"},
    {name = "Chroma Evergun", type = "Chroma", weapon = "🔫", value = "75,000", demand = "8", rarity = "0", change = "(-1,000) -1.3%"},
    {name = "Chroma Evergreen", type = "Chroma", weapon = "🔪", value = "49,000", demand = "7", rarity = "0", change = "(-1,000) -2.0%"},
    {name = "Chroma Bauble", type = "Chroma", weapon = "🔪", value = "34,000", demand = "7", rarity = "0", change = "(-1,000) -2.9%"},
    {name = "C. Vampire's Gun", type = "Chroma", weapon = "🔫", value = "29,000", demand = "6", rarity = "0", change = "(+0)"}
}

-- 2. GUI KURULUMU
local uguzHubGui = Instance.new("ScreenGui")
uguzHubGui.Name = "UguzHub_Pro"
uguzHubGui.ResetOnSpawn = false
uguzHubGui.Parent = pgui

local function applyRGB(object)
	local hue = 0
	RunService.RenderStepped:Connect(function()
		hue = (hue + 0.008) % 1
		object.TextColor3 = Color3.fromHSV(hue, 1, 1)
	end)
end

-- 3. GİRİŞ EKRANI
local loginScreen = Instance.new("Frame")
loginScreen.Size = UDim2.new(1, 0, 1, 0)
loginScreen.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
loginScreen.BorderSizePixel = 0
loginScreen.Parent = uguzHubGui

local titleFrame = Instance.new("Frame")
titleFrame.Size = UDim2.new(0, 0, 0, 0)
titleFrame.Position = UDim2.new(0.5, 0, 0.4, 0)
titleFrame.BackgroundTransparency = 1
titleFrame.Parent = loginScreen

local textUgu = Instance.new("TextLabel")
textUgu.Text = "Ugu"
textUgu.Size = UDim2.new(0.5, 0, 1, 0)
textUgu.Font = Enum.Font.FredokaOne
textUgu.TextSize = 65
textUgu.TextXAlignment = Enum.TextXAlignment.Right
textUgu.BackgroundTransparency = 1
textUgu.Parent = titleFrame
applyRGB(textUgu)

local textHub = Instance.new("TextLabel")
textHub.Text = "Hub"
textHub.Size = UDim2.new(0.5, 0, 1, 0)
textHub.Position = UDim2.new(0.5, 0, 0, 0)
textHub.Font = Enum.Font.FredokaOne
textHub.TextSize = 65
textHub.TextXAlignment = Enum.TextXAlignment.Left
textHub.BackgroundTransparency = 1
textHub.Parent = titleFrame
applyRGB(textHub)

local underline = Instance.new("Frame")
underline.Size = UDim2.new(0, 0, 0, 4)
underline.Position = UDim2.new(0.5, 0, 1, -5)
underline.BorderSizePixel = 0
underline.Parent = titleFrame
applyRGB(underline)

local loadingLabel = Instance.new("TextLabel")
loadingLabel.Text = "Loading [ 0% ]"
loadingLabel.Size = UDim2.new(0, 300, 0, 30)
loadingLabel.Position = UDim2.new(0.5, -150, 0.75, 0)
loadingLabel.Font = Enum.Font.GothamMedium
loadingLabel.TextSize = 18
loadingLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
loadingLabel.BackgroundTransparency = 1
loadingLabel.Parent = loginScreen

-- 10 Saniyelik Yükleme Efekti
local startTime = tick()
local duration = 10

coroutine.wrap(function()
	while tick() - startTime < duration do
		local p = math.floor(((tick() - startTime) / duration) * 100)
		loadingLabel.Text = "Loading [ " .. tostring(p + math.random(-2, 3)) .. "% ]"
		task.wait(0.25)
	end
	loadingLabel.Text = "Loading [ 100% ]"
	task.wait(0.4)

	-- Z Ekranından Ortadan Çıkış Animasyonu
	TweenService:Create(titleFrame, TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		Size = UDim2.new(0, 400, 0, 100),
		Position = UDim2.new(0.5, -200, 0.4, -50)
	}):Play()
	task.wait(0.8)

	-- Ugu Sola, Hub Sağa
	TweenService:Create(textUgu, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(-0.25, 0, 0, 0)}):Play()
	TweenService:Create(textHub, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.75, 0, 0, 0)}):Play()
	task.wait(0.6)

	-- Altını Çiz
	TweenService:Create(underline, TweenInfo.new(0.5), {Size = UDim2.new(1, 0, 0, 4), Position = UDim2.new(0, 0, 1, -5)}):Play()
	task.wait(0.8)

	-- Girişi Kapat
	TweenService:Create(loginScreen, TweenInfo.new(0.6), {BackgroundTransparency = 1, Position = UDim2.new(0, 0, -1, 0)}):Play()
	task.wait(0.6)
	loginScreen.Visible = false
	openMenu()
end)()

-- 4. ANA MENÜ
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 320, 0, 380)
mainFrame.Position = UDim2.new(0.5, -160, 0.5, -190)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 23)
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Visible = false
mainFrame.Parent = uguzHubGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = mainFrame

local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 45)
topBar.BackgroundColor3 = Color3.fromRGB(28, 28, 32)
topBar.BorderSizePixel = 0
topBar.Parent = mainFrame

local menuTitle = Instance.new("TextLabel")
menuTitle.Text = "UguzHub Pro"
menuTitle.Size = UDim2.new(0, 180, 1, 0)
menuTitle.Position = UDim2.new(0, 15, 0, 0)
menuTitle.Font = Enum.Font.GothamBold
menuTitle.TextSize = 18
menuTitle.TextXAlignment = Enum.TextXAlignment.Left
menuTitle.BackgroundTransparency = 1
menuTitle.Parent = topBar
applyRGB(menuTitle)

-- Katlama Butonu (-)
local foldBtn = Instance.new("TextButton")
foldBtn.Text = "—"
foldBtn.Size = UDim2.new(0, 45, 1, 0)
foldBtn.Position = UDim2.new(1, -45, 0, 0)
foldBtn.Font = Enum.Font.GothamBold
foldBtn.TextSize = 22
foldBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
foldBtn.BackgroundTransparency = 1
foldBtn.Parent = topBar

local folded = false
foldBtn.MouseButton1Click:Connect(function()
	folded = not folded
	if folded then
		TweenService:Create(mainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 320, 0, 45)}):Play()
		foldBtn.Text = "+"
	else
		TweenService:Create(mainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 320, 0, 380)}):Play()
		foldBtn.Text = "—"
	end
end)

-- Switch & Trade Calc İçeriği
local contentContainer = Instance.new("Frame")
contentContainer.Size = UDim2.new(1, -30, 0, 60)
contentContainer.Position = UDim2.new(0, 15, 0, 65)
contentContainer.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
contentContainer.Parent = mainFrame

local contentCorner = Instance.new("UICorner")
contentCorner.CornerRadius = UDim.new(0, 8)
contentCorner.Parent = contentContainer

local calcText = Instance.new("TextLabel")
calcText.Text = "Trade Calculator"
calcText.Size = UDim2.new(0, 150, 1, 0)
calcText.Position = UDim2.new(0, 12, 0, 0)
calcText.Font = Enum.Font.GothamSemibold
calcText.TextSize = 15
calcText.TextColor3 = Color3.fromRGB(220, 220, 220)
calcText.TextXAlignment = Enum.TextXAlignment.Left
calcText.BackgroundTransparency = 1
calcText.Parent = contentContainer

-- Switch Butonu
local switchFrame = Instance.new("Frame")
switchFrame.Size = UDim2.new(0, 50, 0, 26)
switchFrame.Position = UDim2.new(1, -62, 0.5, -13)
switchFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
switchFrame.Parent = contentContainer

local switchCorner = Instance.new("UICorner")
switchCorner.CornerRadius = UDim.new(1, 0)
switchCorner.Parent = switchFrame

local switchDot = Instance.new("Frame")
switchDot.Size = UDim2.new(0, 20, 0, 20)
switchDot.Position = UDim2.new(0, 3, 0.5, -10)
switchDot.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
switchDot.Parent = switchFrame

local dotCorner = Instance.new("UICorner")
dotCorner.CornerRadius = UDim.new(1, 0)
dotCorner.Parent = switchDot

local runBtn = Instance.new("TextButton")
runBtn.Text = "Çalıştır"
runBtn.Size = UDim2.new(1, -30, 0, 42)
runBtn.Position = UDim2.new(0, 15, 0, 140)
runBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 90)
runBtn.Font = Enum.Font.GothamBold
runBtn.TextSize = 16
runBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
runBtn.Visible = false
runBtn.Parent = mainFrame

local runCorner = Instance.new("UICorner")
runCorner.CornerRadius = UDim.new(0, 8)
runCorner.Parent = runBtn

local calcEnabled = false
switchFrame.InputBegan:Connect(function(inp)
	if inp.UserInputType == Enum.UserInputType.MouseButton1 then
		calcEnabled = not calcEnabled
		if calcEnabled then
			TweenService:Create(switchDot, TweenInfo.new(0.25), {Position = UDim2.new(1, -23, 0.5, -10)}):Play()
			TweenService:Create(switchFrame, TweenInfo.new(0.25), {BackgroundColor3 = Color3.fromRGB(0, 122, 255)}):Play()
			runBtn.Visible = true
		else
			TweenService:Create(switchDot, TweenInfo.new(0.25), {Position = UDim2.new(0, 3, 0.5, -10)}):Play()
			TweenService:Create(switchFrame, TweenInfo.new(0.25), {BackgroundColor3 = Color3.fromRGB(45, 45, 50)}):Play()
			runBtn.Visible = false
		end
	end
end)

function openMenu()
	mainFrame.Visible = true
	mainFrame.Size = UDim2.new(0, 0, 0, 0)
	mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	TweenService:Create(mainFrame, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		Size = UDim2.new(0, 320, 0, 380),
		Position = UDim2.new(0.5, -160, 0.5, -190)
	}):Play()
end

-- 5. TRADE HESAPLAYICI / BİLGİ ETİKETLEME MANTIĞI
local function createValueTag(parentObject, itemInfo)
	if parentObject:FindFirstChild("UguzValueTag") then
		parentObject.UguzValueTag:Destroy()
	end

	local billboard = Instance.new("BillboardGui")
	billboard.Name = "UguzValueTag"
	billboard.Size = UDim2.new(0, 140, 0, 45)
	billboard.AlwaysOnTop = true
	billboard.ExtentsOffset = Vector3.new(0, 1.5, 0)

	local bgFrame = Instance.new("Frame")
	bgFrame.Size = UDim2.new(1, 0, 1, 0)
	bgFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	bgFrame.BackgroundTransparency = 0.2
	bgFrame.Parent = billboard

	local tagCorner = Instance.new("UICorner")
	tagCorner.CornerRadius = UDim.new(0, 6)
	tagCorner.Parent = bgFrame

	local valLabel = Instance.new("TextLabel")
	valLabel.Text = itemInfo.weapon .. " Val: " .. itemInfo.value
	valLabel.Size = UDim2.new(1, 0, 0.5, 0)
	valLabel.Font = Enum.Font.GothamBold
	valLabel.TextSize = 13
	valLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
	valLabel.BackgroundTransparency = 1
	valLabel.Parent = bgFrame

	local demLabel = Instance.new("TextLabel")
	demLabel.Text = "Demand: " .. itemInfo.demand .. "/10"
	demLabel.Size = UDim2.new(1, 0, 0.5, 0)
	demLabel.Position = UDim2.new(0, 0, 0.5, 0)
	demLabel.Font = Enum.Font.GothamSemibold
	demLabel.TextSize = 11
	demLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
	demLabel.BackgroundTransparency = 1
	demLabel.Parent = bgFrame

	if parentObject:IsA("BasePart") then
		billboard.Parent = parentObject
	elseif parentObject:IsA("Model") and parentObject.PrimaryPart then
		billboard.Parent = parentObject.PrimaryPart
	end
end

-- Çalıştır Butonu Tıklandığında İtemleri Tarama Mantığı
runBtn.MouseButton1Click:Connect(function()
	runBtn.Text = "Yükleniyor..."
	task.wait(1.5)
	runBtn.Text = "Sistem Aktif ✅"
	runBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 100)

	-- Haritadaki ve Trade alanındaki eşleşen nesneleri bulup etiketler
	workspace.DescendantAdded:Connect(function(descendant)
		for _, data in ipairs(WEAPONS_DATA) do
			if string.find(string.lower(descendant.Name), string.lower(data.name)) then
				createValueTag(descendant, data)
			end
		end
	end)

	-- Mevcut olanları tara
	for _, descendant in ipairs(workspace:GetDescendants()) do
		for _, data in ipairs(WEAPONS_DATA) do
			if string.find(string.lower(descendant.Name), string.lower(data.name)) then
				createValueTag(descendant, data)
			end
		end
	end
end)
