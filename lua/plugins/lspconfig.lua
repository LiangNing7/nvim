-- plugins/lsp.lua  
return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason.nvim" },
        { "mason-org/mason-lspconfig.nvim" },
        { "MysticalDevil/inlay-hints.nvim", event = "LspAttach" },
    },
    config = function()  
        local lsp_utils = require("lspconfig.util")

        -- 通过mason来自动安装语言服务器并启用
        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = {
                "gopls",
                "marksman",
                -- "lua_ls",
                -- "pylsp", -- 保证有 python3、pip 环境
                -- "rust_analyzer",
            },
            automatic_enable = {
                exclude = {},
            },
        })
        
		-- 诊断信息的图标
		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "✘",
					[vim.diagnostic.severity.WARN] = "▲",
					[vim.diagnostic.severity.HINT] = "⚑",
					[vim.diagnostic.severity.INFO] = "»",
				},
			},
		})

        -- 快捷键的映射
        vim.keymap.set("n", "K", function()
            vim.lsp.buf.hover({
                border = "single",
            })
        end, opts)
        vim.keymap.set("n", "<leader>aw", vim.lsp.buf.code_action, opts) -- <space>aw可以在出现警告或错误的地方打开建议的修复方法
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- <space>d浮动窗口显示所在行警告或错误信息
        vim.keymap.set("n", "<leader>-", vim.diagnostic.goto_prev, opts) -- <space>-跳转到上一处警告或错误的地方
        vim.keymap.set("n", "<leader>=", vim.diagnostic.goto_next, opts) -- <space>+跳转到下一处警告或错误的地方
        vim.keymap.set("n", "<leader>ih", "<cmd>InlayHintsToggle<cr>", { desc = "InlayHints: Toggle Inlay Hints", silent = true })

        -- Go 语言服务器配置  
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

        -- 自动格式化配置  
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*.go",
            callback = function()
                vim.lsp.buf.format({
                    async = false,
                    timeout_ms = 5000,
                    filter = function(client)
                        return client.name == "gopls"
                    end
                })
            end
        })

        require("inlay-hints").setup({
            -- 启用 InlayHintsToggle、InlayHintsEnable、InlayHintsDisable 三个命令
            commands = { enable = true },
            -- 插件自动在 LspAttach 时启用内联提示（可选）
            autocmd = { enable = false },
        })
    end
}
