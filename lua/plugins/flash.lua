return {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config    
  config = function()
    require("flash").setup({
      labels = "arstdhneioqwfpgjluyzxcvbkm",
      modes = {
        -- options used when flash is activated through    
        -- a regular search with `/` or `?`    
        search = {
          -- when `true`, flash will be activated during regular search by default.    
          -- You can always toggle when searching with `require("flash").toggle()`    
          enabled = true,
        },
      },
    })

    vim.keymap.set({ "n", "x", "o","c" }, "<leader>sf", function()
      require("flash").toggle()
    end, { desc = "Flash: Toggle '/' or '?' enable flash" })

    vim.keymap.set({ "n", "x", "o" }, "<leader>l", function()
      require("flash").jump({
        search = { mode = "search", max_lenghth = 0 },
        label = { after = { 0, 0 } },
        pattern = "^",
      })
    end, { desc = "Flash: jump line" })
  end,

    opts = {},
    -- stylua: ignore    
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump({ search = { multi_window = true }, }) end, desc = "Flash" },
      -- { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
}
