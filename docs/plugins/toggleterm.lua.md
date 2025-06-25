# toggleterm

> 源码位于：[toggleterm](../../lua/plugins/toggleterm.lua)

```lua
return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<c-\>]], -- ✅ 使用 Ctrl+\ 打开终端  
      start_in_insert = true,   -- 进入终端自动进入 insert 模式  
      direction = "horizontal"  -- tab, float, vertical
    })
  end
}
```

* `start_in_insert`：打开终端时是否自动进入插入模式，方便直接输入命令；
* `direction`：终端的弹出方向，支持：`horizontal`（水平）、`vertical`（垂直）、`float`（浮动）

## mapping

| 模式 | 快捷键  | 执行命令     | 描述              |
| ---- | ------- | ------------ | ----------------- |
| n, i | `<C-\>` | `ToggleTerm` | 打开/关闭终端窗口 |
