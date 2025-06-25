-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.basic") -- 加载全局配置
require("config.lazy")    -- 加载插件管理器
require("config.keymaps") -- 加载全局快捷键

-- -- 必须设置在 init.lua 的最外层（非函数内部）--
vim.opt.termguicolors = true -- 启用真彩色支持--
vim.o.signcolumn = "yes"
vim.o.background = "dark" -- or "light" for light mode
vim.cmd.colorscheme("tokyonight-night") --应用主题
