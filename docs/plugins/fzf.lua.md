# fzf

> 源代码位于：[fzf.lua](../../lua/plugins/fzf.lua)

## 1. 插件标识与依赖

```lua
return {
  "ibhagwan/fzf-lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  …
}
```

* `ibhagwan/fzf-lua`：指定要安装的插件仓库地址；
* `nvim-tree/nvim-web-devicons`：声明此插件运行所需的其它插件依赖。

## 2. 延迟选项

```lua
event = { "VeryLazy" },
```

* **event**：告诉 Lazy.nvim 在哪个 Neovim 事件触发时加载此插件。`"VeryLazy"` 是一个自定义事件（通常比 `VimEnter` 更晚），可以让启动更快，把插件加载推迟到编辑器空闲时。

## 3. 插件选项

```lua
  opts = {
    "default",
    winopts = { … },
    files   = { … },
    diagnostics = { … },
    previewers   = { … },
  },
```

* `"default"`：相当于传给 `require('fzf-lua').setup()` 的第一个参数，通常指定默认主题或内置命令集。
* `winopts`：窗口层面的配置。
  * `preview.hidden = true`：默认关闭文件预览窗格；
  * `border = "noborder"`：无边框样式；
  * `vertical = "up:50%"`／`horizontal = "right:50%"`：预览区在上方、高度占 50%；主窗口右侧宽度占 50%；
  * `delay = 20`：切换预览时的延迟（毫秒）。
* `files.formatter`：自定义文件列表里路径的显示方式，`"path.filename_first"` 表示文件名先显示，再是路径。
* `diagnostics.split`：当用 `:FzfLua lsp_document_diagnostics` 时，选择打开诊断详情的分屏命令，这里用 `belowright new`。
* `previewers`：定义各种文件预览器。
  * **cat／bat／head**：分别调用 `cat -n`、`bat --color=…`、`head` 来渲染文本预览。
  * **git_diff**：展示 Git 差异时的命令（修改、删除、未跟踪），并可自动识别并用 `git-delta` 作为 pager。
  * **man**：用 `man -c %s | col -bx` 渲染 man 手册页（注意 macOS 下建议去掉 `-c` 并改用 `man -P cat %s | col -bx`）。
  * **builtin**：内置 Lua 预览器，支持
    * 语法高亮（`syntax = true`），并对大文件做大小/行数限制。
    * Treesitter 集成，开启文件类型解析、并可配置 `nvim-treesitter-context` 行数。
    * 切换预览时主窗口的伸缩行为（`toggle_behavior`）。
    * 自定义外部命令预览扩展（比如用 `viu` 显示 png，用 `chafa` 显示 svg，用 `ueberzug` 显示 jpg）。
    * Markdown 渲染支持（`render_markdown.enabled = true`）。
  * **codeaction** 与 **codeaction_native**：分别用于 LSP 代码操作预览，后者用 fzf 自身的 native 预览器（推荐配合 git-delta）。

## 4. FZF 快捷键

| Mode | Shortcut     | Command                                    | 描述                              |
| ---- | ------------ | ------------------------------------------ | --------------------------------- |
| n    | `<C-e>`      | `<cmd>FzfLua buffers<CR>`                  | 浏览并切换打开的缓冲区            |
| n    | `<C-f>`      | `<cmd>FzfLua lgrep_curbuf<CR>`             | 在当前缓冲区搜索                  |
| n    | `<leader>fp` | `<cmd>FzfLua live_grep<CR>`                | 在项目文件中实时搜索              |
| n    | `<leader>fo` | `<cmd>FzfLua oldfiles<CR>`                 | 打开最近使用的文件列表            |
| n    | `<leader>ts` | `<cmd>FzfLua treesitter<CR>`               | 使用 Treesitter 搜索符号          |
| n    | `<leader>sh` | `<cmd>FzfLua search_history<CR>`           | 搜索命令行历史                    |
| n    | `<leader>fm` | `<cmd>FzfLua marks<CR>`                    | 列出所有标记并跳转                |
| n    | `<leader>gp` | `<cmd>FzfLua git_commits<CR>`              | 浏览 Git 提交记录                 |
| n    | `<leader>gb` | `<cmd>FzfLua git_bcommits<CR>`             | 浏览当前缓冲区文件的 Git 提交记录 |
| n    | `<leader>gs` | `<cmd>FzfLua git_status<CR>`               | 显示 Git 状态和暂存更改           |
| n    | `<leader>fd` | `<cmd>FzfLua lsp_document_diagnostics<CR>` | 列出 LSP 诊断并跳转到问题         |
