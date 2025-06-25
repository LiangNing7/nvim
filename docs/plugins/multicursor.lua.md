# multicursor

> 源码位于：[multicursor](../../lua/plugins/multicursor.lua)

## 1. 插件声明与依赖

```lua
return {
	"jake-stewart/multicursor.nvim",  -- 插件名称
	event = "VeryLazy",               -- 延迟加载
	branch = "1.0",                   -- 指定分支（插件为 beta 测试版）
	config = function()
		local mc = require("multicursor-nvim")
		mc.setup()
    ...
}
```

* 引入 `multicursor.nvim` 插件，类似于 VSCode 中的多光标操作；
* 使用 `VeryLazy` 延迟加载；
* `mc.setup()` 启动插件的默认配置。

## 2. mappings

| 模式 | 快捷键           | 执行命令                            | 描述                                   |
| ---- | ---------------- | ----------------------------------- | -------------------------------------- |
| n/v  | `<C-Up>`         | `mc.lineAddCursor(-1)`              | 在上方添加一个新光标                   |
| n/v  | `<C-Down>`       | `mc.lineAddCursor(1)`               | 在下方添加一个新光标                   |
| n/v  | `<leader><Up>`   | `mc.lineSkipCursor(-1)`             | 跳过上方已有光标                       |
| n/v  | `<leader><Down>` | `mc.lineSkipCursor(1)`              | 跳过下方已有光标                       |
| n/v  | `<C-Left>`       | `mc.nextCursor`                     | 将主光标移动到下一个光标               |
| n/v  | `<C-Right>`      | `mc.prevCursor`                     | 将主光标移动到上一个光标               |
| n/v  | `<C-k>`          | `mc.matchAddCursor(1)`              | 匹配下一个单词并添加光标               |
| n/v  | `<leader>k`      | `mc.matchSkipCursor(1)`             | 跳过下一个匹配项                       |
| n/v  | `<C-S-k>`        | `mc.matchAddCursor(-1)`             | 匹配上一个单词并添加光标               |
| n/v  | `<leader>K`      | `mc.matchSkipCursor(-1)`            | 跳过上一个匹配项                       |
| n    | `<C-LeftMouse>`  | `mc.handleMouse`                    | Ctrl+左键点击添加/移除光标（GUI 支持） |
| n/v  | `<leader>m`      | `mc.toggleCursor`                   | 手动添加或删除当前光标                 |
| v    | `<leader>m`      | `mc.matchCursors`                   | 选区中匹配并添加多个光标               |
| n    | `<Esc>`          | `mc.enableCursors()/clearCursors()` | 启用/禁用多光标状态                    |

## 3. multicursor 的 `<Esc>`

```lua
set("n", "<esc>", function()
	if not mc.cursorsEnabled() then
		mc.enableCursors()
	elseif mc.hasCursors() then
		mc.clearCursors()
	else
		-- Default <esc> handler.
		vim.keymap.set("n", "<ESC>", vim.cmd.nohlsearch, { desc = "Clear Highlights" })
	end
end)
```

默认 ESC 的行为是消除高亮。
