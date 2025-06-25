# outline

> 源码位于：[outline](../../lua/plugins/outline.lua)

## 1. 依赖声明与依赖

```lua
return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	keys = { -- Example mapping to toggle outline
		{ "<leader>v", "<cmd>Outline<CR>", desc = "Toggle outline" },
       	{ "<leader>of", function()
            require("outline").focus_outline()
        end, desc = "Outline: Focus outline" },
	},
    ...
}
```

* `"hedyhli/outline.nvim"`：大纲视图插件，用于展示当前文件的符号树（函数、变量、类等）。

* `lazy = true`：延迟加载，只有在触发命令或快捷键时才加载，提升启动速度。

* `cmd = { "Outline", "OutlineOpen" }`：当在 Neovim 中输入 `:Outline` 或 `:OutlineOpen` 时加载插件并打开大纲窗口。

* ```lua
  	keys = { -- Example mapping to toggle outline
  		{ "<leader>v", "<cmd>Outline<CR>", desc = "Toggle outline" },
         	{ "<leader>of", function()
              require("outline").focus_outline()
          end, desc = "Outline: Focus outline" },
  	},
  ```

  * 绑定 `<leader>v` 用于切换大纲面板。
  * 绑定 `<leader>of` 用于 编辑窗口 `-->` 大纲窗口。


## 2. 窗口配置

```lua
outline_window = {
	position = "left",
	width = 20,
    auto_jump = true,
},
```

* `outline_window.position = "left"`：大纲面板固定在编辑窗口的左侧。
* `outline_window.width = 20`：面板宽度为 20 列。
* `auto_jump = true`：跳转使用默认按键。

## 3. mappings

### 编辑模式

| 模式 | 快捷键       | 执行命令                                            | 描述                    |
| :--- | :----------- | :-------------------------------------------------- | :---------------------- |
| n    | `<leader>v`  | `<cmd>Outline<CR>`                                  | 切换大纲面板            |
| n    | `<leader>of` | `function() require("outline").focus_outline() end` | 编辑窗口 `-->` 大纲窗口 |

### outline 内部mappings

| 模式 | 快捷键      | 执行命令                                | 描述                           |
| ---- | ----------- | --------------------------------------- | ------------------------------ |
| n    | `<leader>v` | `<cmd>Outline<CR>`                      | 切换大纲面板                   |
| n    | `?`         | `require("outline").show_help()`        | 显示帮助                       |
| n    | `<Esc>`     | `require("outline").close()`            | 关闭大纲窗口                   |
| n    | `q`         | `require("outline").close()`            | 关闭大纲窗口                   |
| n    | `<CR>`      | `require("outline").goto_location()`    | 跳转到光标下符号位置           |
| n    | `o`         | `require("outline").peek_location()`    | 跳转到符号并保持在大纲窗口     |
| n    | `<S-CR>`    | `require("outline").goto_and_close()`   | 跳转到符号并关闭大纲           |
| n    | `<C-g>`     | `require("outline").restore_location()` | 同步大纲窗口光标到当前代码位置 |
| n    | `<C-space>` | `require("outline").hover_symbol()`     | 悬停显示符号信息               |
| n    | `K`         | `require("outline").toggle_preview()`   | 切换代码预览                   |
| n    | `r`         | `require("outline").rename_symbol()`    | 重命名符号                     |
| n    | `a`         | `require("outline").code_actions()`     | 触发代码操作（Code Action）    |
| n    | `n`         | `require("outline").fold()`             | 折叠当前节点                   |
| n    | `i`         | `require("outline").unfold()`           | 展开当前节点                   |
| n    | `<Tab>`     | `require("outline").fold_toggle()`      | 切换当前节点折叠/展开          |
| n    | `<S-Tab>`   | `require("outline").fold_toggle_all()`  | 全部折叠/展开切换              |
| n    | `N`         | `require("outline").fold_all()`         | 折叠所有节点                   |
| n    | `I`         | `require("outline").unfold_all()`       | 展开所有节点                   |
| n    | `R`         | `require("outline").fold_reset()`       | 重置所有折叠状态               |
