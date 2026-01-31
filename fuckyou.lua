local HttpService = game:GetService("HttpService")

local free = true

local plr = game.Players.LocalPlayer
local pgui = plr.PlayerGui
local DName = plr.DisplayName
local UName = plr.Name

local WV = "false"
local status = "nil"

local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ME = ReplicatedStorage.Events.ME

local function Notify(Text,Sound,Color,Fonts)
    local Text1 = string.upper(Text)
    if Sound then
        pgui.Notify:Fire(Text,Sound)
    else
        pgui.Notify:Fire(Text)
    end
    for _,v in pairs(pgui.NotifyUI.Awards:GetChildren()) do
        if v.Name == "XPEx" and v.Text == Text1 then
            v.Text = Text
            if Color then v.TextColor3 = Color end
            if Fonts then v.Font = Enum.Font[Fonts] end
        end
    end
end

function IsInDungeon()
    return game.ReplicatedStorage.Dungeon.Value
end

function IsInPvp()
    return plr:FindFirstChild("PvPed") ~= nil
end

local allowed = {
    1029175029, 660549561, 157219748, 469203133
}

if table.find(allowed, plr.UserId) or free then
    WV = "Yes"
else
    WV = "No"
end

local embedcolor = 4388219

if WV == "Yes" and IsInPvp() then
    status = "In PvP"
    embedcolor = 16562691
elseif WV == "Yes" and IsInDungeon() then
    status = "In dungeon"
    embedcolor = 4360181
elseif WV == "Yes" then
    status = "In overworld"
    embedcolor = 5827380
else
    status = "Not whitelisted"
end

if free and WV == "Yes" then
    status = status .. ", free access"
end

if workspace:FindFirstChild("TempKey") then
    WV = "Yes"
    local old = status
    status = "Using whitelist key, "..old.."."
end

if WV == "No" then
    Notify("You are not whitelisted.", "buzz", Color3.fromRGB(235, 80, 80), "RobotoMono")
else
    Notify("Dragon Style loaded.", nil, Color3.fromRGB(85, 242, 127), "RobotoMono")
end

Notify("no more 19 dollar blacklist card!", nil, Color3.fromRGB(255, 255, 255), "RobotoMono")

if free and WV == "Yes" then
    Notify("Enjoy the free dragon style - ducksy", nil, Color3.fromRGB(85, 242, 127), "RobotoMono")
end

Notify("FREE SCHLEP", nil, Color3.fromRGB(235,161,23), nil)
