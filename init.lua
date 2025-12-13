local offset = 665  -- 从 628 增加 100px，窗口会往下移
local targetScreenHeight = 2274
local targetScreenWidth = 1296

local function isBadScreen(screen)
    local frame = screen:frame()
    return frame.h == targetScreenHeight and frame.w == targetScreenWidth
end

local screenshotApps = {"WeChat", "微信", "screencaptureui"}

local function isScreenshotApp(appName)
    if not appName then return false end
    for _, name in ipairs(screenshotApps) do
        if appName:find(name) then return true end
    end
    return false
end

local function moveWindowDown(win)
    if not win then return end
    
    local app = win:application()
    if app and isScreenshotApp(app:name()) then return end
    
    local screen = win:screen()
    if not isBadScreen(screen) then return end
    
    local frame = win:frame()
    local screenFrame = screen:frame()
    local minY = screenFrame.y + offset
    
    if frame.y < minY then
        frame.y = minY
        win:setFrame(frame)
    end
    
    local maxHeight = targetScreenHeight - offset
    if frame.h > maxHeight then
        frame.h = maxHeight
        win:setFrame(frame)
    end
end

hs.window.filter.default:subscribe(hs.window.filter.windowCreated, moveWindowDown)
hs.window.filter.default:subscribe(hs.window.filter.windowMoved, moveWindowDown)
hs.window.filter.default:subscribe(hs.window.filter.windowFocused, moveWindowDown)

for _, win in pairs(hs.window.allWindows()) do
    moveWindowDown(win)
end

print("✓ offset=" .. offset .. "px (windows moved DOWN 100px)")

