# pairs

> 源码位于：[pairs](../../lua/plugins/pairs.lua)

# 1. 插件声明

```lua
return {
	'windwp/nvim-autopairs',
    ... 
}
```

* `'windwp/nvim-autopairs'`：一个基于 Lua 的自动补全括号、引号、尖括号等的 Neovim 插件。

## 2. 配置

```lua
config = function()
	require('nvim-autopairs').setup({
		-- 在写markdown时禁用括号补全
		-- disable_filetype = {"markdown"},
		-- can use treesitter to check for a pair.
		check_ts = true,
	})
end
```

* `disable_filetype = {"markdown"}`：可以指定在哪些文件类型中 **禁用** 自动补全（这里如果取消注释，就会在 Markdown 文件中不补全括号）。
* `check_ts = true`：启用 Tree-sitter 判断，只有当光标后面不是配对符号时才补全，避免误补全。
