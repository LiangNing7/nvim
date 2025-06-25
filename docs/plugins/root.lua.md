# root

> 源码位于：[root](../../lua/plugins/root.lua)

```lua
-- NOTE: avoid lazy loading as the autocmds may not be caught by nvim-rooter.lua.
return {
    'notjedi/nvim-rooter.lua',
    config = function()
        require('nvim-rooter').setup {
            rooter_patterns = { '.git', '.hg', '.svn' },
            trigger_patterns = { '*' },
            manual = true, -- 每次必须手动切换
            fallback_to_parent = false,
            cd_scope = "global",
        }
        vim.keymap.set("n", "<leader>rr", "<cmd>Rooter<CR>", { desc = "Rooter: Switch to The Project ROOT Directory" })
    end
}
```

* 用于检测项目根目录的标志文件或文件夹列表。
* 当在某个路径下发现这些文件/目录时，nvim-rooter 会将 Neovim 的当前工作目录切换到该路径。

| 模式 | 快捷键       | 执行命令          | 描述                 |
| ---- | ------------ | ----------------- | -------------------- |
| n    | `<leader>rr` | `<cmd>Rooter<CR>` | 强制切换到项目根目录 |
