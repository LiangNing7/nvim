# treesitter

> 源码位于：[treesitter](../../lua/plugins/treesitter.lua)

## 1. 插件声明和懒加载

```lua
return {
  "nvim-treesitter/nvim-treesitter",
  lazy = vim.fn.argc(-1) == 0,  -- 没有文件参数时才懒加载
  event = { "BufReadPost", "BufNewFile", "BufWritePre" }, -- 触发加载的事件
  ...
}
```

* **`lazy`**: 仅当启动 Neovim **无文件参数**（如 `nvim` 而非 `nvim file.txt`）时启用懒加载，加速启动。
* **`event`**: 在以下事件触发插件加载：
  * `BufReadPost`: 打开现有文件后
  * `BufNewFile`: 创建新文件时
  * `BufWritePre`: 保存文件前

## 2. 初始化设置

```lua
init = function(plugin)
  require("lazy.core.loader").add_to_rtp(plugin)  -- 添加插件到 runtimepath
  require("nvim-treesitter.query_predicates")     -- 预加载查询谓词模块
end,
```

* 确保插件在加载前已加入 Neovim 的运行时路径（`runtimepath`）。
* 预加载 `query_predicates` 模块（用于 Treesitter 查询的高级条件判断）。

## 3. 构建命令

```lua
build = ":TSUpdate",  -- 安装/更新 Treesitter 解析器
```

* 执行 `:TSUpdate` 命令安装或更新语法解析器（parsers）。

## 4. 配置选项

传入 `nvim-treesitter.configs.setup()` 的配置表。

**解析器管理**

```lua
ensure_installed = { "go", "json", "markdown", "sql", "vim", "bash", "lua" },
sync_install = true,     -- 同步安装（阻塞式）
auto_install = true,     -- 自动安装缺失的解析器
```

* **`ensure_installed`**: 必须安装的语法解析器列表。
* **`sync_install`**: 同步安装（可能阻塞 UI）。
* **`auto_install`**: 自动安装打开文件所需的解析器。

**语法高亮**

```lua
highlight = {
  enable = true,
  disable = function(lang, buf)
    local max_filesize = 100 * 1024  -- 100 KB
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    if ok and stats and stats.size > max_filesize then
      return true  -- 禁用大文件高亮
    end
  end,
  additional_vim_regex_highlighting = false, -- 禁用 Vim 正则高亮
}
```

* **启用高亮**: `enable = true`。
* **大文件禁用**: 文件大小 > 100 KB 时关闭高亮（避免卡顿）。
* **禁用 Vim 正则高亮**: 只使用 Treesitter 高亮（更精确）。

**智能缩进**

```lua
indent = { enable = true },  -- 基于语法树的智能缩进
```

## 5. 加载后配置

```lua
config = function(_, opts)
  require("nvim-treesitter.configs").setup(opts)  -- 应用配置

  -- 文件类型确定后启用 Treesitter 折叠
  vim.api.nvim_create_autocmd("FileType", {
    callback = function()
      if pcall(vim.treesitter.start) then  -- 安全检测 Treesitter
        vim.opt_local.foldexpr   = "v:lua.vim.treesitter.foldexpr()" -- 折叠表达式
        vim.opt_local.foldmethod = "expr"  -- 折叠方法
      end
    end,
  })
end
```

1. **应用配置**: 调用 `setup(opts)` 初始化 Treesitter。
2. **设置代码折叠**:
   * 通过 `FileType` 自动命令，在文件类型确定后配置折叠。
   * 使用 `vim.treesitter.foldexpr()` 实现**基于语法树的折叠**。
   * `foldmethod=expr` 表示折叠由表达式动态计算。
