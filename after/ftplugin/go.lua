-- Go file type specific settings
vim.opt_local.iskeyword:append('"')
vim.opt_local.conceallevel = 1
vim.opt_local.concealcursor = ""
vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.tabstop = 4

-- Go specific keymaps (only active in Go files)
local opts = { noremap = true, silent = true, buffer = true }

-- Build and run
vim.keymap.set("n", "<leader>Gr", "<cmd>GoRun<CR>", vim.tbl_extend("force", opts, { desc = "Go Run" }))
vim.keymap.set("n", "<leader>Gb", "<cmd>GoBuild<CR>", vim.tbl_extend("force", opts, { desc = "Go Build" }))

-- Testing
vim.keymap.set("n", "<leader>Gt", "<cmd>GoTestFunc<CR>", vim.tbl_extend("force", opts, { desc = "Go Test Function" }))
vim.keymap.set("n", "<leader>GT", "<cmd>GoTestFile<CR>", vim.tbl_extend("force", opts, { desc = "Go Test File" }))
vim.keymap.set("n", "<leader>Gp", "<cmd>GoTestPkg<CR>", vim.tbl_extend("force", opts, { desc = "Go Test Package" }))
vim.keymap.set("n", "<leader>Ga", "<cmd>GoAddTest<CR>", vim.tbl_extend("force", opts, { desc = "Go Add Test" }))

-- Coverage
vim.keymap.set("n", "<leader>GC", "<cmd>GoCoverage<CR>", vim.tbl_extend("force", opts, { desc = "Go Coverage" }))
vim.keymap.set(
	"n",
	"<leader>Gc",
	"<cmd>GoCoverageToggle<CR>",
	vim.tbl_extend("force", opts, { desc = "Go Coverage Toggle" })
)

-- Code generation
vim.keymap.set("n", "<leader>Gf", "<cmd>GoFillStruct<CR>", vim.tbl_extend("force", opts, { desc = "Go Fill Struct" }))
vim.keymap.set("n", "<leader>Gi", "<cmd>GoImpl<CR>", vim.tbl_extend("force", opts, { desc = "Go Impl Interface" }))
vim.keymap.set("n", "<leader>Gg", "<cmd>GoAddTag<CR>", vim.tbl_extend("force", opts, { desc = "Go Add Tag" }))
vim.keymap.set("n", "<leader>Ge", "<cmd>GoIfErr<CR>", vim.tbl_extend("force", opts, { desc = "Go If Err" }))
vim.keymap.set("n", "<leader>GR", "<cmd>GoGenReturn<CR>", vim.tbl_extend("force", opts, { desc = "Go Gen Return" }))

-- Documentation and formatting
vim.keymap.set("n", "<leader>Gd", "<cmd>GoDoc<CR>", vim.tbl_extend("force", opts, { desc = "Go Doc" }))
vim.keymap.set("n", "<leader>GF", "<cmd>GoFmt<CR>", vim.tbl_extend("force", opts, { desc = "Go Format" }))
vim.keymap.set("n", "<leader>GI", "<cmd>GoImport<CR>", vim.tbl_extend("force", opts, { desc = "Go Import" }))

-- Inlay hints and linting
vim.keymap.set("n", "<leader>GL", "<cmd>GoToggleInlay<CR>", vim.tbl_extend("force", opts, { desc = "Go Toggle Inlay" }))
vim.keymap.set("n", "<leader>Gl", "<cmd>GoLint<CR>", vim.tbl_extend("force", opts, { desc = "Go Lint" }))

-- Comment generation
vim.keymap.set(
	"n",
	"<leader>Gm",
	"<cmd>lua require('go.comment').gen()<CR>",
	vim.tbl_extend("force", opts, { desc = "Go Comment" })
)

-- Debugging
vim.keymap.set("n", "<leader>GD", "<cmd>GoDebug -t<CR>", vim.tbl_extend("force", opts, { desc = "Go Debug Test" }))
vim.keymap.set(
	"n",
	"<leader>Gx",
	"<cmd>GoBreakToggle<CR>",
	vim.tbl_extend("force", opts, { desc = "Go Breakpoint Toggle" })
)

-- Change signature (visual mode)
vim.keymap.set("v", "<leader>Gs", function()
	require("go.gopls").change_signature()
end, vim.tbl_extend("force", opts, { desc = "Go Change Signature" }))

-- Auto format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		require("go.format").goimports()
	end,
	group = vim.api.nvim_create_augroup("GoFormat", { clear = true }),
})
