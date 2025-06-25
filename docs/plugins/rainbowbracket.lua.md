# rainbowbracket

> 源码位于：[rainbowbracket](../../lua/plugins/rainbowbracket.lua)

```lua
return { 
	"HiPhish/rainbow-delimiters.nvim",
	config = function()
		require("rainbow-delimiters.setup").setup({
			highlight = {
				"RainbowDelimiterBlue",
				"RainbowDelimiterViolet",
				"RainbowDelimiterRed",
				"RainbowDelimiterYellow",
				"RainbowDelimiterGreen",
				"RainbowDelimiterOrange",
				"RainbowDelimiterCyan",
			},
		})
	end,
}

```

* 自动为不同层级的括号上色，提升代码可读性。
* 支持多种括号类型：圆括号 `()`, 花括号 `{}`, 方括号 `[]`, 以及 Lua 字符串定界符 `[[…]]` 等。
* 颜色与层级一一对应，有助于在深度嵌套时代码定位和配对。
