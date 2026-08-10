-- ==========================================
-- 1. VERİ TABANIN (Values)
-- ==========================================
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
        ["Yellow Seer"] = { Value = 2, Range = "N/A", Stability = "Stable", Demand = 1, Rarity = 1, Change = "0" }
    }
}

-- ==========================================
-- 2. SERVİSLER VE ANA EKRAN DÜZENİ
-- ==========================================
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "UguzHub"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- RGB Efekt Fonksiyonu
local function applyRGB(stroke)
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255,0,0)),
        ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0,255,0)),
        ColorSequenceKeypoint.new(0.66, Color3.fromRGB(0,0,255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255,0,0))
    }
    gradient.Parent = stroke
    TweenService:Create(gradient, TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {Rotation = 360}):Play()
end

-- ==========================================
-- 3. YÜKLENME EKRANI (10 Saniyelik RGB)
-- ==========================================
local loadingFrame = Instance.new("Frame")
loadingFrame.Size = UDim2.new(0, 320, 0, 180)
loadingFrame.Position = UDim2.new(0.5, -160, 0.5, -90)
loadingFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Siyah Arka Plan
loadingFrame.Parent = gui

local lCorner = Instance.new("UICorner")
lCorner.CornerRadius = UDim.new(0, 12)
lCorner.Parent = loadingFrame

local lStroke = Instance.new("UIStroke")
lStroke.Thickness = 3
lStroke.Parent = loadingFrame
applyRGB(lStroke)

local titleUguz = Instance.new("TextLabel")
titleUguz.Size = UDim2.new(1, 0, 0, 50)
titleUguz.Position = UDim2.new(0, 0, 0, 20)
titleUguz.BackgroundTransparency = 1
titleUguz.Text = "UguzHub"
titleUguz.TextColor3 = Color3.fromRGB(255, 0, 0) -- Kırmızı Yazı
titleUguz.TextScaled = true
titleUguz.Font = Enum.Font.GothamBold
titleUguz.Parent = loadingFrame

local percentLabel = Instance.new("TextLabel")
percentLabel.Size = UDim2.new(1, 0, 0, 40)
percentLabel.Position = UDim2.new(0, 0, 0, 90)
percentLabel.BackgroundTransparency = 1
percentLabel.Text = "%0"
percentLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
percentLabel.TextScaled = true
percentLabel.Font = Enum.Font.Gotham
percentLabel.Parent = loadingFrame

-- 10 Saniyelik Rastgele Yükleme Algoritması
task.spawn(function()
    local current = 0
    while current < 100 do
        task.wait(math.random(3, 8) / 10)
        current = math.min(100, current + math.random(8, 22))
        percentLabel.Text = "%" .. tostring(current)
    end
    task.wait(0.5)
    loadingFrame:Destroy()
    
    -- Menüyü Başlat
    InitMenu()
end)
-- ==========================================
-- 4. ANA MENÜ VE TRADE VALUE SİSTEMİ
-- ==========================================
function InitMenu()
    -- Açıkken SAĞDA (0.8, -150), Kapalıyken SOLDAN Buton (0.02, 0)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 220)
    frame.Position = UDim2.new(0.8, -150, 0.4, -110)
    frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    frame.Parent = gui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = frame

    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 2
    stroke.Parent = frame
    applyRGB(stroke)

    -- Sol taraftaki Açma/Kapama Butonu (Kapalıyken SOLDAN Açılır)
    local mini = Instance.new("TextButton")
    mini.Size = UDim2.new(0, 50, 0, 50)
    mini.Position = UDim2.new(0.02, 0, 0.45, 0)
    mini.Text = "Uguz"
    mini.TextScaled = true
    mini.Font = Enum.Font.GothamBold
    mini.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    mini.TextColor3 = Color3.fromRGB(255, 0, 0)
    mini.Visible = false
    mini.Parent = gui

    local miniCorner = Instance.new("UICorner")
    miniCorner.CornerRadius = UDim.new(0, 12)
    miniCorner.Parent = mini

    local miniStroke = Instance.new("UIStroke")
    miniStroke.Thickness = 2
    miniStroke.Parent = mini
    applyRGB(miniStroke)

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -80, 0, 40)
    title.Position = UDim2.new(0, 10, 0, 5)
    title.BackgroundTransparency = 1
    title.Text = "UguzHub | Calculator"
    title.TextScaled = true
    title.Font = Enum.Font.GothamBold
    title.TextColor3 = Color3.fromRGB(255, 0, 0)
    title.Parent = frame

    local minimize = Instance.new("TextButton")
    minimize.Size = UDim2.new(0, 30, 0, 30)
    minimize.Position = UDim2.new(1, -35, 0, 8)
    minimize.Text = "-"
    minimize.TextScaled = true
    minimize.Font = Enum.Font.GothamBold
    minimize.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
    minimize.Parent = frame

    minimize.MouseButton1Click:Connect(function()
        frame.Visible = false
        mini.Visible = true
    end)

    mini.MouseButton1Click:Connect(function()
        mini.Visible = false
        frame.Visible = true
    end)

    -- Arama Kutusu (Search Item)
    local search = Instance.new("TextBox")
    search.Size = UDim2.new(0.9, 0, 0, 35)
    search.Position = UDim2.new(0.05, 0, 0, 50)
    search.PlaceholderText = "Search item..."
    search.Text = ""
    search.TextScaled = true
    search.Font = Enum.Font.Gotham
    search.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    search.TextColor3 = Color3.new(1, 1, 1)
    search.Parent = frame

    local searchCorner = Instance.new("UICorner")
    searchCorner.CornerRadius = UDim.new(0, 8)
    searchCorner.Parent = search

    -- Sonuç Ekranı
    local result = Instance.new("TextLabel")
    result.Size = UDim2.new(0.9, 0, 0, 110)
    result.Position = UDim2.new(0.05, 0, 0, 95)
    result.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    result.TextColor3 = Color3.new(1, 1, 1)
    result.TextScaled = true
    result.TextWrapped = true
    result.Font = Enum.Font.Gotham
    result.Text = "Search an item..."
    result.Parent = frame

    local resultCorner = Instance.new("UICorner")
    resultCorner.CornerRadius = UDim.new(0, 8)
    resultCorner.Parent = result

    search:GetPropertyChangedSignal("Text"):Connect(function()
        local query = string.lower(search.Text)
        if query == "" then
            result.Text = "Search an item..."
            return
        end

        for name, data in pairs(Values.Godlies) do
            if string.find(string.lower(name), query) then
                result.Text = name ..
                    "\nValue: " .. data.Value ..
                    "\nDemand: " .. data.Demand .. " | Rarity: " .. data.Rarity ..
                    "\nChange: " .. data.Change
                return
            end
        end
        result.Text = "No item found"
    end)

    -- ==========================================
    -- 5. AUTOMATIC TRADE OVERLAY (TAKAS VALUES)
    -- ==========================================
    local PlayerGui = player:WaitForChild("PlayerGui")
    
    local function applyTradeOverlay()
        local tradeGui = PlayerGui:FindFirstChild("TradeGui") or PlayerGui:FindFirstChild("TradeContainer")
        if not tradeGui then return end
        
        local tradeFrame = tradeGui:FindFirstChild("TradeFrame") or tradeGui
        local otherSlots = tradeFrame:FindFirstChild("OtherPlayerSlots") or tradeFrame:FindFirstChild("OtherSlots")
        
        if not otherSlots then return end
        
        local function checkSlot(slot)
            local itemName = slot.Name
            local data = Values.Godlies[itemName]
            
            if slot:FindFirstChild("ValueTag") then
                slot.ValueTag:Destroy()
            end
            
            if data then
                local tag = Instance.new("TextLabel")
                tag.Name = "ValueTag"
                tag.Size = UDim2.new(1, 0, 0.35, 0)
                tag.Position = UDim2.new(0, 0, 0.65, 0)
                tag.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                tag.BackgroundTransparency = 0.3
                tag.TextColor3 = Color3.fromRGB(255, 215, 0) -- Altın Sarısı
                tag.TextScaled = true
                tag.Font = Enum.Font.SourceSansBold
                tag.Text = "Val: " .. tostring(data.Value)
                tag.ZIndex = 10
                tag.Parent = slot
            end
        end

        for _, slot in pairs(otherSlots:GetChildren()) do
            slot.ChildAdded:Connect(function()
                task.wait(0.1)
                checkSlot(slot)
            end)
            slot.ChildRemoved:Connect(function()
                if slot:FindFirstChild("ValueTag") then
                    slot.ValueTag:Destroy()
                end
            end)
        end
    end

    -- Oyundaki Trade UI değişimlerini dinle
    task.spawn(function()
        while task.wait(1) do
            applyTradeOverlay()
        end
    end)
end
