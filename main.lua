-- ==========================================
-- 1. VALUES MODULE
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
    },
    Ancients = {},
    Vintages = {}
}

-- ==========================================
-- 2. OFFERS MODULE
-- ==========================================
local Offers = {}

Offers.Ratings = {
    MegaW = 1.25,
    W = 1.10,
    Fair = 1,
    L = 0.90,
    MegaL = 0.75
}

function Offers.Check(myValue, theirValue)
    local ratio = theirValue / myValue

    if ratio >= Offers.Ratings.MegaW then
        return "Mega W"
    elseif ratio >= Offers.Ratings.W then
        return "W"
    elseif ratio >= Offers.Ratings.Fair then
        return "Fair"
    elseif ratio >= Offers.Ratings.L then
        return "L"
    else
        return "Mega L"
    end
end

function Offers.FindNeeded(theirValue, goal, inventory, ValuesTable)
    local needed = theirValue * Offers.Ratings[goal]

    for item, amount in pairs(inventory) do
        if ValuesTable.Godlies[item] then
            if ValuesTable.Godlies[item].Value >= needed then
                return item
            end
        end
    end

    return "Nothing found"
end

-- ==========================================
-- 3. GUI SYSTEM & NOTIFICATION
-- ==========================================
local function ShowLoadingNotification(gui)
    local TweenService = game:GetService("TweenService")

    local notifFrame = Instance.new("Frame")
    notifFrame.Size = UDim2.new(0, 320, 0, 70)
    -- Ekranın dışından başlar (animasyonlu geliş için)
    notifFrame.Position = UDim2.new(1, 20, 0.85, 0)
    notifFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    notifFrame.Parent = gui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = notifFrame

    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 2
    stroke.Parent = notifFrame

    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 170)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(170, 0, 255))
    }
    gradient.Parent = stroke

    local notifTitle = Instance.new("TextLabel")
    notifTitle.Size = UDim2.new(1, -20, 0, 30)
    notifTitle.Position = UDim2.new(0, 10, 0, 5)
    notifTitle.BackgroundTransparency = 1
    notifTitle.Text = "UguzHub🌟"
    notifTitle.Font = Enum.Font.GothamBold
    notifTitle.TextSize = 18
    notifTitle.TextColor3 = Color3.fromRGB(0, 255, 170)
    notifTitle.TextXAlignment = Enum.TextXAlignment.Left
    notifTitle.Parent = notifFrame

    local notifSub = Instance.new("TextLabel")
    notifSub.Size = UDim2.new(1, -20, 0, 25)
    notifSub.Position = UDim2.new(0, 10, 0, 35)
    notifSub.BackgroundTransparency = 1
    notifSub.Text = "Sosyal medya hesaplarımızı takip edin!"
    notifSub.Font = Enum.Font.Gotham
    notifSub.TextSize = 13
    notifSub.TextColor3 = Color3.fromRGB(220, 220, 220)
    notifSub.TextXAlignment = Enum.TextXAlignment.Left
    notifSub.Parent = notifFrame

    -- Ekrana giriş animasyonu
    TweenService:Create(
        notifFrame,
        TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
        {Position = UDim2.new(1, -340, 0.85, 0)}
    ):Play()

    -- 4 Saniye durduktan sonra kaybolma animasyonu
    task.delay(4, function()
        local hideTween = TweenService:Create(
            notifFrame,
            TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
            {Position = UDim2.new(1, 20, 0.85, 0)}
        )
        hideTween:Play()
        hideTween.Completed:Wait()
        notifFrame:Destroy()
    end)
end

local function CreateGUI(Values, Offers)
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer

    local gui = Instance.new("ScreenGui")
    gui.Name = "MM2MobileHelper"
    gui.ResetOnSpawn = false
    gui.Parent = player:WaitForChild("PlayerGui")

    local UIS = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")

    -- Yüklenme bildirimini çalıştır
    ShowLoadingNotification(gui)

    local function makeDraggable(object)
        local dragging = false
        local dragStart
        local startPos

        object.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = object.Position
            end
        end)

        UIS.InputChanged:Connect(function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                local delta = input.Position - dragStart
                object.Position = UDim2.new(
                    startPos.X.Scale,
                    startPos.X.Offset + delta.X,
                    startPos.Y.Scale,
                    startPos.Y.Offset + delta.Y
                )
            end
        end)

        UIS.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = false
            end
        end)
    end

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0,300,0,210)
    frame.Position = UDim2.new(0.5, -150, 0.5, -100)
    frame.BackgroundColor3 = Color3.fromRGB(35,35,35)
    frame.Parent = gui
    frame.Active = true

    makeDraggable(frame)

    local mini = Instance.new("TextButton")
    mini.Size = UDim2.new(0,50,0,50)
    mini.Position = frame.Position
    mini.Text = "MM2"
    mini.TextScaled = true
    mini.Font = Enum.Font.GothamBold
    mini.BackgroundColor3 = Color3.fromRGB(35,35,35)
    mini.TextColor3 = Color3.new(1,1,1)
    mini.Visible = false
    mini.Parent = gui
    mini.Active = true

    makeDraggable(mini)

    local normalSize = mini.Size

    mini.MouseEnter:Connect(function()
        TweenService:Create(mini, TweenInfo.new(0.15), {Size = UDim2.new(0,60,0,60)}):Play()
    end)

    mini.MouseLeave:Connect(function()
        TweenService:Create(mini, TweenInfo.new(0.15), {Size = normalSize}):Play()
    end)

    local miniCorner = Instance.new("UICorner")
    miniCorner.CornerRadius = UDim.new(0,12)
    miniCorner.Parent = mini

    local miniStroke = Instance.new("UIStroke")
    miniStroke.Thickness = 2
    miniStroke.Parent = mini

    local miniGradient = Instance.new("UIGradient")
    miniGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0,255,170)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0,120,255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0,255,170))
    }
    miniGradient.Parent = miniStroke

    TweenService:Create(
        miniGradient,
        TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1),
        {Rotation = 360}
    ):Play()

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0,12)
    corner.Parent = frame

    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 2
    stroke.Parent = frame

    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0,170,255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(170,0,255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0,170,255))
    }
    gradient.Parent = stroke

    local rotateTween = TweenService:Create(
        gradient,
        TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1),
        {Rotation = 360}
    )
    rotateTween:Play()

    local shadow = Instance.new("UIStroke")
    shadow.Thickness = 2
    shadow.Color = Color3.fromRGB(80,80,80)
    shadow.Transparency = 0.3
    shadow.Parent = frame

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1,-100,0,40)
    title.Position = UDim2.new(0,10,0,0)
    title.BackgroundTransparency = 1
    title.Text = "MM2 Mobile Helper"
    title.TextScaled = true
    title.Font = Enum.Font.GothamBold
    title.TextColor3 = Color3.new(1,1,1)
    title.Parent = frame

    local close = Instance.new("TextButton")
    close.Size = UDim2.new(0,35,0,35)
    close.Position = UDim2.new(1,-40,0,5)
    close.Text = "X"
    close.TextScaled = true
    close.Font = Enum.Font.GothamBold
    close.BackgroundColor3 = Color3.fromRGB(220,60,60)
    close.TextColor3 = Color3.new(1,1,1)
    close.Parent = frame
    close.MouseButton1Click:Connect(function()
        gui:Destroy()
    end)

    local minimize = Instance.new("TextButton")
    minimize.Size = UDim2.new(0,35,0,35)
    minimize.Position = UDim2.new(1,-80,0,5)
    minimize.Text = "-"
    minimize.TextScaled = true
    minimize.Font = Enum.Font.GothamBold
    minimize.BackgroundColor3 = Color3.fromRGB(70,70,70)
    minimize.TextColor3 = Color3.new(1,1,1)

  minimize.MouseButton1Click:Connect(function()
        local tween = TweenService:Create(frame, TweenInfo.new(0.25), {Size = UDim2.new(0,0,0,0)})
        tween:Play()
        tween.Completed:Wait()

        frame.Visible = false
        frame.Size = UDim2.new(0,300,0,210)
        mini.Visible = true
    end)

    mini.MouseButton1Click:Connect(function()
        mini.Visible = false
        frame.Visible = true
        frame.Size = UDim2.new(0,0,0,0)

        TweenService:Create(frame, TweenInfo.new(0.25), {Size = UDim2.new(0,300,0,210)}):Play()
    end)

    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0,8)
    closeCorner.Parent = close

    local search = Instance.new("TextBox")
    search.Size = UDim2.new(0.9,0,0,40)
    search.Position = UDim2.new(0.05,0,0,55)
    search.PlaceholderText = "Search item..."
    search.Text = ""
    search.TextScaled = true
    search.Font = Enum.Font.Gotham
    search.BackgroundColor3 = Color3.fromRGB(55,55,55)
    search.TextColor3 = Color3.new(1,1,1)
    search.Parent = frame

    local result = Instance.new("TextLabel")
    result.Size = UDim2.new(0.9,0,0,60)
    result.Position = UDim2.new(0.05,0,0,110)
    result.BackgroundColor3 = Color3.fromRGB(45,45,45)
    result.TextColor3 = Color3.new(1,1,1)
    result.TextScaled = true
    result.TextWrapped = true
    result.Font = Enum.Font.Gotham
    result.Text = "Search an item..."
    result.Parent = frame

    search:GetPropertyChangedSignal("Text"):Connect(function()
        local query = string.lower(search.Text)

        if query == "" then
            result.Text = "Search an item..."
            return
        end

        for name, data in pairs(Values.Godlies) do
            if string.find(string.lower(name), query) then
                result.Text =
                    name ..
                    "\nValue: " .. data.Value ..
                    "\nDemand: " .. data.Demand ..
                    " | Rarity: " .. data.Rarity ..
                    "\nChange: " .. data.Change
                return
            end
        end

        result.Text = "No item found"
    end)

    local searchCorner = Instance.new("UICorner")
    searchCorner.CornerRadius = UDim.new(0,8)
    searchCorner.Parent = search
end

-- ==========================================
-- 4. BAŞLATICI
-- ==========================================
CreateGUI(Values, Offers
