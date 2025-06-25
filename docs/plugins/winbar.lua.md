# winbar

> 源码位于：[winbar](../../lua/plugins/winbar.lua)

## 1. 插件配置

```lua
return {
	"Bekaboo/dropbar.nvim",
	config = function()
		local api = require("dropbar.api")
        ...
    }
}
```

* `Bekaboo/dropbar.nvim`：用于在 Neovim 顶部状态栏中显示代码结构（如函数、类等）的层级导航信息，并支持交互式点击跳转。

## 2. confirm

```lua
local confirm = function()
	local menu = api.get_current_dropbar_menu()
	if not menu then
		return
	end
	local cursor = vim.api.nvim_win_get_cursor(menu.win)
	local component = menu.entries[cursor[1]]:first_clickable(cursor[2])
	if component then
		menu:click_on(component)
	end
end
```

* 通过 `api.get_current_dropbar_menu()` 获取当前打开的菜单对象。
* 用 `vim.api.nvim_win_get_cursor()` 取得在菜单窗口中的光标行列。
* 从该行对应的 `entries` 中，找到第一个可点击的组件。
* 如果存在该组件，就调用 `menu:click_on(component)`，相当于“回车”或“点击”操作。

## 3. mappings

### 普通 mappings

| 模式     | 快捷键      | 执行命令                                       | 描述                              |
| -------- | ----------- | ---------------------------------------------- | --------------------------------- |
| 普通模式 | `<Leader>;` | `require("dropbar.api").pick()`                | 打开 Dropbar 菜单，选择当前上下文 |
| 普通模式 | `[c`        | `require("dropbar.api").goto_context_start()`  | 跳转到当前上下文的起始位置        |
| 普通模式 | `]c`        | `require("dropbar.api").select_next_context()` | 选择下一个上下文                  |

### 菜单模式

| 模式     | 快捷键        | 执行命令                     | 描述                             |
| -------- | ------------- | ---------------------------- | -------------------------------- |
| 菜单模式 | `<LeftMouse>` | 内部处理函数（点击菜单组件） | 用鼠标左键点击菜单项             |
| 菜单模式 | `<CR>`        | `confirm()`                  | 确认当前选中组件                 |
| 菜单模式 | `i`           | `confirm()`                  | 同上，用 `i` 键确认              |
| 菜单模式 | `<esc>`       | `<C-w>q`                     | 关闭菜单                         |
| 菜单模式 | `q`           | `<C-w>q`                     | 关闭菜单                         |
| 菜单模式 | `n`           | `<C-w>q`                     | 关闭菜单                         |
| 菜单模式 | `<MouseMove>` | 内部处理函数（更新高亮）     | 鼠标移动时更新当前悬停组件的高亮 |
