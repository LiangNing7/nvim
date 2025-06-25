# surround 

> 源码位于：[surround](../../lua/plugins/surround.lua)

```lua
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
				replace = '<leader>cs',    -- Replace surrounding/change surround
				update_n_lines = '<leader>sn', -- Update `n_lines`
			},
		}
	end
}
```

* `mini.surround` 是 Neovim 的一款轻量化包围符编辑插件。
* `setup` 函数中传入的 `mappings` 表示自定义操作快捷键。
* 所有快捷键都以 `<leader>s` 开头，更具组织性。

## mappings

| 模式 | 快捷键       | 执行命令                        | 描述                       |
| ---- | ------------ | ------------------------------- | -------------------------- |
| n/v  | `<leader>sr` | `MiniSurround.add()`            | 添加包围符                 |
| n    | `<leader>sd` | `MiniSurround.delete()`         | 删除包围符                 |
| n    | `<leader>sf` | `MiniSurround.find()`           | 向右查找最近的包围符       |
| n    | `<leader>sF` | `MiniSurround.find_left()`      | 向左查找最近的包围符       |
| n    | `<leader>sh` | `MiniSurround.highlight()`      | 高亮光标处所在的包围范围   |
| n    | `<leader>cs` | `MiniSurround.replace()`        | 替换包围符                 |
| n    | `<leader>sn` | `MiniSurround.update_n_lines()` | 更新查找包围符时的行数范围 |
