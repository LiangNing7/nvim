return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<c-\>]], -- ✅ 使用 Ctrl+\ 打开终端  
      start_in_insert = true,   -- 进入终端自动进入 insert 模式  
      direction = "horizontal"  -- tab, float, vertical
    })
  end
}
