return {
	-- Modern formatter (替代 none-ls 的格式化功能)
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>cf",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = { "n", "v" },
				desc = "Format Buffer",
			},
		},
		opts = {
			formatters_by_ft = {
				-- Go
				go = { "goimports", "gofumpt" },
				-- Python
				python = { "isort", "black" },
				-- Lua
				lua = { "stylua" },
				-- YAML
				yaml = { "yamlfmt" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		},
	},

	-- Modern linter (替代 none-ls 的 linting 功能)
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")
			
			lint.linters_by_ft = {
				-- Go 由 gopls 和 go.nvim 处理，不需要额外 linter
				-- Python
				python = { "ruff" },
				-- Lua
				lua = { "selene" },
				-- YAML
				yaml = { "yamllint" },
			}

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					-- 避免在 Go 文件中运行（go.nvim 已处理）
					if vim.bo.filetype ~= "go" then
						lint.try_lint()
					end
				end,
			})
		end,
	},
}
