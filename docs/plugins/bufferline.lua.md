# bufferline

> 源码位于：[bufferline](../../lua/plugins/bufferline.lua)

```lua
return {
	'akinsho/bufferline.nvim',
	version = "*",-- 安装最新的稳定版
	dependencies = 'kyazdani42/nvim-web-devicons',
	config = function()
		require("bufferline").setup {}
		... -- mappings
	end
}
```

## mappings

| 模式 | 快捷键       | 命令                             | 描述                              | 功能分类    |
| ---- | ------------ | -------------------------------- | --------------------------------- | ----------- |
| n    | `<leader>b-` | `<cmd>bprevious<CR>`             | 切换到上一个 buffer               | Buffer 导航 |
| n    | `<leader>b=` | `<cmd>bnext<CR>`                 | 切换到下一个 buffer               | Buffer 导航 |
| n    | `<leader>bd` | `<cmd>bdelete<CR>`               | 关闭当前 buffer                   | Buffer 管理 |
| n    | `<leader>bo` | `<cmd>BufferLineCloseOthers<CR>` | 关闭其他 buffer                   | Buffer 管理 |
| n    | `<leader>bb` | `<cmd>b `                        | 模糊搜索并切换到指定名字的 buffer | Buffer 搜索 |
