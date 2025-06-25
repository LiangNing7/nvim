# stickyScroll

> 源码位于：[stickyScroll](../../lua/plugins/stickyScroll.lua)

## 1. 插件声明

```lua
return {
	"nvim-treesitter/nvim-treesitter-context",
    ... 
}
```

* `nvim-treesitter-context`： 会在窗口顶部保持显示当前光标所处的代码上下文（通常是函数、类、循环等的开头部分），帮助你在滚动后迅速了解当前位置所属的代码块。

## 2. mappings

```lua
vim.keymap.set("n", "[C", function()
  require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true })
```

* 监听普通模式下的 `[C`。
* 调用 `go_to_context(count)`，`count` 为 `vim.v.count1`（若输入 `2[C` 则跳到第二级父上下文）。
* `{ silent = true }` 表示执行时不打印消息。

## 3. setup 配置项

```lua
require("treesitter-context").setup({
	enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
	multiwindow = true, -- Enable multiwindow support.
	max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
	min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
	line_numbers = true,
	multiline_threshold = 20, -- Maximum number of lines to show for a single context
	trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
	mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
	-- Separator between context and content. Should be a single character string, like '-'.
	-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
	separator = nil,
	zindex = 20, -- The Z-index of the context window
	on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
})
```

* `enable`：全局开关，默认为 `true`。
* `multiwindow`：开启多个窗口时，在每个窗口顶部都显示对应上下文。
* `max_lines` / `min_window_height`：控制何时以及显示多少行上下文。
* `line_numbers`：显示上下文行的行号。
* `multiline_threshold`：单个上下文块最多显示多少行，超出则裁剪。
* `trim_scope`：裁剪时保留哪一端的内容。
* `mode`：`cursor` 表示根据光标位置计算上下文；`topline` 根据窗口顶部行计算。
* `separator`：若需要分隔符，可设置为单字符（如 `-`）。
* `zindex`：上下文窗口层级，数值越大越靠前。
* `on_attach`：可传入回调决定是否在特定缓冲区启用。
