# flash 

> 源码位于：[flash](../../lua/plugins/flash.lua)

## 1. 插件说明

```lua
return {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config    
  config = function()
    require("flash").setup({
      labels = "arstdhneioqwfpgjluyzxcvbkm",
      modes = {
        -- options used when flash is activated through    
        -- a regular search with `/` or `?`    
        search = {
          -- when `true`, flash will be activated during regular search by default.    
          -- You can always toggle when searching with `require("flash").toggle()`    
          enabled = true,
        },
      },
    })
  end,
  ... -- 其他配置
}
```

* `"folke/flash.nvim"`：指定要安装和加载的插件仓库。

* `event = "VeryLazy"`：延迟加载插件。

* ```lua
  config = function()
      require("flash").setup({
          labels = "arstdhneioqwfpgjluyzxcvbkm",
          modes = { search = { enabled = true },},
      })
      ... -- mappings
  end,
  ```
  
  * `labels`：定义跳转时用于标记目标位置的字符序列。
  * 在常规搜索（`/` 或 `?`）时自动触发 Flash 功能。

## 2. mappings

| 模式       | 快捷键       | 命令                                                         | 描述                      |
| ---------- | ------------ | ------------------------------------------------------------ | ------------------------- |
| n, x, o    | `s`          | `require("flash").jump({ search = { multi_window = true } })` | 跨窗口使用 Flash 跳转     |
| n, x, o    | `S`          | `require("flash").treesitter()`                              | Treesitter 快捷跳转       |
| o          | `r`          | `require("flash").remote()`                                  | 远程 Flash                |
| o, x       | `R`          | `require("flash").treesitter_search()`                       | 基于 Treesitter 的搜索    |
| c          | `<C-s>`      | `require("flash").toggle()`                                  | 切换 Flash 搜索           |
| n, x, o    | `<leader>l`  | `require("flash").jump({ search = { mode = "search", max_lenghth = 0 }, label = { after = { 0, 0 } },pattern = "^", })` | 跳转行                    |
| n, x, o, c | `<leader>sf` | `require("flash").toggle()`                                  | ‘/’ or ‘?’ 是否启用 flash |

