return {
  "folke/tokyonight.nvim",
  priority = 1000, -- 确保优先加载
  config = function()
    require("tokyonight").setup({
      -- use the night style
      style = "moon", -- optional: moon、storm、night、Day
      -- disable italic for functions
      styles = {
        functions = {}
      },
      -- Change the "hint" color to the "orange" color, and make the "error" color bright red
      on_colors = function(colors)
        colors.hint = colors.orange
        colors.error = "#ff0000"
      end
    })
  end,
}
