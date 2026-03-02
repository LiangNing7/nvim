return {
	-- Navigator.lua - Enhanced LSP UI
	{
		"ray-x/navigator.lua",
		dependencies = {
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
		},
		event = "LspAttach",
		config = function()
			local ok, navigator = pcall(require, "navigator")
			if not ok then
				vim.notify("Navigator not loaded", vim.log.levels.WARN)
				return
			end
			navigator.setup({
				debug = false,
				width = 0.75,
				height = 0.3,
				preview_height = 0.35,
				border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
				on_attach = function(client, bufnr)
					-- Custom on_attach logic if needed
				end,

				-- Treesitter
				treesitter_analysis = true,
				treesitter_navigation = true,
				treesitter_analysis_max_num = 100,
				treesitter_analysis_condense = true,

				-- LSP installer
				lsp_installer = false,

				-- LSP
				lsp_signature_help = true,
				lsp = {
					enable = true,
					format_on_save = true,
					format_options = { async = false },
					disable_format_cap = {},
					disable_lsp = {},
					servers = {},
					code_action = {
						enable = true,
						sign = true,
						sign_priority = 40,
						virtual_text = true,
					},
					code_lens_action = {
						enable = true,
						sign = true,
						sign_priority = 40,
						virtual_text = true,
					},
					diagnostic = {
						underline = true,
						virtual_text = { spacing = 3, source = true },
						update_in_insert = false,
					},
					diagnostic_scrollbar_sign = { "▃", "▆", "█" },
					diagnostic_virtual_text = true,
					diagnostic_update_in_insert = false,
					disply_diagnostic_qf = true,
				},

				-- Icons
				icons = {
					icons = true,
					code_action_icon = "🏏",
					diagnostic_head = "🐛",
					diagnostic_head_severity_1 = "🈲",
					fold = {
						prefix = "⚡",
						separator = "",
					},
				},

				-- Keymaps
				keymaps = {
					{ key = "gr", func = vim.lsp.buf.references, desc = "references" },
					{ key = "gR", func = require("navigator.reference").async_ref, desc = "async ref" },
					{ key = "<Leader>gr", func = require("navigator.reference").reference, desc = "reference" },
					{ mode = "i", key = "<M-k>", func = vim.lsp.buf.signature_help, desc = "signature_help" },
					{ key = "g0", func = require("navigator.symbols").document_symbols, desc = "document_symbols" },
					{
						key = "gW",
						func = require("navigator.workspace").workspace_symbol_live,
						desc = "workspace_symbol_live",
					},
					{ key = "gD", func = vim.lsp.buf.declaration, desc = "declaration" },
					{
						key = "gp",
						func = require("navigator.definition").definition_preview,
						desc = "definition_preview",
					},
					{ key = "<Leader>gt", func = require("navigator.treesitter").buf_ts, desc = "buf_ts" },
					{ key = "<Leader>gT", func = require("navigator.treesitter").bufs_ts, desc = "bufs_ts" },
					{
						key = "<Leader>ca",
						mode = "n",
						func = require("navigator.codeAction").code_action,
						desc = "code_action",
					},
					{
						key = "<Leader>ca",
						mode = "v",
						func = require("navigator.codeAction").range_code_action,
						desc = "range_code_action",
					},
					{ key = "<Leader>rn", func = require("navigator.rename").rename, desc = "rename" },
					{ key = "<Leader>gi", func = vim.lsp.buf.incoming_calls, desc = "incoming_calls" },
					{ key = "<Leader>go", func = vim.lsp.buf.outgoing_calls, desc = "outgoing_calls" },
					{ key = "gi", func = vim.lsp.buf.implementation, desc = "implementation" },
					{ key = "<Space>D", func = vim.lsp.buf.type_definition, desc = "type_definition" },
					{ key = "gL", func = require("navigator.diagnostics").show_diagnostics, desc = "show_diagnostics" },
					{
						key = "gG",
						func = require("navigator.diagnostics").show_buf_diagnostics,
						desc = "show_buf_diagnostics",
					},
					{
						key = "<Leader>dt",
						func = require("navigator.diagnostics").toggle_diagnostics,
						desc = "toggle_diagnostics",
					},
					{ key = "]d", func = vim.diagnostic.goto_next, desc = "next diagnostics" },
					{ key = "[d", func = vim.diagnostic.goto_prev, desc = "prev diagnostics" },
					{ key = "]O", func = vim.diagnostic.set_loclist, desc = "diagnostics set loclist" },
					{ key = "]r", func = require("navigator.treesitter").goto_next_usage, desc = "goto_next_usage" },
					{
						key = "[r",
						func = require("navigator.treesitter").goto_previous_usage,
						desc = "goto_previous_usage",
					},
					{ key = "<C-LeftMouse>", func = vim.lsp.buf.definition, desc = "definition" },
					{ key = "g<LeftMouse>", func = vim.lsp.buf.implementation, desc = "implementation" },
					{ key = "<Leader>k", func = require("navigator.dochighlight").hi_symbol, desc = "hi_symbol" },
					{
						key = "<Space>wa",
						func = require("navigator.workspace").add_workspace_folder,
						desc = "add_workspace_folder",
					},
					{
						key = "<Space>wr",
						func = require("navigator.workspace").remove_workspace_folder,
						desc = "remove_workspace_folder",
					},
					{ key = "<Space>ff", func = vim.lsp.buf.format, mode = "n", desc = "format" },
					{ key = "<Space>ff", func = vim.lsp.buf.range_formatting, mode = "v", desc = "range format" },
					{
						key = "<Space>gm",
						func = require("navigator.formatting").range_format,
						mode = "n",
						desc = "range_format",
					},
					{
						key = "<Space>wl",
						func = require("navigator.workspace").list_workspace_folders,
						desc = "list_workspace_folders",
					},
					{
						key = "<Space>la",
						mode = "n",
						func = require("navigator.codelens").run_action,
						desc = "run code lens action",
					},
				},
			})
		end,
	},

	-- GUI library for navigator
	{
		"ray-x/guihua.lua",
		build = "cd lua/fzy && make",
		cond = function()
			return vim.fn.executable("make") == 1
		end,
	},

	-- Symbol usage counter
	{
		"Wansmer/symbol-usage.nvim",
		event = { "BufReadPre", "LspAttach" },
		config = function()
			require("symbol-usage").setup({
				---@type 'above'|'end_of_line'|'textwidth'|'signcolumn' `above` by default
				vt_position = "above",
				request_pending_text = "loading...",
				references = { enabled = true, include_declaration = false },
				definition = { enabled = false },
				implementation = { enabled = false },
				disable = { lsp = {}, filetypes = {}, cond = {} },
				---@type 'start'|'end' At which position of `symbol.selectionRange` the request to the lsp server should start. Default is `end` (try changing it to `start` if the symbol counting is not correct).
				symbol_request_pos = "end",
			})
		end,
	},
}
