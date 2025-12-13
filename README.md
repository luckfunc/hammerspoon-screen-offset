# hammerspoon-screen-offset

27 寸竖屏太高，看东西要仰脖子，时间长了脖子疼。

这个脚本让窗口的自动缩小，不用每次手动调。

---

## 安装

装 Hammerspoon：
```bash
brew install --cask hammerspoon
```

打开一次，菜单栏会出现锤子图标 🔨，点开选 "open config"。

---
## 使用

把 `init.lua` 扔进配置目录，菜单栏点锤子 → Reload Config。

窗口会自动避开屏幕上方区域，不用再手动调整位置。

效果参考：[视频演示](video.mp4)

---

## 配置

改 `init.lua` 第一行的 `offset` 值：
```lua
local offset = 665  -- 屏蔽上方 665 像素
```

数字越大，窗口越靠下。

---
