return {
	'lewis6991/gitsigns.nvim',
	config = function()
		require('gitsigns').setup {
			signs = {
				add          = { text = '┃' },
				change       = { text = '┃' },
				delete       = { text = '_' },
				topdelete    = { text = '‾' },
				changedelete = { text = '~' },
				untracked    = { text = '┆' },
			},
			signs_staged = {
				add          = { text = '┃' },
				change       = { text = '┃' },
				delete       = { text = '_' },
				topdelete    = { text = '‾' },
				changedelete = { text = '~' },
				untracked    = { text = '┆' },
			},
			signs_staged_enable = true,
			signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
			numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
			linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
			word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
			watch_gitdir = {
				follow_files = true
			},
			auto_attach = true,
			attach_to_untracked = false,
			current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
				delay = 1000,
				ignore_whitespace = false,
				virt_text_priority = 100,
				use_focus = true,
			},
			current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil, -- Use default
			max_file_length = 40000, -- Disable if file is longer than this (in lines)
			preview_config = {
				-- Options passed to nvim_open_win
				style = 'minimal',
				relative = 'cursor',
				row = 0,
				col = 1
			},
			on_attach = function(bufnr)
				local gitsigns = require('gitsigns')

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map('n', '<leader>h=', function()
					if vim.wo.diff then
						vim.cmd.normal({']c', bang = true})
					else
						gitsigns.nav_hunk('next')
					end
				end, { desc = 'Git: Next hunk' })

				map('n', '<leader>h-', function()
					if vim.wo.diff then
						vim.cmd.normal({'[c', bang = true})
					else
						gitsigns.nav_hunk('prev')
					end
				end, { desc = 'Git: Previous hunk' })

				-- Actions
				map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'Git: Stage hunk' })
				map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'Git: Reset hunk' })

				map('v', '<leader>hs', function()
					gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
				end, { desc = 'Git: Stage selected hunk' })

				map('v', '<leader>hr', function()
					gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
				end, { desc = 'Git: Reset selected hunk' })

				map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'Git: Stage buffer' })
				map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'Git: Reset buffer' })
				map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'Git: Preview hunk' })
				map('n', '<leader>hi', gitsigns.preview_hunk_inline, { desc = 'Git: Inline preview hunk' })

				map('n', '<leader>hb', function()
					gitsigns.blame_line({ full = true })
				end, { desc = 'Git: Blame current line' })

				map('n', '<leader>hd', gitsigns.diffthis, { desc = 'Git: Diff this' })

				map('n', '<leader>hD', function()
					gitsigns.diffthis('~')
				end, { desc = 'Git: Diff against last commit' })

				map('n', '<leader>hQ', function() gitsigns.setqflist('all') end, { desc = 'Git: Set quickfix list (all hunks)' })
				map('n', '<leader>hq', gitsigns.setqflist, { desc = 'Git: Set quickfix list (unstaged hunks)' })

				-- Toggles
				map('n', '<leader>lb', gitsigns.toggle_current_line_blame, { desc = 'Git: Toggle line blame' })
				map('n', '<leader>wd', gitsigns.toggle_word_diff,{ desc = 'Git: Toggle word diff' } )

				-- Text object
				map({'o', 'x'}, 'ih', gitsigns.select_hunk, { desc = 'Git: Select hunk (text object)' })
			end
		}
	end
}

