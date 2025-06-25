# alpha

> alpha 的配置参考 LazyVim 的官方配置：[alpha](https://www.lazyvim.org/extras/ui/alpha#alpha-nvim)
>
> 源码位于：[alpha](../../lua/plugins/alpha.lua)

由于 LazyVim 的官方配置依赖一些 `util`，就会导致有些 Bug，我们只需要移除这些依赖即可。主要就是 `dashboard` 部分：

```lua
dashboard.button("f", "  Find file",       "<cmd>FzfLua files<CR>"),
dashboard.button("n", "  New file",        [[<cmd>ene <BAR> startinsert<CR>]]),
dashboard.button("r", "  Recent files",    "<cmd>FzfLua oldfiles<CR>"),
dashboard.button("g", "  Find text",       "<cmd>FzfLua live_grep<CR>"),
dashboard.button("c", "  Config",          "<cmd>lua require('fzf-lua').files({ cwd = vim.fn.stdpath('config') })<CR>"),
dashboard.button("q", "  Quit",            "<cmd>qa<CR>"),
```

这些是定义在启动 `nvim` 进入 `dashboard` 的一些 `button`。
