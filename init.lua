local offset = 665
local targetScreenHeight = 2274
local targetScreenWidth = 1296

-- ✅ 白名单：只有这些 App 会被限制
local TARGET_APPS = {
    "Google Chrome",
    -- "Arc",
    -- "Microsoft Edge",
}

local function isTargetScreen(screen)
    local f = screen:frame()
    return f.h == targetScreenHeight and f.w == targetScreenWidth
end

local function isTargetApp(win)
    local app = win:application()
    if not app then return false end

    local name = app:name()
    for _, allowed in ipairs(TARGET_APPS) do
        if name == allowed then
            return true
        end
    end
    return false
end

local function moveWindowDown(win)
    if not win then return end
    if not isTargetApp(win) then return end

    local screen = win:screen()
    if not isTargetScreen(screen) then return end

    local frame = win:frame()
    local screenFrame = screen:frame()
    local minY = screenFrame.y + offset

    if frame.y < minY then
        frame.y = minY
    end

    local maxHeight = targetScreenHeight - offset
    if frame.h > maxHeight then
        frame.h = maxHeight
    end

    win:setFrame(frame)
end

hs.window.filter.default:subscribe(hs.window.filter.windowCreated, moveWindowDown)
hs.window.filter.default:subscribe(hs.window.filter.windowMoved, moveWindowDown)
hs.window.filter.default:subscribe(hs.window.filter.windowFocused, moveWindowDown)

for _, win in pairs(hs.window.allWindows()) do
    moveWindowDown(win)
end

print("✓ restricted apps:", table.concat(TARGET_APPS, ", "))
