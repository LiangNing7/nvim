# go-vim

> 源码位于：[go-vim](../../lua/plugins/go-vim.lua)

## 1. 插件声明与依赖

```lua
return {
    "ray-x/go.nvim",
    dependencies = {  -- 依赖项修正  
        "ray-x/guihua.lua",
        "neovim/nvim-lspconfig",
        "nvim-treesitter/nvim-treesitter",
    },
    ...
}
```

* `ray-x/go.nvim`：一个基于 Neovim 的 Go 语言增强插件。
* `ray-x/guihua.lua`：插件 GUI 支持库，用于提供浮动窗口等交互。
* `neovim/nvim-lspconfig`：LSP 客户端配置插件。
* `nvim-treesitter/nvim-treesitter`：语法高亮、代码结构分析等

## 2. 延迟加载除触发条件

```lua
event = { "CmdlineEnter" },
ft = { "go", "gomod" },
```

* `event = { "CmdlineEnter" }`: 当进入命令行模式时加载该插件。

* `ft = { "go", "gomod" }`: 限定仅在 `go` 和 `gomod` 文件中启用。

## 3. 构建

```lua
build = function()
    require("go.install").update_all_sync()
end,
```

* 安装插件后自动同步安装所有必要的 Go 工具，例如 `gopls`, `dlv`, `goimports` 等。

## 4. 插件核心配置

```lua
config = function()
    require("go").setup({
    	verbose = false,
        diagnostic = false, -- diagnostic 在 lspconfig 中配置
        dap_debug = false,
    })
    ...
}
```

* `verbose`: 是否打印详细日志，设为 `false` 可减少干扰。
* `diagnostic`: 禁用插件自带的诊断，由 `nvim-lspconfig` 管理更好。
* `dap_debug`: 是否开启调试支持，设为 `false` 关闭 `delve` 的调试集成。

### 5. 自动格式化

```lua
require("go.format").goimports()
```

* 使用 `goimports` 自动格式化代码并修复 import 语句，功能强于 `gofmt`。

```lua
local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    group = format_sync_grp,
    callback = function()
    	require("go.format").goimports()
    end,
})
```

保存 `.go` 文件前自动执行 `goimports`，确保代码风格统一

## 6. mappings

| 模式 | 快捷键       | 命令                                  | 描述                  | 功能分类   |
| ---- | ------------ | ------------------------------------- | --------------------- | ---------- |
| n    | `<leader>fe` | `:GoIfErr<CR>`                        | 填充错误处理          | Go 辅助    |
| n    | `<leader>fs` | `:GoFillStruct<CR>`                   | 生成 struct 填充      | Go 辅助    |
| n    | `<leader>fc` | `:GoFillSwitch<CR>`                   | 生成 switch 填充      | Go 辅助    |
| n    | `<leader>ta` | `:GoAddTag<CR>`                       | 添加 struct tag       | Go 辅助    |
| n    | `<leader>tr` | `:GoRmTag<CR>`                        | 删除指定的 struct tag | Go 辅助    |
| n    | `<leader>tc` | `:GoClearTag<CR>`                     | 清空 struct tag       | Go 辅助    |
| n    | `<leader>rn` | `vim.lsp.buf.rename()`                | 重命名符号            | LSP 重命名 |
| n    | `gd`         | `<cmd>FzfLua lsp_definitions<CR>`     | 跳转到定义            | LSP 导航   |
| n    | `gr`         | `<cmd>FzfLua lsp_references<CR>`      | 跳转到引用            | LSP 导航   |
| n    | `gi`         | `<cmd>FzfLua lsp_implementations<CR>` | 跳转到实现            | LSP 导航   |
