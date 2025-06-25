# whichkey

> 源码位于：[whichkey](../../lua/plugins/whickkey.lua)

```lua
return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	config = function()
		require("which-key").setup {}
	end
}
```

当按下 `<leader>` 等前缀键后，**弹出可视化提示菜单**，告诉你接下来的可用快捷键是什么。

* `event`：设为 `"VeryLazy"`，表示这个插件会在懒加载时才加载；
* `init`：在插件加载前执行的设置，如设置 timeout 选项
  * `timeout`：开启等待多键序列输入的功能；
  * `timeoutlen`：设置多键快捷键序列的超时时间，单位是毫秒；
* `opts`：插件设置项，这里可以添加你想自定义的 UI、布局等；
* `config`：实际调用插件的 `setup()` 函数初始化。

