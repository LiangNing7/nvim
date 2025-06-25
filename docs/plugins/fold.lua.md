# fold

> 源码位于：[fold](../../lua/plugins/fold.lua)

## 1. 全局折叠选项

```lua
vim.o.foldcolumn = "0"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
```

* `foldcolumn`：控制左侧显示折叠指示列的宽度。
  * 设为 `"0"` 表示完全不显示折叠列，避免视觉干扰；
  * 如果设为 `"1"`、`"2"` 等，会看到一条竖线及数字提示。
* `foldlevel`：决定了当前打开缓冲区时『自动展开』到哪一级折叠。
  * 数值越大，打开时会自动展开更多层次；设为 `99` 几乎等于“全部展开”。
* `foldlevelstart`：决定文件首次打开时，自动展开到哪一级。
  * 与 `foldlevel` 类似，设为 `99` 意味着打开文件即展示所有内容，折叠功能在用户触发时才生效。
* `foldenable`：打开 Neovim 的折叠功能开关。
  * `true` 表示启用折叠；
  *  `false`，所有折叠都会被禁止。

## 2. 插件声明与依赖

```lua
return {
  "kevinhwang91/nvim-ufo",
  dependencies = "kevinhwang91/promise-async",
  config = function()
    ...
  end,
}
```

* **`"kevinhwang91/nvim-ufo"`**
  *  UFO（update folds only）是一个性能优异、可定制化非常高的折叠插件，替换内置的 `foldexpr` 算法。

* **`dependencies = "kevinhwang91/promise-async"`**
  *  UFO 内部使用异步 Promise 来并行计算折叠层级，需要这个依赖包来提供运行时支持。

## 3. LSP 折叠范围能力

```lua
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}
local language_servers = vim.lsp.get_clients()
for _, ls in ipairs(language_servers) do
  require("lspconfig")[ls].setup({
    capabilities = capabilities,
  })
end
```

* LSP 规范中，`foldingRange` 能力（Capability）允许语言服务器返回折叠区间。
* Neovim 默认的 LSP 客户端能力列表并不包含 `foldingRange`，必须手动补上，才能让 UFO 从 LSP 获取折叠信息。
* `dynamicRegistration = false`：表示静态注册，不需要在运行时再注册能力。
* `lineFoldingOnly = true`：只支持按整行折叠，而不支持对行内的折叠（更简单、更高效）。
* `vim.lsp.get_clients()` 获取当前已启动的 LSP 客户端名字列表。
* 通过循环给每个服务器的 `setup{}` 传入上面修改后的 `capabilities`，实现『开箱即用』地支持折叠。

## 4. 初始化 UFO 插件

```lua
require("ufo").setup()
```

默认情况下，UFO 会依次尝试内置的三种折叠『provider』：

1. **LSP server**（如果已开启 `foldingRange` 能力）
2. **Treesitter**（基于语法树的折叠）
3. **indent**（基于缩进的粗略折叠）

## 5. 指定 provider

```lua
require("ufo").setup({
  provider_selector = function(bufnr, filetype, buftype)
    return { "treesitter", "indent" }
  end,
})
```

* **`provider_selector`**：UFO 的可选配置项，用来精确控制不同文件条件下使用哪些 provider。

* 这里的函数统一返回 `{ "treesitter", "indent" }`：
  1. **优先用 Treesitter**，能根据语法节点做更智能的折叠；
  2. 如果 Treesitter 未生效，再回退到基于缩进的折叠。

## 6. mappings

| 模式 | 快捷键 | 功能说明                         |
| ---- | ------ | -------------------------------- |
| n    | `za`   | 切换当前光标的折叠区域           |
| n    | `zr`   | 展开当前缓冲区中的所有折叠区域   |
| n    | `zm`   | 折叠当前缓冲区中的所有可折叠区域 |

