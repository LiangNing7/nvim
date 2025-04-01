return {
  "HakonHarnes/img-clip.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },  -- 如果插件依赖其他包，可在此声明
  keys = {  -- 定义快捷键（可选）
    { "<Leader>p", mode = { "n", "v" }, "<Cmd>PasteImage<CR>", desc = "粘贴图片" },
  },
  opts = {  -- LazyVim 自动调用 setup()
    default_dir = "~/Pictures",  -- 图片保存路径
    clipboard = {
      command = "xclip -selection clipboard -t image/png -i",  -- Linux 剪贴板命令
    }
  }
}
