# blink.cmp

> 源码位于： [blinkcmp](../../lua/plugins/blinkcmp.lua)

## 1. 插件基本信息

```lua
return {
	"saghen/blink.cmp",
	enabled = not vim.g.vscode, -- 在vscode-neovim禁用
	dependencies = {
		"rafamadriz/friendly-snippets",
		"Kaiser-Yang/blink-cmp-avante",
	},
	version = "*",
  	opts = {
    	... -- 以下是完整的配置表
  	},
    -- 由于“opts_extend”，您的配置中的其他位置无需重新定义它
	opts_extend = { "sources.default" },
}
```

* **`"saghen/blink.cmp"`**：指定使用的补全引擎插件；
* **`enabled = not vim.g.vscode`**：如果检测到在 VSCode-Neovim 环境，则禁用此插件；
* **`dependencies`**：声明额外依赖，用于提供 snippet 和自定义面板支持；
* **`version = "\*"`**：始终安装最新符合版本规范的插件；
* **`opts_extend`**：在主配置外，额外把 `sources.default` 里的选项合并进来，避免重复定义。

## 2. 命令行补全设置

```lua
cmdline = {
	keymap = {
		-- 选择并接受预选择的第一个
		["<CR>"] = { "select_and_accept", "fallback" },
	},
	completion = {
		-- 不预选第一个项目，选中后自动插入该项目文本
		list = { selection = { preselect = false, auto_insert = true } },
		-- 自动显示补全窗口，仅在输入命令时显示菜单，而搜索或使用其他输入菜单时则不显示
		menu = {
			auto_show = function(ctx)
				return vim.fn.getcmdtype() == ":"
				-- enable for inputs as well, with:
				-- or vim.fn.getcmdtype() == '@'
			end,
		},
		-- 不在当前行上显示所选项目的预览
		ghost_text = { enabled = false },
	},
},
```

* **`keymap["<CR>"]`**：在命令行（`:`）模式下，回车会『选中并接受』当前预选项，否则执行原生命令。
* **`list.selection.preselect = false`**：不自动预选第一项，减少误插入。
* **`list.selection.auto_insert = true`**：选中项目后立即插入到命令行。
* **`menu.auto_show`**：只有在输入 `:` 命令时才弹出补全菜单，避免在搜索或其他输入模式下干扰。
* **`ghost_text.enabled = false`**：关闭行内预览文本，保持命令行的清晰度。

## 3. 通用补全行为

```lua
completion = {
  keyword = { range = "full" },  -- 匹配整个单词
  documentation = {
    auto_show = true,  -- 自动显示文档
    auto_show_delay_ms = 0  -- 无延迟显示
  },
  list = {
    selection = {
      preselect = true,  -- 预选第一项
      auto_insert = false  -- 选择后不自动插入
    }
  }
}
```

* **`keyword.range = "full"`**：补全时匹配整个单词，包括光标两侧。
* **`documentation.auto_show = true`**：选中项目时立即弹出文档，无延迟。
* **`list.selection.preselect = true`**：预选第一项，需手动确认。
* **`list.selection.auto_insert = false`**：选中后也不自动插入，避免误触。

## 4. 启用条件

```lua
enabled = function()
  return not vim.tbl_contains({
    -- "lua",  -- 可排除的文件类型
    -- "markdown"
  }, vim.bo.filetype) 
  and vim.bo.buftype ~= "prompt"  -- 排除提示缓冲区
  and vim.b.completion ~= false   -- 允许缓冲区级禁用
end
```

* 通过 Lua 函数判断是否启用补全：
  1. 排除特定文件类型（此处可自行填入如 `{"markdown", "lua"}`）
  2. 跳过 `prompt` 缓冲（如 Telescope 输入框）。
  3. 如果缓冲变量 `vim.b.completion` 明确设为 `false`，也会禁用。

## 5. 外观设置

```lua
appearance = {
  use_nvim_cmp_as_default = true,  -- 兼容 nvim-cmp 主题
  nerd_font_variant = "mono"       -- 等宽字体确保图标对齐
}
```

* **`use_nvim_cmp_as_default`**：当主题不支持 blink.cmp 时，退回到 nvim-cmp 的高亮样式。
* **`nerd_font_variant`**：根据所用字体调整图标间距，保证对齐。

## 6. 默认补全源

```lua
sources = {
  default = {  -- 默认启用的补全源
    "buffer",    -- 缓冲区内容
    "lsp",       -- LSP 建议
    "path",      -- 文件路径
    "snippets",  -- 代码片段
    "avante",    -- 自定义源
  },
  
  providers = {
    buffer = { score_offset = 5 },  -- 最高优先级
    path = { score_offset = 3 },
    lsp = { score_offset = 2 },
    snippets = { score_offset = 1 },
    
    cmdline = {
      min_keyword_length = function(ctx)
        return (ctx.mode == "cmdline" and not ctx.line:find(" ")) and 3 or 0
      end
    },
    
    avante = {
      module = "blink-cmp-avante",  -- 自定义源模块
      name = "Avante",              -- 显示名称
      opts = {}                     -- 自定义配置
    }
  }
}
```

* **`sources.default`**：定义默认启用的补全来源顺序。
* **`providers.\*.score_offset`**：数值越大，来源优先级越高，用于结果排序。
* **`cmdline.min_keyword_length`**：命令行模式下，关键词长度小于 3 时不触发补全。
* **`avante`**：自定义扩展源，绑定到 `blink-cmp-avante` 模块。

## 7. cmp 快捷键

| 模式    | 快捷键      | 命令                                                 | 描述                                              | 功能分类     |
| ------- | ----------- | ---------------------------------------------------- | ------------------------------------------------- | ------------ |
| c (cmd) | `<CR>`      | `select_and_accept` → `fallback`                     | 在 cmdline 模式下选中并接受候选，或回退到原生命令 | 补全选择     |
| i       | `<C-space>` | `show` → `show_documentation` → `hide_documentation` | 显示补全菜单并切换文档视图                        | 补全/文档    |
| i       | `<CR>`      | `select_and_accept` → `fallback`                     | 选中并接受当前候选                                | 补全选择     |
| i       | `<S-Tab>`   | `select_prev` → `snippet_backward` → `fallback`      | 上一个候选；无 snippet 时后退                     | 补全/Snippet |
| i       | `<Tab>`     | `select_next` → `snippet_forward` → `fallback`       | 下一个候选；无 snippet 时前进                     | 补全/Snippet |
| i       | `<C-b>`     | `scroll_documentation_up` → `fallback`               | 向上滚动文档                                      | 文档浏览     |
| i       | `<C-f>`     | `scroll_documentation_down` → `fallback`             | 向下滚动文档                                      | 文档浏览     |
| i       | `<C-e>`     | `snippet_forward` → `select_next` → `fallback`       | snippet 跳转优先，否则下一个候选                  | 补全/Snippet |
| i       | `<C-u>`     | `snippet_backward` → `select_prev` → `fallback`      | snippet 后退优先，否则上一个候选                  | 补全/Snippet |
