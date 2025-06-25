# cmdline

> 源码位于：[cmdline](../../lua/plugins/cmdline.lua)

## 1. 插件基础信息

```lua
return {
  "folke/noice.nvim",  -- 插件仓库地址（GitHub）
  event = "VeryLazy",   -- 延迟加载策略：在真正需要时加载（最大化启动速度）
  dependencies = {      -- 依赖的其他插件
    "MunifTanjim/nui.nvim",      -- 必需：提供 UI 组件基础库
    "rcarriga/nvim-notify",      -- 可选：增强通知系统（未安装时自动降级到内置组件）
  },
  config = function() ... end  -- 插件加载后的配置函数
}
```

## 2. 关键配置解析

**LSP 渲染覆盖**

```lua
lsp = {
  override = {
    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
    ["vim.lsp.util.stylize_markdown"] = true,
    ["cmp.entry.get_documentation"] = true,
  }
}
```

* **作用**：用 Treesitter 替代默认的 Markdown 渲染器
* **效果**：
  * 更美观的 LSP 悬浮文档（函数签名、参数提示等）
  * 优化补全插件（如 `nvim-cmp`）的文档显示
* **依赖**：需安装 `hrsh7th/nvim-cmp`（补全插件）才能启用最后一项

**预设配置**

```lua
presets = {
  bottom_search = true,       -- 传统风格：搜索命令显示在底部
  command_palette = true,     -- 现代风格：命令面板与补全菜单合并
  long_message_to_split = true, -- 长消息自动分割到独立窗口
  inc_rename = false,         -- 禁用增量重命名对话框（需额外插件）
  lsp_doc_border = false,     -- 禁用 LSP 文档边框（启用可更美观）
}
```

## 3. 工作流说明

1. **触发加载**：当 Neovim 触发需要 `noice.nvim` 的事件时（如打开命令行、收到通知等）
2. **依赖检查**：自动加载 `nui.nvim`（必需）和 `nvim-notify`（若有则优先使用）
3. **配置生效**：执行 `setup()` 并应用：
   * 覆盖 LSP 的 Markdown 渲染器
   * 启用预设的 UI 优化组合
