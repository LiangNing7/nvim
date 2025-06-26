return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		options = {
			theme = "tokyonight",
			always_divide_middle = false,
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = { "lsp_status" },
			lualine_x = {},
			lualine_y = { "encoding", "progress" },
			lualine_z = { "location" },
		},
	},
}
