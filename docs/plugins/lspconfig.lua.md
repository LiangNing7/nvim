# lspconfig

> 源代码位于：[lspconfig.lua](../../lua/plugins/lspconfig.lua)

## 1. 插件声明与依赖

```lua
return {
  "neovim/nvim-lspconfig", -- 核心 LSP 配置插件
  dependencies = {
    { "williamboman/mason.nvim" }, -- LSP 服务器管理工具
    { "mason-org/mason-lspconfig.nvim" }, -- 连接 Mason 和 lspconfig
    { "MysticalD
            evil/inlay-hints.nvim", event = "LspAttach" }, -- 内联提示插件（LSP 附加时加载）
  },
  config = function() ... end
}
```

* `nvim-lspconfig`：核心 LSP 配置插件；
* `mason`：LSP 服务器管理工具；
* `inlay-hints`：连接 Mason 和 lspconfig。

## 2. 基础设置

```lua
local lsp_utils = require("lspconfig.util")

-- 通过mason来自动安装语言服务器并启用
require("mason").setup({}) -- 初始化 Mason
require("mason-lspconfig").setup({
  ensure_installed = { -- 自动安装的语言服务器
    "gopls",      -- Go
    "marksman",   -- Markdown
    "lua_ls",     -- Lua
    -- "pylsp",    -- Python、保证有 python3、pip 环境
  },
  automatic_enable = { 
    exclude = {}
  }, -- 自动启用所有安装的服务器
})
```

> NOTE:
>
> 在下载对应的 LSP 服务器时，可能由于缺少环境，无法进行安装，例如，在下载 `pylsp` 时，依赖 python3、pip 环境。
>
> 具体可以通过 `:MasonLog` 查看。

* 在 `ensure_installed` 中添加 LSP 服务器即可，再次打开 nvim 即可加载对应的 LSP 服务器。

* 可以通过在 nvim 中执行如下命令查看 / 下载 LSP 服务器：

  ```bash
  :Mason # 查看
  :MasonInstall xxx # 下载 xxx 语言服务器
  ```
  
* 可以通过 `:LspInfo` 查看当前活跃的语言服务器。

## 3. 诊断信息配置

```lua
vim.diagnostic.config({
  signs = { -- 自定义诊断图标
    text = {
      [vim.diagnostic.severity.ERROR] = "✘",
      [vim.diagnostic.severity.WARN] = "▲",
      [vim.diagnostic.severity.HINT] = "⚑",
      [vim.diagnostic.severity.INFO] = "»",
    }
  }
})
```

## 4. 内联提示设置

```lua
require("inlay-hints").setup({
    -- 启用 InlayHintsToggle、InlayHintsEnable、InlayHintsDisable 三个命令
    commands = { enable = true },
    -- 插件自动在 LspAttach 时启用内联提示（可选）
    autocmd = { enable = false },
})
```

## 5. 语言服务器配置

> inlay-hints 的配置见：[inlay-hints.nvim](https://github.com/MysticalDevil/inlay-hints.nvim?tab=readme-ov-file#languages)

### go

```lua
require("lspconfig").gopls.setup({
    cmd = { "gopls", "serve" },
    root_dir = lsp_utils.root_pattern("go.mod", ".git"),
    on_attach = function(client, bufnr)
        -- LSP 附加事件处理（示例配置）  
        -- Enable completion triggered by <c-x><c-o>--
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    end,
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
            gofumpt = true,
            buildFlags = { "-tags=integration" },
            hints = { -- gopls 开启 hints.
                rangeVariableTypes = true,
                parameterNames = true,
                constantValues = true,
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                functionTypeParameters = true,
            },
        },
    },
    init_options = {
        usePlaceholders = true
    }
})
```

## 6. 自动格式化

```lua
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.lsp.buf.format({
      async = false,           -- 同步格式化
      timeout_ms = 5000,        -- 超时时间
      filter = function(client)
        return client.name == "gopls" -- 仅允许 gopls 格式化
      end
    })
  end
})
```

## 7. LSP 快捷键

| 模式 | 快捷键       | 命令                                     | 描述                       | 功能分类     |
| :--- | :----------- | :--------------------------------------- | :------------------------- | :----------- |
| n    | `K`          | `vim.lsp.buf.hover({border = "single"})` | 悬浮提示功能               | 文档查看     |
| n    | `<leader>aw` | `vim.lsp.buf.code_action()`              | 打开代码修复建议           | LSP 代码操作 |
| n    | `<leader>d`  | `vim.diagnostic.open_float()`            | 浮动窗口显示当前行诊断信息 | LSP 诊断     |
| n    | `<leader>-`  | `vim.diagnostic.goto_prev()`             | 跳转到上一个诊断位置       | LSP 诊断导航 |
| n    | `<leader>=`  | `vim.diagnostic.goto_next()`             | 跳转到下一个诊断位置       | LSP 诊断导航 |
| n    | `<leader>ih` | `:InlayHintsToggle<CR>`                  | 切换内联提示显示           | LSP 辅助功能 |

