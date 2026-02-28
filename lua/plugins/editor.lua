return {
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {
			modes = {
				char = {
					enabled = false,
				},
			},
		},
		keys = {
			{
				"<leader>j",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash Jump",
			},
			{
				"<leader>J",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
		},
	},

	{
		"brenoprata10/nvim-highlight-colors",
		event = "BufReadPre",
		opts = {
			render = "background",
			enable_hex = true,
			enable_short_hex = true,
			enable_rgb = true,
			enable_hsl = true,
			enable_hsl_without_function = true,
			enable_ansi = true,
			enable_var_usage = true,
			enable_tailwind = true,
		},
	},

	{
		"dinhhuy258/git.nvim",
		event = "BufReadPre",
		opts = {
			keymaps = {
				-- Open blame window
				blame = "<Leader>gb",
				-- Open file/folder in git repository
				browse = "<Leader>go",
			},
		},
	},

	-- Enhanced git diff view
	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
		keys = {
			{ "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
			{ "<leader>gc", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
			{ "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "File History" },
			{ "<leader>gH", "<cmd>DiffviewFileHistory %<cr>", desc = "Current File History" },
		},
		config = function()
			require("diffview").setup({
				diff_binaries = false,
				enhanced_diff_hl = false,
				use_icons = true,
				icons = {
					folder_closed = "",
					folder_open = "",
				},
				signs = {
					fold_closed = "",
					fold_open = "",
				},
				file_panel = {
					listing_style = "tree",
					tree_options = {
						flatten_dirs = true,
						folder_statuses = "only_folded",
					},
					win_config = {
						position = "left",
						width = 35,
					},
				},
				file_history_panel = {
					log_options = {
						git = {
							single_file = {
								diff_merges = "combined",
							},
							multi_file = {
								diff_merges = "first-parent",
							},
						},
					},
					win_config = {
						position = "bottom",
						height = 16,
					},
				},
				keymaps = {
					disable_defaults = false,
					view = {
						["<tab>"] = require("diffview.actions").select_next_entry,
						["<s-tab>"] = require("diffview.actions").select_prev_entry,
						["gf"] = require("diffview.actions").goto_file,
						["<C-w><C-f>"] = require("diffview.actions").goto_file_split,
						["<C-w>gf"] = require("diffview.actions").goto_file_tab,
						["<leader>e"] = require("diffview.actions").focus_files,
						["<leader>b"] = require("diffview.actions").toggle_files,
					},
					file_panel = {
						["j"] = require("diffview.actions").next_entry,
						["k"] = require("diffview.actions").prev_entry,
						["<cr>"] = require("diffview.actions").select_entry,
						["o"] = require("diffview.actions").select_entry,
						["<2-LeftMouse>"] = require("diffview.actions").select_entry,
						["-"] = require("diffview.actions").toggle_stage_entry,
						["S"] = require("diffview.actions").stage_all,
						["U"] = require("diffview.actions").unstage_all,
						["X"] = require("diffview.actions").restore_entry,
						["R"] = require("diffview.actions").refresh_files,
						["<tab>"] = require("diffview.actions").select_next_entry,
						["<s-tab>"] = require("diffview.actions").select_prev_entry,
						["gf"] = require("diffview.actions").goto_file,
						["<C-w><C-f>"] = require("diffview.actions").goto_file_split,
						["<C-w>gf"] = require("diffview.actions").goto_file_tab,
						["i"] = require("diffview.actions").listing_style,
						["f"] = require("diffview.actions").toggle_flatten_dirs,
						["<leader>e"] = require("diffview.actions").focus_files,
						["<leader>b"] = require("diffview.actions").toggle_files,
					},
					file_history_panel = {
						["g!"] = require("diffview.actions").options,
						["<C-A-d>"] = require("diffview.actions").open_in_diffview,
						["y"] = require("diffview.actions").copy_hash,
						["zR"] = require("diffview.actions").open_all_folds,
						["zM"] = require("diffview.actions").close_all_folds,
						["j"] = require("diffview.actions").next_entry,
						["k"] = require("diffview.actions").prev_entry,
						["<cr>"] = require("diffview.actions").select_entry,
						["o"] = require("diffview.actions").select_entry,
						["<2-LeftMouse>"] = require("diffview.actions").select_entry,
						["<tab>"] = require("diffview.actions").select_next_entry,
						["<s-tab>"] = require("diffview.actions").select_prev_entry,
						["gf"] = require("diffview.actions").goto_file,
						["<C-w><C-f>"] = require("diffview.actions").goto_file_split,
						["<C-w>gf"] = require("diffview.actions").goto_file_tab,
						["<leader>e"] = require("diffview.actions").focus_files,
						["<leader>b"] = require("diffview.actions").toggle_files,
					},
				},
			})
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
			"nvim-telescope/telescope-file-browser.nvim",
		},
		keys = {
			-- 项目内容搜索（在整个项目中搜索文本）
			{
				"<leader>fp",
				function()
					require("telescope.builtin").live_grep({
						cwd = vim.loop.cwd(),
						additional_args = { "--hidden" },
					})
				end,
				desc = "Grep (Project Root)",
			},
			-- 当前目录内容搜索（在当前目录中搜索文本）
			{
				"<leader>fb",
				function()
					require("telescope.builtin").live_grep({
						cwd = vim.fn.expand("%:p:h"),
						additional_args = { "--hidden" },
					})
				end,
				desc = "Grep (Current Dir)",
			},
			-- 当前文件内容搜索（在当前文件中搜索文本）
			{
				"<leader>ff",
				function()
					require("telescope.builtin").current_buffer_fuzzy_find()
				end,
				desc = "Grep in Current File",
			},
			-- 插件文件搜索
			{
				"<leader>fP",
				function()
					require("telescope.builtin").find_files({
						cwd = require("lazy.core.config").options.root,
					})
				end,
				desc = "Find Plugin File",
			},
			-- Go 标准库源码搜索
			{
				"<leader>fG",
				"<cmd>Telescope gosource<cr>",
				desc = "Go Source (stdlib)",
			},
			{
				";f",
				function()
					local builtin = require("telescope.builtin")
					builtin.find_files({
						no_ignore = false,
						hidden = true,
					})
				end,
				desc = "Lists files in your current working directory, respects .gitignore",
			},
			{
				"\\\\",
				function()
					local builtin = require("telescope.builtin")
					builtin.buffers()
				end,
				desc = "Lists open buffers",
			},
			{
				";t",
				function()
					local builtin = require("telescope.builtin")
					builtin.help_tags()
				end,
				desc = "Lists available help tags and opens a new window with the relevant help info on <cr>",
			},
			{
				";;",
				function()
					local builtin = require("telescope.builtin")
					builtin.resume()
				end,
				desc = "Resume the previous telescope picker",
			},
			{
				";e",
				function()
					local builtin = require("telescope.builtin")
					builtin.diagnostics()
				end,
				desc = "Lists Diagnostics for all open buffers or a specific buffer",
			},
			{
				";s",
				function()
					local builtin = require("telescope.builtin")
					builtin.treesitter()
				end,
				desc = "Lists Function names, variables, from Treesitter",
			},
			{
				";c",
				function()
					local builtin = require("telescope.builtin")
					builtin.lsp_incoming_calls()
				end,
				desc = "Lists LSP incoming calls for word under the cursor",
			},
			{
				"sf",
				function()
					local telescope = require("telescope")

					local function telescope_buffer_dir()
						return vim.fn.expand("%:p:h")
					end

					telescope.extensions.file_browser.file_browser({
						path = "%:p:h",
						cwd = telescope_buffer_dir(),
						respect_gitignore = false,
						hidden = true,
						grouped = true,
						previewer = false,
						initial_mode = "normal",
						layout_config = { height = 40 },
					})
				end,
				desc = "Open File Browser with the path of the current buffer",
			},
		},
		config = function(_, opts)
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local fb_actions = require("telescope").extensions.file_browser.actions

			opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
				wrap_results = true,
				layout_strategy = "horizontal",
				layout_config = { prompt_position = "top" },
				sorting_strategy = "ascending",
				winblend = 0,
				mappings = {
					n = {},
				},
			})
			opts.pickers = {
				diagnostics = {
					theme = "ivy",
					initial_mode = "normal",
					layout_config = {
						preview_cutoff = 9999,
					},
				},
			}
			opts.extensions = {
				file_browser = {
					theme = "dropdown",
					-- disables netrw and use telescope-file-browser in its place
					hijack_netrw = true,
					mappings = {
						-- your custom insert mode mappings
						["n"] = {
							-- your custom normal mode mappings
							["N"] = fb_actions.create,
							["h"] = fb_actions.goto_parent_dir,
							["/"] = function()
								vim.cmd("startinsert")
							end,
							["<C-u>"] = function(prompt_bufnr)
								for i = 1, 10 do
									actions.move_selection_previous(prompt_bufnr)
								end
							end,
							["<C-d>"] = function(prompt_bufnr)
								for i = 1, 10 do
									actions.move_selection_next(prompt_bufnr)
								end
							end,
							["<PageUp>"] = actions.preview_scrolling_up,
							["<PageDown>"] = actions.preview_scrolling_down,
						},
					},
				},
			}
			telescope.setup(opts)
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("file_browser")
			
			-- Load Go source extension
			if vim.fn.executable("go") == 1 then
				pcall(require("telescope").load_extension, "gosource")
			end
		end,
	},

	{
		"kazhala/close-buffers.nvim",
		event = "VeryLazy",
		keys = {
			{
				"<leader>bh",
				function()
					require("close_buffers").delete({ type = "hidden" })
				end,
				desc = "Close Hidden Buffers",
			},
			{
				"<leader>bu",
				function()
					require("close_buffers").delete({ type = "nameless" })
				end,
				desc = "Close Nameless Buffers",
			},
		},
	},

	{
		"saghen/blink.cmp",
		opts = {
			completion = {
				menu = {
					winblend = vim.o.pumblend,
				},
			},
			signature = {
				window = {
					winblend = vim.o.pumblend,
				},
			},
		},
	},

	-- Terminal manager
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		cmd = { "ToggleTerm", "ToggleTermToggleAll", "TermExec" },
		keys = {
			{ "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal", mode = { "n", "t" } },
			{ "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float Terminal" },
			{ "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Horizontal Terminal" },
			{ "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Vertical Terminal" },
		},
		config = function()
			require("toggleterm").setup({
				size = function(term)
					if term.direction == "horizontal" then
						return 15
					elseif term.direction == "vertical" then
						return vim.o.columns * 0.4
					end
				end,
				open_mapping = [[<C-\>]],
				hide_numbers = true,
				shade_terminals = false, -- WSL 中禁用 shading
				start_in_insert = true,
				insert_mappings = true,
				terminal_mappings = true,
				persist_size = true,
				persist_mode = true,
				direction = "float",
				close_on_exit = true,
				shell = vim.o.shell,
				autochdir = false,
				highlights = {
					Normal = { link = "Normal" },
					NormalFloat = { link = "Normal" },
					FloatBorder = { link = "FloatBorder" },
				},
				float_opts = {
					border = "curved",
					width = function()
						return math.floor(vim.o.columns * 0.9)
					end,
					height = function()
						return math.floor(vim.o.lines * 0.8)
					end,
					winblend = 0, -- WSL 中设置为 0
				},
				winbar = {
					enabled = false,
				},
			})

			-- Terminal mode keymaps
			function _G.set_terminal_keymaps()
				local opts = { buffer = 0 }
				vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
				vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
				vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
				vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
				vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
			end

			vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
		end,
	},
}
