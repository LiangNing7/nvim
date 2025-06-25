return {
	'akinsho/bufferline.nvim',
	version = "*",-- 安装最新的稳定版
	dependencies = 'kyazdani42/nvim-web-devicons',
	config = function()
		require("bufferline").setup {}

		-- 切换上一个/下一个Buffer (常用!)
		vim.keymap.set('n', '<leader>b-', ':bprevious<CR>', { desc = 'Buffer: Previous buffer' })
		vim.keymap.set('n', '<leader>b=', ':bnext<CR>', { desc = 'Buffer: Next buffer' })

		-- 快速关闭Buffer (避免用:q关闭整个Neovim)
		vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { desc = 'Buffer: Delete buffer' })
		-- 快速关闭其他 Buffer
		vim.keymap.set('n', '<leader>bo', '<cmd>BufferLineCloseOthers<CR>', { desc = 'Buffer: Delete others buffer' })


		-- 模糊搜索Buffer名 (需输入部分文件名)
		vim.keymap.set('n', '<leader>bs', ':b ', { desc = 'Buffer: Search buffer by name' })
	end
}

