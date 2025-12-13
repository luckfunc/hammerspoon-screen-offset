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

效果参考：[视频演示](https://github-production-user-asset-6210df.s3.amazonaws.com/85545304/526180968-178e05d0-014a-4621-9cd1-a2aeaf863c8c.mp4?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVCODYLSA53PQK4ZA%2F20251213%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20251213T104357Z&X-Amz-Expires=300&X-Amz-Signature=00f54d4138b294f548a0ad5e284e9ff3a4558acb3b56cdc07cd874539af9181c&X-Amz-SignedHeaders=host)

---

## 配置

改 `init.lua` 第一行的 `offset` 值：
```lua
local offset = 665  -- 屏蔽上方 665 像素
```

数字越大，窗口越靠下。

---
