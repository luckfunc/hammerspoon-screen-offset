# hammerspoon-screen-offset

一份 Hammerspoon 配置，用来限制窗口在竖屏显示器上的可用区域，
强制给屏幕顶部留出一块固定的“安全区”。

---

## 安装 Hammerspoon

直接用 Homebrew：

```bash
brew install --cask hammerspoon
```
安装完成后打开一次 Hammerspoon，
菜单栏会出现一个 🔨 图标。
点击图标，选择“open config”。

## 保存配置并重启
将本项目中的 `init.lua` 文件复制到打开的配置目录中，
然后点击菜单栏的 🔨 图标，选择“Reload Config”。
配置生效后，可以尝试将窗口拖动到竖屏显示器的顶部，
