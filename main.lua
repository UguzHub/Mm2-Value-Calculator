--[[
    UguzHub MM2 Value Calculator v2
    ------------------------------------------------------------
    - Animasyonlu giriş (intro) ekranı
    - Soldan açılıp kapanan modern kayar menü
    - "MM2 Value Calculator" sekmesi (arama kutusu + eşya listesi)
    - Listeden eşyaya tıklayınca envantera ekler
    - ENVANTER bölümü: Eklenen eşyaların değeri otomatik hesaplanır
    - V tuşu: hızlı arama kutusu açar, yazıp Enter'a basınca envantera ekler
    - Alt köşede "UguzHub" başlıklı bildirim sistemi

    ENVANTER SİSTEMİ:
    - Eşya ekle/çıkar
    - Toplam değeri otomatik hesapla
    - Eşya sayısını göster
    - Birden fazla sekmeli görünüm
    
    Trade başladığında/eşya konulduğunda:
        UguzHub.ShowTradeValue("Harvester")
    
    Trade bittiğinde:
        UguzHub.HideTradeValue()
    
    Envantera eşya ekle:
        UguzHub.AddToInventory("Luger", 1)
    
    Envanterden eşya çıkar:
        UguzHub.RemoveFromInventory("Luger", 1)
    
    Envanteri temizle:
        UguzHub.ClearInventory()
    ------------------------------------------------------------
]]

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local UguzHub = {}
UguzHub.Inventory = {}

-- ===================== DEĞER TABLOSU =====================
local Values = {
    Godlies = {
        ["Traveler's Gun"] = { Value = 5600, Range = "N/A", Stability = "Stable", Demand = 5, Rarity = 5, Change = "+100" },
        ["Evergun"] = { Value = 3450, Range = "N/A", Stability = "Stable", Demand = 5, Rarity = 4, Change = "-25" },
        ["Constellation"] = { Value = 2700, Range = "N/A", Stability = "Stable", Demand = 5, Rarity = 4, Change = "-25" },
        ["Evergreen"] = { Value = 2500, Range = "N/A", Stability = "Stable", Demand = 5, Rarity = 4, Change = "-25" },
        ["Turkey"] = { Value = 2450, Range = "N/A", Stability = "Stable", Demand = 5, Rarity = 4, Change = "-25" },
        ["Vampire's Gun"] = { Value = 1950, Range = "N/A", Stability = "Stable", Demand = 5, Rarity = 4, Change = "+25" },
        ["Alienbeam"] = { Value = 1850, Range = "N/A", Stability = "Stable", Demand = 5, Rarity = 4, Change = "-25" },
        ["Darkshot"] = { Value = 1700, Range = "1700 - 1725", Stability = "Doing Well", Demand = 6, Rarity = 4, Change = "+25" },
        ["Darksword"] = { Value = 1675, Range = "1675 - 1700", Stability = "Doing Well", Demand = 6, Rarity = 4, Change = "+25" },
        ["Raygun"] = { Value = 1550, Range = "1550 - 1600", Stability = "Overpaid For", Demand = 6, Rarity = 3, Change = "+50" },
        ["Blossom"] = { Value = 1330, Range = "1330 - 1350", Stability = "Doing Well", Demand = 6, Rarity = 4, Change = "+10" },
        ["Sakura"] = { Value = 1320, Range = "1320 - 1340", Stability = "Doing Well", Demand = 6, Rarity = 4, Change = "+10" },
        ["Sunrise"] = { Value = 1125, Range = "N/A", Stability = "Stable", Demand = 5, Rarity = 4, Change = "+25" },
        ["Snowcannon"] = { Value = 850, Range = "N/A", Stability = "Stable", Demand = 5, Rarity = 3, Change = "+25" },
        ["Bauble"] = { Value = 825, Range = "N/A", Stability = "Stable", Demand = 5, Rarity = 4, Change = "-25" },
        ["Sunset"] = { Value = 625, Range = "N/A", Stability = "Stable", Demand = 5, Rarity = 3, Change = "+25" },
        ["Soul"] = { Value = 615, Range = "N/A", Stability = "Stable", Demand = 5, Rarity = 3, Change = "+5" },
        ["Spirit"] = { Value = 605, Range = "N/A", Stability = "Stable", Demand = 5, Rarity = 3, Change = "+5" },
        ["Rainbow Gun"] = { Value = 420, Range = "N/A", Stability = "Stable", Demand = 5, Rarity = 3, Change = "+5" },
        ["Flora"] = { Value = 410, Range = "N/A", Stability = "Stable", Demand = 5, Rarity = 3, Change = "+10" },
        ["Rainbow"] = { Value = 410, Range = "N/A", Stability = "Stable", Demand = 5, Rarity = 3, Change = "+5" },
        ["Bloom"] = { Value = 400, Range = "N/A", Stability = "Stable", Demand = 5, Rarity = 3, Change = "+10" },
        ["Watergun"] = { Value = 250, Range = "N/A", Stability = "Stable", Demand = 3, Rarity = 3, Change = "-10" },
        ["Icecream"] = { Value = 160, Range = "150 - 165", Stability = "Fluctuating", Demand = 3, Rarity = 3, Change = "-40" },
        ["Treat"] = { Value = 155, Range = "N/A", Stability = "Stable", Demand = 3, Rarity = 3, Change = "-5" },
        ["Beachy"] = { Value = 150, Range = "140 - 155", Stability = "Fluctuating", Demand = 3, Rarity = 3, Change = "-10" },
        ["Sands"] = { Value = 150, Range = "140 - 155", Stability = "Fluctuating", Demand = 3, Rarity = 3, Change = "-10" },
        ["Sweet"] = { Value = 150, Range = "N/A", Stability = "Stable", Demand = 3, Rarity = 3, Change = "-5" },
        ["Borealis"] = { Value = 145, Range = "N/A", Stability = "Stable", Demand = 3, Rarity = 3, Change = "-5" },
        ["Australis"] = { Value = 140, Range = "N/A", Stability = "Stable", Demand = 3, Rarity = 3, Change = "-5" },
        ["Bat"] = { Value = 120, Range = "115 - 125", Stability = "Fluctuating", Demand = 2, Rarity = 2, Change = "-5" },
        ["Pearlshine"] = { Value = 85, Range = "N/A", Stability = "Stable", Demand = 2, Rarity = 3, Change = "-5" },
        ["Pearl"] = { Value = 80, Range = "N/A", Stability = "Stable", Demand = 2, Rarity = 3, Change = "-5" },
        ["Candy"] = { Value = 80, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "-5" },
        ["Heartblade"] = { Value = 65, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "-2" },
        ["Luger"] = { Value = 40, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "-2" },
        ["Red Luger"] = { Value = 37, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "-1" },
        ["Phantom"] = { Value = 35, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "-2" },
        ["Spectre"] = { Value = 35, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "-2" },
        ["Candleflame"] = { Value = 33, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "-2" },
        ["Darkbringer"] = { Value = 33, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "-2" },
        ["Elderwood Blade"] = { Value = 33, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "-2" },
        ["Elderwood Revolver"] = { Value = 33, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "-2" },
        ["Iceblaster"] = { Value = 33, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "-2" },
        ["Lightbringer"] = { Value = 33, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "-2" },
        ["Makeshift"] = { Value = 33, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "-2" },
        ["Sugar"] = { Value = 32, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "-1" },
        ["Ornament"] = { Value = 28, Range = "25 - 30", Stability = "Fluctuating", Demand = 1, Rarity = 2, Change = "+1" },
        ["Green Luger"] = { Value = 23, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "-2" },
        ["Amerilaser"] = { Value = 22, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "-1" },
        ["Laser"] = { Value = 22, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "-1" },
        ["Hallowgun"] = { Value = 20, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "-2" },
        ["Nightblade"] = { Value = 20, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "-2" },
        ["Shark"] = { Value = 20, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "0" },
        ["Icebeam"] = { Value = 18, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "-2" },
        ["Pixel"] = { Value = 17, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "-3" },
        ["Ginger Luger"] = { Value = 17, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "-3" },
        ["Iceflake"] = { Value = 15, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "-2" },
        ["Gemstone"] = { Value = 15, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "-2" },
        ["Old Glory"] = { Value = 15, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "-2" },
        ["Eternalcane"] = { Value = 13, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "-2" },
        ["Deathshard"] = { Value = 13, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "-2" },
        ["Jinglegun"] = { Value = 13, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "-2" },
        ["Gingerblade"] = { Value = 13, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "-2" },
        ["Lugercane"] = { Value = 13, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "-2" },
        ["Bioblade"] = { Value = 8, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "-2" },
        ["Eternal III"] = { Value = 8, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "-2" },
        ["Eternal IV"] = { Value = 8, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "-2" },
        ["Hallow's Blade"] = { Value = 8, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "0" },
        ["Hallow's Edge"] = { Value = 8, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "0" },
        ["Handsaw"] = { Value = 8, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "0" },
        ["Boneblade"] = { Value = 7, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "0" },
        ["Eternal"] = { Value = 7, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "-1" },
        ["Eternal II"] = { Value = 7, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "-1" },
        ["Frostbite"] = { Value = 7, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "0" },
        ["Ghostblade"] = { Value = 7, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "0" },
        ["Ice Dragon"] = { Value = 7, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "-1" },
        ["Ice Shard"] = { Value = 7, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "-1" },
        ["Prismatic"] = { Value = 7, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "0" },
        ["Pumpking"] = { Value = 7, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "-1" },
        ["Saw"] = { Value = 7, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "0" },
        ["Xmas"] = { Value = 7, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "-1" },
        ["Eggblade"] = { Value = 5, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "0" },
        ["Flames"] = { Value = 5, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "-2" },
        ["Snowflake"] = { Value = 5, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "0" },
        ["Winter's Edge"] = { Value = 5, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "-2" },
        ["Peppermint"] = { Value = 4, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "0" },
        ["Cookieblade"] = { Value = 3, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 2, Change = "0" },
        ["Blue Seer"] = { Value = 3, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 1, Change = "0" },
        ["Purple Seer"] = { Value = 3, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 1, Change = "0" },
        ["Red Seer"] = { Value = 3, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 1, Change = "0" },
        ["Seer"] = { Value = 3, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 1, Change = "0" },
        ["Orange Seer"] = { Value = 2, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 1, Change = "0" },
        ["Yellow Seer"] = { Value = 2, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 1, Change = "0" },
    },
    Ancients = {},
    Vintages = {},
}

local function findItem(itemName)
    for _, category in pairs(Values) do
        if category[itemName] then
            return category[itemName]
        end
    end
    return nil
end

local function getTotalInventoryValue()
    local total = 0
    for itemName, quantity in pairs(UguzHub.Inventory) do
        local item = findItem(itemName)
        if item then
            total = total + (item.Value * quantity)
        end
    end
    return total
end

-- ===================== ESKİ GUI TEMİZLE =====================
if playerGui:FindFirstChild("UguzHub") then
    playerGui.UguzHub:Destroy()
end

-- ===================== ANA SCREENGUI =====================
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "UguzHub"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.DisplayOrder = 999
screenGui.Parent = playerGui

-- ===================== RENK / STİL =====================
local COL_BG      = Color3.fromRGB(24, 24, 28)
local COL_PANEL   = Color3.fromRGB(32, 32, 38)
local COL_ACCENT  = Color3.fromRGB(88, 101, 242)
local COL_TEXT    = Color3.fromRGB(235, 235, 240)
local COL_SUBTEXT = Color3.fromRGB(160, 160, 170)
local COL_GOOD    = Color3.fromRGB(90, 220, 130)
local COL_BAD     = Color3.fromRGB(230, 90, 90)

local function corner(inst, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius or 10)
    c.Parent = inst
    return c
end

local function stroke(inst, color, thickness)
    local s = Instance.new("UIStroke")
    s.Color = color or COL_ACCENT
    s.Thickness = thickness or 1
    s.Transparency = 0.5
    s.Parent = inst
    return s
end

-- ===================== INTRO =====================
local intro = Instance.new("Frame")
intro.Name = "Intro"
intro.Size = UDim2.new(1, 0, 1, 0)
intro.BackgroundColor3 = COL_BG
intro.BorderSizePixel = 0
intro.ZIndex = 100
intro.Parent = screenGui

local introTitle = Instance.new("TextLabel")
introTitle.Size = UDim2.new(0, 500, 0, 80)
introTitle.AnchorPoint = Vector2.new(0.5, 0.5)
introTitle.Position = UDim2.new(0.5, 0, 0.5, 0)
introTitle.BackgroundTransparency = 1
introTitle.Font = Enum.Font.GothamBlack
introTitle.TextSize = 46
introTitle.TextColor3 = COL_TEXT
introTitle.TextTransparency = 1
introTitle.Text = "UguzHub"
introTitle.ZIndex = 101
introTitle.Parent = intro

local introSub = Instance.new("TextLabel")
introSub.Size = UDim2.new(0, 500, 0, 30)
introSub.AnchorPoint = Vector2.new(0.5, 0.5)
introSub.Position = UDim2.new(0.5, 0, 0.62, 0)
introSub.BackgroundTransparency = 1
introSub.Font = Enum.Font.Gotham
introSub.TextSize = 16
introSub.TextColor3 = COL_SUBTEXT
introSub.TextTransparency = 1
introSub.Text = "yükleniyor..."
introSub.ZIndex = 101
introSub.Parent = intro

local accentBar = Instance.new("Frame")
accentBar.Size = UDim2.new(0, 0, 0, 4)
accentBar.AnchorPoint = Vector2.new(0.5, 0.5)
accentBar.Position = UDim2.new(0.5, 0, 0.58, 0)
accentBar.BackgroundColor3 = COL_ACCENT
accentBar.BorderSizePixel = 0
accentBar.ZIndex = 101
accentBar.Parent = intro
corner(accentBar, 2)

task.spawn(function()
    TweenService:Create(introTitle, TweenInfo.new(0.8, Enum.EasingStyle.Quad), {TextTransparency = 0}):Play()
    task.wait(0.3)
    TweenService:Create(introSub, TweenInfo.new(0.6, Enum.EasingStyle.Quad), {TextTransparency = 0}):Play()
    TweenService:Create(accentBar, TweenInfo.new(0.7, Enum.EasingStyle.Quad), {Size = UDim2.new(0, 220, 0, 4)}):Play()
    task.wait(1.4)

    TweenService:Create(introTitle, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
    TweenService:Create(introSub, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
    TweenService:Create(accentBar, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
    TweenService:Create(intro, TweenInfo.new(0.6), {BackgroundTransparency = 1}):Play()
    task.wait(0.65)
    intro:Destroy()
end)

-- ===================== AÇMA/KAPAMA BUTONU =====================
local toggleBtn = Instance.new("TextButton")
toggleBtn.Name = "ToggleButton"
toggleBtn.Size = UDim2.new(0, 46, 0, 46)
toggleBtn.Position = UDim2.new(0, 0, 0.5, -23)
toggleBtn.BackgroundColor3 = COL_PANEL
toggleBtn.Text = ">"
toggleBtn.TextColor3 = COL_TEXT
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextSize = 20
toggleBtn.AutoButtonColor = false
toggleBtn.ZIndex = 10
toggleBtn.Parent = screenGui
local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 8)
toggleCorner.Parent = toggleBtn
stroke(toggleBtn)

-- ===================== ANA MENÜ PANELİ =====================
local menu = Instance.new("Frame")
menu.Name = "MainMenu"
menu.Size = UDim2.new(0, 320, 0, 620)
menu.Position = UDim2.new(0, -340, 0.5, -310)
menu.BackgroundColor3 = COL_BG
menu.BorderSizePixel = 0
menu.ZIndex = 5
menu.Parent = screenGui
corner(menu, 14)
stroke(menu, COL_ACCENT, 1)

local menuHeader = Instance.new("TextLabel")
menuHeader.Size = UDim2.new(1, 0, 0, 46)
menuHeader.BackgroundColor3 = COL_PANEL
menuHeader.Text = "UguzHub MM2"
menuHeader.Font = Enum.Font.GothamBold
menuHeader.TextSize = 18
menuHeader.TextColor3 = COL_TEXT
menuHeader.ZIndex = 6
menuHeader.Parent = menu
corner(menuHeader, 14)

-- Tab Buttons Container
local tabContainer = Instance.new("Frame")
tabContainer.Size = UDim2.new(1, -20, 0, 40)
tabContainer.Position = UDim2.new(0, 10, 0, 56)
tabContainer.BackgroundTransparency = 1
tabContainer.ZIndex = 6
tabContainer.Parent = menu

local tabLayout = Instance.new("UIListLayout")
tabLayout.FillDirection = Enum.FillDirection.Horizontal
tabLayout.Padding = UDim.new(0, 6)
tabLayout.Parent = tabContainer

-- Tab 1: Kütüphane
local tab1Btn = Instance.new("TextButton")
tab1Btn.Size = UDim2.new(0.5, -3, 1, 0)
tab1Btn.BackgroundColor3 = COL_ACCENT
tab1Btn.Text = "Kütüphane"
tab1Btn.Font = Enum.Font.GothamSemibold
tab1Btn.TextSize = 12
tab1Btn.TextColor3 = COL_TEXT
tab1Btn.AutoButtonColor = false
tab1Btn.ZIndex = 6
tab1Btn.Parent = tabContainer
corner(tab1Btn, 6)

-- Tab 2: Envantera
local tab2Btn = Instance.new("TextButton")
tab2Btn.Size = UDim2.new(0.5, -3, 1, 0)
tab2Btn.BackgroundColor3 = COL_PANEL
tab2Btn.Text = "Envanterim"
tab2Btn.Font = Enum.Font.GothamSemibold
tab2Btn.TextSize = 12
tab2Btn.TextColor3 = COL_SUBTEXT
tab2Btn.AutoButtonColor = false
tab2Btn.ZIndex = 6
tab2Btn.Parent = tabContainer
corner(tab2Btn, 6)

-- Tab Contents
local tab1Content = Instance.new("Frame")
tab1Content.Name = "Tab1"
tab1Content.Size = UDim2.new(1, -20, 1, -110)
tab1Content.Position = UDim2.new(0, 10, 0, 104)
tab1Content.BackgroundTransparency = 1
tab1Content.ZIndex = 6
tab1Content.Parent = menu

local tab2Content = Instance.new("Frame")
tab2Content.Name = "Tab2"
tab2Content.Size = UDim2.new(1, -20, 1, -110)
tab2Content.Position = UDim2.new(0, 10, 0, 104)
tab2Content.BackgroundTransparency = 1
tab2Content.Visible = false
tab2Content.ZIndex = 6
tab2Content.Parent = menu

-- ===================== TAB 1: KÜTÜPHANE =====================
local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(1, 0, 0, 34)
searchBox.BackgroundColor3 = COL_PANEL
searchBox.PlaceholderText = "Eşya ara..."
searchBox.Text = ""
searchBox.Font = Enum.Font.Gotham
searchBox.TextSize = 13
searchBox.TextColor3 = COL_TEXT
searchBox.ClearTextOnFocus = false
searchBox.ZIndex = 6
searchBox.Parent = tab1Content
corner(searchBox, 6)

local list = Instance.new("ScrollingFrame")
list.Size = UDim2.new(1, 0, 1, -42)
list.Position = UDim2.new(0, 0, 0, 42)
list.BackgroundTransparency = 1
list.ScrollBarThickness = 4
list.ScrollBarImageColor3 = COL_ACCENT
list.CanvasSize = UDim2.new(0, 0, 0, 0)
list.ZIndex = 6
list.Parent = tab1Content

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 6)
layout.Parent = list

local function refreshList(filter)
    for _, child in ipairs(list:GetChildren()) do
        if child:IsA("Frame") or child:IsA("TextButton") then child:Destroy() end
    end

    filter = (filter or ""):lower()
    local count = 0
    for _, category in pairs(Values) do
        for name, item in pairs(category) do
            if filter == "" or name:lower():find(filter, 1, true) then
                count += 1
                local row = Instance.new("TextButton")
                row.Text = ""
                row.AutoButtonColor = false
                row.Size = UDim2.new(1, 0, 0, 34)
                row.BackgroundColor3 = COL_PANEL
                row.LayoutOrder = count
                row.ZIndex = 6
                row.Parent = list
                corner(row, 6)

                local nameLbl = Instance.new("TextLabel")
                nameLbl.Size = UDim2.new(0.55, 0, 1, 0)
                nameLbl.Position = UDim2.new(0, 10, 0, 0)
                nameLbl.BackgroundTransparency = 1
                nameLbl.Text = name
                nameLbl.Font = Enum.Font.Gotham
                nameLbl.TextSize = 12
                nameLbl.TextColor3 = COL_TEXT
                nameLbl.TextXAlignment = Enum.TextXAlignment.Left
                nameLbl.ZIndex = 6
                nameLbl.Parent = row

                local valLbl = Instance.new("TextLabel")
                valLbl.Size = UDim2.new(0.3, 0, 1, 0)
                valLbl.Position = UDim2.new(0.55, 0, 0, 0)
                valLbl.BackgroundTransparency = 1
                valLbl.Text = tostring(item.Value)
                valLbl.Font = Enum.Font.GothamBold
                valLbl.TextSize = 12
                valLbl.TextColor3 = COL_ACCENT
                valLbl.TextXAlignment = Enum.TextXAlignment.Right
                valLbl.ZIndex = 6
                valLbl.Parent = row

                local changeLbl = Instance.new("TextLabel")
                changeLbl.Size = UDim2.new(0.15, -10, 1, 0)
                changeLbl.Position = UDim2.new(0.85, 0, 0, 0)
                changeLbl.BackgroundTransparency = 1
                changeLbl.Text = item.Change or ""
                changeLbl.Font = Enum.Font.Gotham
                changeLbl.TextSize = 11
                local changeStr = tostring(item.Change or "")
                changeLbl.TextColor3 = (changeStr:sub(1,1) == "+") and COL_GOOD
                    or (changeStr:sub(1,1) == "-") and COL_BAD
                    or COL_SUBTEXT
                changeLbl.TextXAlignment = Enum.TextXAlignment.Right
                changeLbl.ZIndex = 6
                changeLbl.Parent = row

                row.MouseButton1Click:Connect(function()
                    UguzHub.AddToInventory(name, 1)
                end)
            end
        end
    end

    layout.Parent = list
    list.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 10)
end

searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    refreshList(searchBox.Text)
end)

refreshList()

-- ===================== TAB 2: ENVANTER =====================
local inventoryList = Instance.new("ScrollingFrame")
inventoryList.Size = UDim2.new(1, 0, 1, -50)
inventoryList.BackgroundTransparency = 1
inventoryList.ScrollBarThickness = 4
inventoryList.ScrollBarImageColor3 = COL_ACCENT
inventoryList.CanvasSize = UDim2.new(0, 0, 0, 0)
inventoryList.ZIndex = 6
inventoryList.Parent = tab2Content

local inventoryLayout = Instance.new("UIListLayout")
inventoryLayout.Padding = UDim.new(0, 6)
inventoryLayout.Parent = inventoryList

local totalValueLabel = Instance.new("TextLabel")
totalValueLabel.Size = UDim2.new(1, 0, 0, 40)
totalValueLabel.Position = UDim2.new(0, 0, 1, -40)
totalValueLabel.BackgroundColor3 = COL_PANEL
totalValueLabel.Text = "Toplam Değer: 0"
totalValueLabel.Font = Enum.Font.GothamBold
totalValueLabel.TextSize = 14
totalValueLabel.TextColor3 = COL_ACCENT
totalValueLabel.ZIndex = 6
totalValueLabel.Parent = tab2Content
corner(totalValueLabel, 6)

local function refreshInventory()
    for _, child in ipairs(inventoryList:GetChildren()) do
        if child:IsA("Frame") or child:IsA("TextButton") then child:Destroy() end
    end

    local count = 0
    for itemName, quantity in pairs(UguzHub.Inventory) do
        if quantity > 0 then
            count += 1
            local item = findItem(itemName)
            if item then
                local row = Instance.new("TextButton")
                row.Text = ""
                row.AutoButtonColor = false
                row.Size = UDim2.new(1, 0, 0, 40)
                row.BackgroundColor3 = COL_PANEL
                row.LayoutOrder = count
                row.ZIndex = 6
                row.Parent = inventoryList
                corner(row, 6)

                local nameLbl = Instance.new("TextLabel")
                nameLbl.Size = UDim2.new(0.4, 0, 1, 0)
                nameLbl.Position = UDim2.new(0, 10, 0, 0)
                nameLbl.BackgroundTransparency = 1
                nameLbl.Text = itemName
                nameLbl.Font = Enum.Font.Gotham
                nameLbl.TextSize = 12
                nameLbl.TextColor3 = COL_TEXT
                nameLbl.TextXAlignment = Enum.TextXAlignment.Left
                nameLbl.ZIndex = 6
                nameLbl.Parent = row

                local qtyLbl = Instance.new("TextLabel")
                qtyLbl.Size = UDim2.new(0.15, 0, 1, 0)
                qtyLbl.Position = UDim2.new(0.4, 0, 0, 0)
                qtyLbl.BackgroundTransparency = 1
                qtyLbl.Text = "x" .. tostring(quantity)
                qtyLbl.Font = Enum.Font.GothamSemibold
                qtyLbl.TextSize = 11
                qtyLbl.TextColor3 = COL_SUBTEXT
                qtyLbl.TextXAlignment = Enum.TextXAlignment.Center
                qtyLbl.ZIndex = 6
                qtyLbl.Parent = row

                local valLbl = Instance.new("TextLabel")
                valLbl.Size = UDim2.new(0.25, 0, 1, 0)
                valLbl.Position = UDim2.new(0.55, 0, 0, 0)
                valLbl.BackgroundTransparency = 1
                valLbl.Text = tostring(item.Value * quantity)
                valLbl.Font = Enum.Font.GothamBold
                valLbl.TextSize = 12
                valLbl.TextColor3 = COL_ACCENT
                valLbl.TextXAlignment = Enum.TextXAlignment.Right
                valLbl.ZIndex = 6
                valLbl.Parent = row

                -- Kaldır Butonu
                local removeBtn = Instance.new("TextButton")
                removeBtn.Size = UDim2.new(0.15, -5, 1, -6)
                removeBtn.Position = UDim2.new(0.8, 0, 0, 3)
                removeBtn.BackgroundColor3 = COL_BAD
                removeBtn.Text = "−"
                removeBtn.Font = Enum.Font.GothamBold
                removeBtn.TextSize = 16
                removeBtn.TextColor3 = COL_TEXT
                removeBtn.AutoButtonColor = false
                removeBtn.ZIndex = 6
                removeBtn.Parent = row
                corner(removeBtn, 4)

                removeBtn.MouseButton1Click:Connect(function()
                    UguzHub.RemoveFromInventory(itemName, 1)
                end)
            end
        end
    end

    inventoryLayout.Parent = inventoryList
    inventoryList.CanvasSize = UDim2.new(0, 0, 0, inventoryLayout.AbsoluteContentSize.Y + 10)
    
    local totalValue = getTotalInventoryValue()
    totalValueLabel.Text = "Toplam Değer: " .. tostring(totalValue)
end

-- ===================== TAB SWITCHING =====================
tab1Btn.MouseButton1Click:Connect(function()
    tab1Content.Visible = true
    tab2Content.Visible = false
    tab1Btn.BackgroundColor3 = COL_ACCENT
    tab1Btn.TextColor3 = COL_TEXT
    tab2Btn.BackgroundColor3 = COL_PANEL
    tab2Btn.TextColor3 = COL_SUBTEXT
end)

tab2Btn.MouseButton1Click:Connect(function()
    tab1Content.Visible = false
    tab2Content.Visible = true
    tab1Btn.BackgroundColor3 = COL_PANEL
    tab1Btn.TextColor3 = COL_SUBTEXT
    tab2Btn.BackgroundColor3 = COL_ACCENT
    tab2Btn.TextColor3 = COL_TEXT
    refreshInventory()
end)

-- ===================== MENÜ AÇ/KAPA =====================
local isOpen = false
toggleBtn.MouseButton1Click:Connect(function()
    isOpen = not isOpen
    if isOpen then
        TweenService:Create(menu, TweenInfo.new(0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
            {Position = UDim2.new(0, 20, 0.5, -310)}):Play()
        TweenService:Create(toggleBtn, TweenInfo.new(0.35), {Position = UDim2.new(0, 346, 0.5, -23)}):Play()
        toggleBtn.Text = "<"
    else
        TweenService:Create(menu, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.In),
            {Position = UDim2.new(0, -340, 0.5, -310)}):Play()
        TweenService:Create(toggleBtn, TweenInfo.new(0.3), {Position = UDim2.new(0, 0, 0.5, -23)}):Play()
        toggleBtn.Text = ">"
    end
end)

-- ===================== BİLDİRİM SİSTEMİ =====================
local notifHolder = Instance.new("Frame")
notifHolder.Size = UDim2.new(0, 300, 0, 400)
notifHolder.Position = UDim2.new(1, -320, 1, -20)
notifHolder.AnchorPoint = Vector2.new(0, 1)
notifHolder.BackgroundTransparency = 1
notifHolder.ZIndex = 50
notifHolder.Parent = screenGui

local notifLayout = Instance.new("UIListLayout")
notifLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
notifLayout.Padding = UDim.new(0, 8)
notifLayout.Parent = notifHolder

function UguzHub.Notify(message, duration)
    duration = duration or 4

    local notif = Instance.new("Frame")
    notif.Size = UDim2.new(1, 0, 0, 64)
    notif.BackgroundColor3 = COL_PANEL
    notif.BackgroundTransparency = 1
    notif.ZIndex = 51
    notif.Parent = notifHolder
    corner(notif, 10)
    local nstroke = stroke(notif, COL_ACCENT, 1)
    nstroke.Transparency = 1

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -16, 0, 20)
    title.Position = UDim2.new(0, 12, 0, 6)
    title.BackgroundTransparency = 1
    title.Text = "UguzHub"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 13
    title.TextColor3 = COL_ACCENT
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.TextTransparency = 1
    title.ZIndex = 51
    title.Parent = notif

    local body = Instance.new("TextLabel")
    body.Size = UDim2.new(1, -16, 0, 30)
    body.Position = UDim2.new(0, 12, 0, 26)
    body.BackgroundTransparency = 1
    body.Text = message
    body.Font = Enum.Font.Gotham
    body.TextSize = 12
    body.TextColor3 = COL_TEXT
    body.TextWrapped = true
    body.TextXAlignment = Enum.TextXAlignment.Left
    body.TextYAlignment = Enum.TextYAlignment.Top
    body.TextTransparency = 1
    body.ZIndex = 51
    body.Parent = notif

    TweenService:Create(notif, TweenInfo.new(0.3), {BackgroundTransparency = 0}):Play()
    TweenService:Create(nstroke, TweenInfo.new(0.3), {Transparency = 0.3}):Play()
    TweenService:Create(title, TweenInfo.new(0.3), {TextTransparency = 0}):Play()
    TweenService:Create(body, TweenInfo.new(0.3), {TextTransparency = 0}):Play()

    task.delay(duration, function()
        if notif and notif.Parent then
            TweenService:Create(notif, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
            TweenService:Create(nstroke, TweenInfo.new(0.3), {Transparency = 1}):Play()
            TweenService:Create(title, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
            TweenService:Create(body, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
            task.wait(0.3)
            notif:Destroy()
        end
    end)

    return notif
end

-- ===================== ENVANTER FONKSİYONLARI =====================
function UguzHub.AddToInventory(itemName, quantity)
    quantity = quantity or 1
    if findItem(itemName) then
        UguzHub.Inventory[itemName] = (UguzHub.Inventory[itemName] or 0) + quantity
        UguzHub.Notify(itemName .. " x" .. quantity .. " envantera eklendi!", 2)
        if tab2Content.Visible then
            refreshInventory()
        end
        return true
    else
        UguzHub.Notify(itemName .. " bulunamadı!", 2)
        return false
    end
end

function UguzHub.RemoveFromInventory(itemName, quantity)
    quantity = quantity or 1
    if UguzHub.Inventory[itemName] and UguzHub.Inventory[itemName] >= quantity then
        UguzHub.Inventory[itemName] = UguzHub.Inventory[itemName] - quantity
        if UguzHub.Inventory[itemName] <= 0 then
            UguzHub.Inventory[itemName] = nil
        end
        if tab2Content.Visible then
            refreshInventory()
        end
        return true
    end
    return false
end

function UguzHub.ClearInventory()
    UguzHub.Inventory = {}
    refreshInventory()
    UguzHub.Notify("Envanter temizlendi!", 2)
end

function UguzHub.GetInventoryValue()
    return getTotalInventoryValue()
end

-- ===================== TRADE DEĞER GÖSTERİMİ =====================
local activeTradeNotif = nil

function UguzHub.ShowTradeValue(itemName)
    UguzHub.HideTradeValue()

    local item = findItem(itemName)
    local text
    if item then
        text = ("%s: %s değer | talep %d/6 | %s"):format(
            itemName, tostring(item.Value), item.Demand, item.Stability
        )
    else
        text = ("%s bulunamadı!"):format(itemName)
    end

    activeTradeNotif = UguzHub.Notify(text, 999999)
end

function UguzHub.HideTradeValue()
    if activeTradeNotif and activeTradeNotif.Parent then
        local n = activeTradeNotif
        TweenService:Create(n, TweenInfo.new(0.25), {BackgroundTransparency = 1}):Play()
        for _, child in ipairs(n:GetChildren()) do
            if child:IsA("TextLabel") then
                TweenService:Create(child, TweenInfo.new(0.25), {TextTransparency = 1}):Play()
            elseif child:IsA("UIStroke") then
                TweenService:Create(child, TweenInfo.new(0.25), {Transparency = 1}):Play()
            end
        end
        task.delay(0.25, function()
            if n and n.Parent then n:Destroy() end
        end)
    end
    activeTradeNotif = nil
end

-- ===================== HIZLI ARAMA (V tuşu) =====================
local quickBox = Instance.new("Frame")
quickBox.Name = "QuickCheck"
quickBox.Size = UDim2.new(0, 320, 0, 46)
quickBox.AnchorPoint = Vector2.new(0.5, 0)
quickBox.Position = UDim2.new(0.5, 0, 0.06, 0)
quickBox.BackgroundColor3 = COL_PANEL
quickBox.BackgroundTransparency = 1
quickBox.Visible = false
quickBox.ZIndex = 80
quickBox.Parent = screenGui
corner(quickBox, 10)
local quickStroke = stroke(quickBox, COL_ACCENT, 1)
quickStroke.Transparency = 1

local quickInput = Instance.new("TextBox")
quickInput.Size = UDim2.new(1, -20, 1, -12)
quickInput.Position = UDim2.new(0, 10, 0, 6)
quickInput.BackgroundTransparency = 1
quickInput.PlaceholderText = "Eşya adı yaz, Enter'a bas..."
quickInput.Text = ""
quickInput.Font = Enum.Font.Gotham
quickInput.TextSize = 14
quickInput.TextColor3 = COL_TEXT
quickInput.ClearTextOnFocus = false
quickInput.ZIndex = 81
quickInput.Parent = quickBox

local quickOpen = false

local function setQuickVisible(state)
    quickOpen = state
    if state then
        quickBox.Visible = true
        quickInput.Text = ""
        TweenService:Create(quickBox, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
        TweenService:Create(quickStroke, TweenInfo.new(0.2), {Transparency = 0.3}):Play()
        task.wait(0.1)
        quickInput:CaptureFocus()
    else
        TweenService:Create(quickBox, TweenInfo.new(0.15), {BackgroundTransparency = 1}):Play()
        TweenService:Create(quickStroke, TweenInfo.new(0.15), {Transparency = 1}):Play()
        quickInput:ReleaseFocus()
        task.delay(0.15, function()
            quickBox.Visible = false
        end)
    end
end

UserInputService.InputBegan:Connect(function(input, processed)
    if input.KeyCode == Enum.KeyCode.V and not processed and not quickOpen then
        setQuickVisible(true)
    elseif input.KeyCode == Enum.KeyCode.Escape and quickOpen then
        setQuickVisible(false)
    end
end)

quickInput.FocusLost:Connect(function(enterPressed)
    if enterPressed and quickInput.Text ~= "" then
        UguzHub.AddToInventory(quickInput.Text, 1)
    end
    setQuickVisible(false)
end)

-- ===================== BAŞLATMA =====================
_G.UguzHub = UguzHub
UguzHub.Notify("UguzHub yüklendi! V tuşu = Hızlı Arama", 3)

return UguzHub
