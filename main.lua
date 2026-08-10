-- ==========================================
-- UGUZ HUB v2.0 - ADVANCED TRADE & VALUE SYSTEM
-- ==========================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local player = Players.LocalPlayer

-- Var olan UI varsa temizle
if CoreGui:FindFirstChild("UguzHubV2") then
    CoreGui.UguzHubV2:Destroy()
end

local gui = Instance.new("ScreenGui")
gui.Name = "UguzHubV2"
gui.ResetOnSpawn = false
gui.Parent = (gethui and gethui()) or CoreGui or player:WaitForChild("PlayerGui")

-- ==========================================
-- 1. VERİ TABANI (MM2 GODLIES / ANCIENT)
-- ==========================================
local Values = {
    ["Traveler's Gun"] = 5600, ["Evergun"] = 3450, ["Constellation"] = 2700,
    ["Evergreen"] = 2500, ["Turkey"] = 2450, ["Vampire's Gun"] = 1950,
    ["Alienbeam"] = 1850, ["Darkshot"] = 1700, ["Darksword"] = 1675,
    ["Raygun"] = 1550, ["Blossom"] = 1330, ["Sakura"] = 1320,
    ["Sunrise"] = 1125, ["Snowcannon"] = 850, ["Bauble"] = 825,
    ["Sunset"] = 625, ["Soul"] = 615, ["Spirit"] = 605,
    ["Rainbow Gun"] = 420, ["Flora"] = 410, ["Rainbow"] = 410,
    ["Bloom"] = 400, ["Watergun"] = 250, ["Icecream"] = 160,
    ["Treat"] = 155, ["Beachy"] = 150, ["Sands"] = 150,
    ["Sweet"] = 150, ["Borealis"] = 145, ["Australis"] = 140,
    ["Bat"] = 120, ["Pearlshine"] = 85, ["Pearl"] = 80,
    ["Candy"] = 80, ["Heartblade"] = 65, ["Luger"] = 40,
    ["Red Luger"] = 37, ["Phantom"] = 35, ["Spectre"] = 35,
    ["Candleflame"] = 33, ["Darkbringer"] = 33, ["Elderwood Blade"] = 33,
    ["Elderwood Revolver"] = 33, ["Iceblaster"] = 33, ["Lightbringer"] = 33,
    ["Makeshift"] = 33, ["Sugar"] = 32, ["Green Luger"] = 23,
    ["Laser"] = 22, ["Amerilaser"] = 22, ["Hallowgun"] = 20,
    ["Nightblade"] = 20, ["Shark"] = 20, ["Icebeam"] = 18,
    ["Pixel"] = 17, ["Ginger Luger"] = 17, ["Iceflake"] = 15,
    ["Gemstone"] = 15, ["Bioblade"] = 8, ["Seer"] = 3
}

local function applyGradient(instance)
    local uig = Instance.new("UIGradient")
    uig.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 128)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(120, 0, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 230, 255))
    }
    uig.Parent = instance
    return uig
end

-- ==========================================
-- 2. GELİŞMİŞ MODERN GİRİŞ EKRANI
-- ==========================================
local loaderFrame = Instance.new("Frame")
loaderFrame.Size = UDim2.new(0, 380, 0, 220)
loaderFrame.Position = UDim2.new(0.5, -190, 0.5, -110)
loaderFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
loaderFrame.BorderSizePixel = 0
loaderFrame.Parent = gui

local lCorner = Instance.new("UICorner", loaderFrame)
lCorner.CornerRadius = UDim.new(0, 16)

local lStroke = Instance.new("UIStroke", loaderFrame)
lStroke.Thickness = 2
applyGradient(lStroke)

local hubTitle = Instance.new("TextLabel", loaderFrame)
hubTitle.Size = UDim2.new(1, 0, 0, 50)
hubTitle.Position = UDim2.new(0, 0, 0, 25)
hubTitle.BackgroundTransparency = 1
hubTitle.Text = "UGUZ HUB"
hubTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
hubTitle.TextSize = 28
hubTitle.Font = Enum.Font.FredokaOne
applyGradient(hubTitle)

local statusLabel = Instance.new("TextLabel", loaderFrame)
statusLabel.Size = UDim2.new(1, 0, 0, 25)
statusLabel.Position = UDim2.new(0, 0, 0, 80)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Veritabanı ve Trade modülleri yükleniyor..."
statusLabel.TextColor3 = Color3.fromRGB(180, 180, 200)
statusLabel.TextSize = 13
statusLabel.Font = Enum.Font.GothamMedium

local barBackground = Instance.new("Frame", loaderFrame)
barBackground.Size = UDim2.new(0.8, 0, 0, 10)
barBackground.Position = UDim2.new(0.1, 0, 0, 125)
barBackground.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
Instance.new("UICorner", barBackground).CornerRadius = UDim.new(1, 0)

local barFill = Instance.new("Frame", barBackground)
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", barFill).CornerRadius = UDim.new(1, 0)
applyGradient(barFill)

local percentText = Instance.new("TextLabel", loaderFrame)
percentText.Size = UDim2.new(1, 0, 0, 30)
percentText.Position = UDim2.new(0, 0, 0, 145)
percentText.BackgroundTransparency = 1
percentText.Text = "%0"
percentText.TextColor3 = Color3.fromRGB(255, 255, 255)
percentText.TextSize = 16
percentText.Font = Enum.Font.GothamBold

-- Yüklenme Efekti
task.spawn(function()
    for i = 1, 100 do
        barFill.Size = UDim2.new(i / 100, 0, 1, 0)
        percentText.Text = "%" .. i
        if i == 30 then statusLabel.Text = "MM2 Arayüzü taranıyor..." end
        if i == 70 then statusLabel.Text = "Değer listesi senkronize ediliyor..." end
        task.wait(0.02)
    end
    statusLabel.Text = "Hazır!"
    task.wait(0.4)
    TweenService:Create(loaderFrame, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
    loaderFrame:Destroy()
    InitMainHub()
end)

-- ==========================================
-- 3. GELİŞMİŞ ANA MENÜ VE TRADE ANALİZ PANELİ
-- ==========================================
function InitMainHub()
    -- Ana Menü
    local mainFrame = Instance.new("Frame", gui)
    mainFrame.Size = UDim2.new(0, 340, 0, 260)
    mainFrame.Position = UDim2.new(0.05, 0, 0.3, 0)
    mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
    mainFrame.BorderSizePixel = 0
    mainFrame.Active = true
    mainFrame.Draggable = true

    Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 14)
    local mainStroke = Instance.new("UIStroke", mainFrame)
    mainStroke.Thickness = 2
    applyGradient(mainStroke)

    local header = Instance.new("TextLabel", mainFrame)
    header.Size = UDim2.new(1, -40, 0, 45)
    header.Position = UDim2.new(0, 15, 0, 0)
    header.BackgroundTransparency = 1
    header.Text = "UGUZ HUB | Trade Assistant"
    header.TextColor3 = Color3.fromRGB(255, 255, 255)
    header.TextSize = 16
    header.Font = Enum.Font.GothamBold
    header.TextXAlignment = Enum.TextXAlignment.Left

    local searchBox = Instance.new("TextBox", mainFrame)
    searchBox.Size = UDim2.new(0.9, 0, 0, 36)
    searchBox.Position = UDim2.new(0.05, 0, 0, 50)
    searchBox.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    searchBox.PlaceholderText = "Eşya ara (ör: Bat, Gemstone)..."
    searchBox.Text = ""
    searchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    searchBox.Font = Enum.Font.Gotham
    searchBox.TextSize = 14
    Instance.new("UICorner", searchBox).CornerRadius = UDim.new(0, 8)

    local infoDisplay = Instance.new("TextLabel", mainFrame)
    infoDisplay.Size = UDim2.new(0.9, 0, 0, 145)
    infoDisplay.Position = UDim2.new(0.05, 0, 0, 95)
    infoDisplay.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    infoDisplay.TextColor3 = Color3.fromRGB(220, 220, 220)
    infoDisplay.Font = Enum.Font.Gotham
    infoDisplay.TextSize = 14
    infoDisplay.Text = "Aramak istediğiniz silahın adını yazın.\nTakasa girdiğinizde değerler otomatik hesaplanır."
    infoDisplay.TextWrapped = true
    Instance.new("UICorner", infoDisplay).CornerRadius = UDim.new(0, 8)

    searchBox:GetPropertyChangedSignal("Text"):Connect(function()
        local q = string.lower(searchBox.Text)
        if q == "" then
            infoDisplay.Text = "Aramak istediğiniz silahın adını yazın."
            return
        end
        for item, val in pairs(Values) do
            if string.find(string.lower(item), q) then
                infoDisplay.Text = "Eşya: " .. item .. "\n\nDeğer (Value): " .. tostring(val)
                return
            end
        end
        infoDisplay.Text = "Aramaya uygun eşya bulunamadı."
    end)

    -- ==========================================
    -- 4. CANLI TRADE VALUE & W/F/L SİSTEMİ
    -- ==========================================
    local tradeWFLFrame = Instance.new("Frame", gui)
    tradeWFLFrame.Size = UDim2.new(0, 360, 0, 80)
    tradeWFLFrame.Position = UDim2.new(0.5, -180, 0.85, 0)
    tradeWFLFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 22)
    tradeWFLFrame.Visible = false
    Instance.new("UICorner", tradeWFLFrame).CornerRadius = UDim.new(0, 12)
    local wflStroke = Instance.new("UIStroke", tradeWFLFrame)
    wflStroke.Thickness = 2
    wflStroke.Color = Color3.fromRGB(255, 215, 0)

    local wflStatus = Instance.new("TextLabel", tradeWFLFrame)
    wflStatus.Size = UDim2.new(1, 0, 0, 35)
    wflStatus.Position = UDim2.new(0, 0, 0, 5)
    wflStatus.BackgroundTransparency = 1
    wflStatus.Text = "TRADE ANALİZİ"
    wflStatus.Font = Enum.Font.FredokaOne
    wflStatus.TextSize = 22
    wflStatus.TextColor3 = Color3.fromRGB(255, 255, 255)

    local wflDetails = Instance.new("TextLabel", tradeWFLFrame)
    wflDetails.Size = UDim2.new(1, 0, 0, 30)
    wflDetails.Position = UDim2.new(0, 0, 0, 40)
    wflDetails.BackgroundTransparency = 1
    wflDetails.Text = "Sen: 0 | Karşı: 0"
    wflDetails.Font = Enum.Font.GothamBold
    wflDetails.TextSize = 14
    wflDetails.TextColor3 = Color3.fromRGB(200, 200, 200)

    -- Slot Değer Taraftarı & Hesaplayıcı
    local function getItemValue(slot)
        for _, desc in pairs(slot:GetDescendants()) do
            if desc:IsA("TextLabel") or desc:IsA("TextBox") then
                if Values[desc.Text] then return Values[desc.Text] end
            elseif desc:IsA("ImageLabel") or desc:IsA("ImageButton") then
                if Values[desc.Name] then return Values[desc.Name] end
            end
        end
        if Values[slot.Name] then return Values[slot.Name] end
        return 0
    end

    local function attachOverlay(slot, val)
        if slot:FindFirstChild("ValTag") then slot.ValTag:Destroy() end
        if val > 0 then
            local tag = Instance.new("TextLabel")
            tag.Name = "ValTag"
            tag.Size = UDim2.new(0.9, 0, 0.3, 0)
            tag.Position = UDim2.new(0.05, 0, 0.35, 0)
            tag.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            tag.BackgroundTransparency = 0.2
            tag.TextColor3 = Color3.fromRGB(255, 215, 0)
            tag.Font = Enum.Font.FredokaOne
            tag.TextSize = 14
            tag.Text = "VAL: " .. val
            tag.ZIndex = 100
            Instance.new("UICorner", tag).CornerRadius = UDim.new(0, 6)
            tag.Parent = slot
        end
    end

    -- Trade Tarama Döngüsü
    task.spawn(function()
        local PlayerGui = player:WaitForChild("PlayerGui")
        while task.wait(0.3) do
            local tradeGui = PlayerGui:FindFirstChild("TradeContainer", true) or PlayerGui:FindFirstChild("TradeFrame", true) or PlayerGui:FindFirstChild("TradeGui", true)
            
            if tradeGui and tradeGui.Visible then
                tradeWFLFrame.Visible = true
                
                local myValue = 0
                local opponentValue = 0

                -- Slot Yapılarını Dinamik Tara
                for _, obj in pairs(tradeGui:GetDescendants()) do
                    if obj:IsA("Frame") or obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
                        local val = getItemValue(obj)
                        if val > 0 then
                            attachOverlay(obj, val)
                            
                            -- Hangi Tarafın Kutusu Olduğunu Tespit Et
                            local pName = string.lower(obj:GetFullName())
                            if string.find(pName, "my") or string.find(pName, "your") or string.find(pName, "container1") then
                                myValue = myValue + val
                            else
                                opponentValue = opponentValue + val
                            end
                        end
                    end
                end

                -- W/F/L Hesaplama Logiği
                wflDetails.Text = "Senin Teklifin: " .. myValue .. " | Karşı Taraf: " .. opponentValue
                if myValue == 0 and opponentValue == 0 then
                    wflStatus.Text = "EŞYA BEKLENİYOR"
                    wflStatus.TextColor3 = Color3.fromRGB(200, 200, 200)
                elseif opponentValue > myValue then
                    wflStatus.Text = "WIN (KÂRDASIN)"
                    wflStatus.TextColor3 = Color3.fromRGB(50, 255, 100)
                elseif opponentValue == myValue or math.abs(opponentValue - myValue) <= 5 then
                    wflStatus.Text = "FAIR (EŞİT TRADE)"
                    wflStatus.TextColor3 = Color3.fromRGB(255, 215, 0)
                else
                    wflStatus.Text = "LOSE (ZARARDASIN)"
                    wflStatus.TextColor3 = Color3.fromRGB(255, 50, 50)
                end
            else
                tradeWFLFrame.Visible = false
            end
        end
    end)
end
