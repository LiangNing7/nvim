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
