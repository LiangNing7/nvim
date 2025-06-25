return {
    "ray-x/go.nvim",
    dependencies = {  -- 依赖项修正  
        "ray-x/guihua.lua",
        "neovim/nvim-lspconfig",
        "nvim-treesitter/nvim-treesitter",
    },
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = function()  -- 修正构建命令  
        require("go.install").update_all_sync()
    end,
    config = function()
        require("go").setup({
            verbose = false,
            diagnostic = false, -- diagnostic 在 lspconfig 中配置
            dap_debug = false,
        })
        -- require("go.format").gofmt()  -- 只使用 gofmt  
        require("go.format").goimports()  -- goimports + gofmt

        -- 自动格式化配置 (修正缩进和语法)  
        local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*.go",
            group = format_sync_grp,
            callback = function()
                -- require("go.format").gofmt()  
                require("go.format").goimports()  -- goimports + gofmt
            end,
        })

        -- Go IDE
        vim.keymap.set("n", "<leader>fe", ":GoIfErr<CR>",     { desc = "Insert error check (`if err != nil`)" })
        vim.keymap.set("n", "<leader>fs", ":GoFillStruct<CR>",{ desc = "Fill Struct in Go" })
        vim.keymap.set("n", "<leader>fc", ":GoFillSwitch<CR>",{ desc = "Fill Switch in Go" })
        vim.keymap.set("n", "<leader>ta", ":GoAddTag<CR>",    { desc = "Tag Add in Go" })
        vim.keymap.set("n", "<leader>tr", ":GoRmTag<CR>",     { desc = "Tag Remove in Go" })
        vim.keymap.set("n", "<leader>tc", ":GoClearTag<CR>",  { desc = "Tag Clear in Go" })
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename"})
        vim.keymap.set("n", "gd", "<cmd>FzfLua lsp_definitions<CR>",      { desc = "Go to Definition" })
        vim.keymap.set("n", "gr", "<cmd>FzfLua lsp_references<CR>",       { desc = "Go to References" })
        vim.keymap.set("n", "gi", "<cmd>FzfLua lsp_implementations<CR>",  { desc = "Go to Implementations" })
    end
}
