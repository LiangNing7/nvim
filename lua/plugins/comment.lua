return {
  "numToStr/Comment.nvim",
  lazy = false,
  config = function()
    require("Comment").setup({
      ---LUA 配置项
      padding = true, -- 是否在注释符号后添加空格
      sticky = true,  -- 保持光标位置
      ignore = nil,   -- 可以忽略某些行不注释

      toggler = {
        line = "<leader>/", -- 普通模式下：注释/取消注释当前行
      },
      opleader = {
        line = "<leader>/", -- 可视模式下：注释选择的多行
      },

      --- block 注释禁用，仅使用单行注释风格
      --- Comment.nvim 本身不会使用块注释，除非手动设置
      --- 所以默认行为就符合“prefer single line comments”
      --- 不需要显式设置 prefer_single_line_comments
      mappings = {
        basic = true,     -- 启用普通和可视模式映射
        extra = false,    -- 禁用额外映射（如上面/下面插入注释）
        extended = false, -- 禁用额外功能映射（如使用 `gcO`, `gcA`）
      },
    })
  end,
}

