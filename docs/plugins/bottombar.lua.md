# bottombar

> 源码位于：[bottombar](./code/bottombar.lua)

给 Neovim 的状态栏插件 **lualine.nvim** 做定制化设置，下面逐项说明：

## 1.  插件声明

```lua
return {
	"nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
	...
}
```

* 使用 `nvim-lualine/lualine.nvim` 这个插件。
* 依赖 `nvim-web-devicons`，用于在状态栏中显示文件类型图标。

## 2. opts 配置表

所有自定义的选项都写在 `opts` 里，Neovim 启动时会把它传给 lualine。

```lua
opts = {
  options = { … },
  sections = { … },
}
```

* **options** —— 全局样式和行为

  ```lua
  options = {
    theme = "tokyonight",           -- 配色主题，使用 tokyonight 风格
    always_divide_middle = false,   -- 是否在中间位置始终保持分割（这里关闭）
    component_separators = {        -- 各组件之间的分隔符
      left = "", right = ""
    },
    section_separators = {          -- 各区域（a/b/c 以及 x/y/z）之间的分隔符
      left = "", right = ""
    },
  },
  ```

  * **theme**：可选内置主题或自己扩展的配色，这里选用了 `tokyonight`

  * **always_divide_middle**：默认 `true` 时左右两侧区域会有明显间隔；设为 `false` 则去掉这块留白

  * **component_separators**、**section_separators**：都设为空字符串，去掉了默认的竖线或箭头分隔符，让状态栏显得更简洁

* **sections** —— 状态栏各区域要显示的内容

  ```lua
  sections = {
    lualine_a = { "mode" },             -- 最左：当前编辑模式（NORMAL/INSERT 等）
    lualine_b = { "branch", "diff", "diagnostics" },
                                        -- b 段：Git 分支、代码 diff 信息、诊断（错误/警告）
    lualine_c = { "lsp_status" },       -- c 段：LSP 服务状态（当前语言服务器运行情况）
    lualine_x = {},                     -- x 段：留空
    lualine_y = { "encoding", "progress" },
                                        -- y 段：文件编码（utf-8 等）、阅读进度（行号百分比）
    lualine_z = { "location" },         -- 最右：光标当前位置（行:列）
  },
  ```

  * **lualine_a~lualine_z** 分别表示从左到右的 6 个区块

  * 每个区块都可以放一到多个内置组件（字符串）或自定义函数

  * 这里去掉了 x 段内容，让信息更集中在左右两边