# tokyonight

> 源码位于：[tokyonight](../../lua/plugins/tokyonight.lua)

## 1. 插件声明

```lua
return {
  "folke/tokyonight.nvim",
  priority = 1000, -- 确保优先加载
  ...
}
```

* **`"folke/tokyonight.nvim"`**：插件的 GitHub 仓库地址（由 folke 维护）。
* **`priority = 1000`**：设置插件加载优先级为最高（数值越大优先级越高），确保主题在启动时**最先加载**，避免其他插件覆盖主题设置。

## 2. 配置函数

```lua
config = function()
  require("tokyonight").setup({ ... })
end
```

* 在插件加载后立即执行此函数，用于初始化主题配置。
* `require("tokyonight").setup()` 调用插件的设置函数，传入配置参数表。

## 3. 主题配置参数

**基础样式设置**

```lua
style = "moon", -- 可选: moon、storm、night、day
```

* 指定主题风格为 **`moon`**（深色背景 + 紫色调）。其他可选值：`storm`（蓝黑色）、`night`（深蓝）、`day`（浅色）。

**禁用函数斜体**

```lua
styles = {
  functions = {} 
},
```

* `functions = {}` 表示**禁用函数（function）文本的斜体样式**（默认可能启用斜体）。

**自定义颜色**

```lua
on_colors = function(colors)
  colors.hint = colors.orange  -- 将"提示"颜色设为橙色
  colors.error = "#ff0000"     -- 将"错误"颜色设为亮红色
end
```

* **`on_colors` 回调函数**：动态修改主题颜色。
  * `colors.hint = colors.orange`：将提示信息（如诊断提示）的颜色设为主题预设的橙色。
  * `colors.error = "#ff0000"`：将错误信息颜色设为纯红色（HEX 值 `#ff0000`）。
