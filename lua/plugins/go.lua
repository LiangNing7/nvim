return {
	-- Go development plugin
	{
		"ray-x/go.nvim",
		dependencies = {
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		ft = { "go", "gomod", "gosum", "gotmpl", "gohtmltmpl", "gotexttmpl" },
		build = ':lua require("go.install").update_all_sync()',
		config = function()
			require("go").setup({
				-- Go specific settings
				go = "go",
				goimports = "gopls",
				gofmt = "gopls",
				-- max_line_len 只在 gofmt = "golines" 时有效，移除避免警告
				tag_transform = false,
				tag_options = "json=omitempty",
				comment_placeholder = "",
				verbose = false,
				log_path = vim.fn.expand("$HOME") .. "/tmp/gonvim.log",
				
				-- LSP config
				lsp_cfg = true,
				lsp_gofumpt = true,
				lsp_on_attach = nil,
				lsp_keymaps = false,
				lsp_codelens = false, -- use navigator for codelens
				lsp_diag_hdlr = true,
				lsp_diag_virtual_text = { space = 0, prefix = "■" },
				lsp_diag_signs = true,
				lsp_diag_update_in_insert = false,
				lsp_document_formatting = true,
				lsp_semantic_highlights = false,
				
				-- Inlay hints
				lsp_inlay_hints = {
					enable = true,
					only_current_line = false,
					only_current_line_autocmd = "CursorHold",
					show_variable_name = true,
					parameter_hints_prefix = "  ",
					show_parameter_hints = true,
					other_hints_prefix = "=> ",
				},
				
				-- Code lens
				gopls_cmd = nil,
				gopls_remote_auto = true,
				
				-- Formatting
				fillstruct = "gopls",
				
				-- Linter
				linter_flags = "",
				lint_prompt_style = "qf",
				luasnip = false, -- 禁用 luasnip，使用 blink.cmp
				golangci_lint = {
					disable = { "unused" },
				},
				
				-- Debugger
				dap_debug = true,
				dap_debug_gui = true,
				dap_debug_keymap = true,
				dap_vt = true,
				dap_debug_vt = true,
				
				-- Test
				test_runner = "go",
				run_in_floaterm = false,
				test_efm = false,
				test_open_cmd = "edit",
				
				-- Build tags
				build_tags = "",
				textobjects = true,
				test_template = "",
				test_template_dir = "",
				
				-- Comment
				comment = {
					highlight = true,
				},
				
				-- LSP implementation
				lsp_impl = {
					enable = true,
					loadfile = true,
				},
				
				-- Other
				icons = { breakpoint = "🔴", currentpos = "🔵" },
			})
		end,
	},
}
