return {
	'echasnovski/mini.nvim',
	branch = 'stable',
	config = function()
		require('mini.surround').setup {
			mappings = {
				add = '<leader>sr',         -- Add surrounding
				delete = '<leader>sd',     -- Delete surrounding
				find = '<leader>sf',       -- Find surrounding (to the right)
				find_left = '<leader>sF',  -- Find surrounding (to the left)
				highlight = '<leader>sh',  -- Highlight surrounding
				replace = '<leader>cs',    -- Replace surrounding/change sround
				update_n_lines = '<leader>sn', -- Update `n_lines`
			},
		}
	end
}
