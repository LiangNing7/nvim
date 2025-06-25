-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    -- 主题
    { import = "plugins/tokyonight" },
    -- 启动 UI
    { import = "plugins/alpha" },
    -- go-vim Go IDE 
    { import = "plugins/go-vim" },
    -- LSP配置，全局的错误和警告提示，修复建议，重命名变量，格式化代码等等
    { import = "plugins/lspconfig" },
    -- treesitter 语法高亮
    { import = "plugins/treesitter" },
    -- stickyScroll 代码函数名称浏览时固定
    { import = "plugins/stickyScroll" },
    -- fold折叠，根据treesitter来折叠
    { import = "plugins/fold" },
    -- indentrainbow 缩进彩虹
    { import = "plugins/indentrainbow" },
    -- guess-indent 自动探测缩进
    { import = "plugins/guess-indent" },
    -- rainbowbracket 彩虹括号
    { import = "plugins/rainbowbracket" },
    -- surround 用于对字符 {} [] '' 等的包裹 
    { import = "plugins/surround" },
    -- pairs 对字符括号自动补全另一半
    { import = "plugins/pairs" },
    -- fzf 模糊搜索
    { import = "plugins/fzf" },
    -- blink.cmp 自动补全插件
    { import = "plugins/blinkcmp" },
    -- bufferline 顶部标签栏、文件缓冲区
    { import = "plugins/bufferline" },
    -- comment 注释插件
    { import = "plugins/comment" },
    -- bottombar 底部状态栏
    { import = "plugins/bottombar" },
    -- winbar IDE 风格面包屑导航栏
    { import = "plugins/winbar" },
    -- cmdline 浮动弹窗
    { import = "plugins/cmdline" },
    -- toggleterm 终端 
    { import = "plugins/toggleterm" },
    -- outline 大纲 
    { import = "plugins/outline" },
    -- flash 快速跳转
    { import = "plugins/flash" },
    -- gitstatus git 状态
    { import = "plugins/gitstatus" },
    -- suda write 
    { import = "plugins/suda" },
    -- whichkey 使用多个字母快捷键停留时会提示
    { import = "plugins/whichkey" },
    -- multicursor 多光标
    { import = "plugins/multicursor" },
    -- neo-tree IDE 侧边栏 
    { import = "plugins/neo-tree" },
    -- root 项目根目录 
    { import = "plugins/root" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "tokyonight" } },
  -- automatically check for plugin updates
  checker = {
    enabled = false,    -- 完全禁用更新检查  
    notify = false      -- 关闭所有通知
    -- frequency = 604800  -- 检查间隔改为每周一次（单位：秒）
  },

  ui = {
    icons = {
      ft = "",
      lazy = "󰂠 ",
      loaded = "",
      not_loaded = "",
    },
  },

  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
      },
    },
  },
})
