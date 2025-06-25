-- 复用 opt 参数
local opt = {noremap = true, silent = true }

-- 基础操作
vim.keymap.set("n", "<leader>p", ":set invpaste paste?<CR>", opt) -- 格式化文件中所有代码行（nvim-treesitter 代码格式化）
vim.keymap.set("n", "<leader>tf", "gg=G", opt) -- 格式化文件中所有代码行（nvim-treesitter 代码格式化）

-- 窗口操作
-- 取消 s 默认功能
vim.keymap.set("n", "s", "", opt)

-- windows 分屏快捷键
vim.keymap.set("n", "sv", ":vsp<CR>", opt)
vim.keymap.set("n", "sh", ":sp<CR>", opt)
vim.keymap.set("n", "sc", "<C-w>c", opt) -- 关闭当前
vim.keymap.set("n", "so", "<C-w>o", opt) -- 关闭其他

-- 简化窗口跳转快捷键
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Switch Left Window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Switch Lower Window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Switch Upper Window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Switch Right Window" })

-- 上下移动选中文本
vim.keymap.set("v", "<C-j>", ":move '>+1<CR>gv-gv", opt)
vim.keymap.set("v", "<C-k>", ":move '<-2<CR>gv-gv", opt)

-- insert 模式下，跳到行首行尾
vim.keymap.set("i", "<C-h>", "<ESC>I", opt)
vim.keymap.set("i", "<C-l>", "<ESC>A", opt)

-- 清除高亮
vim.keymap.set("n", "<ESC>", vim.cmd.nohlsearch, { desc = "Clear Highlights" })

-- 简化退出、保存文件
vim.keymap.set({ "i", "x", "n", "s" }, "<C-q>", vim.cmd.quit, { desc = "Quit File" })
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", vim.cmd.write, { desc = "Save File" })


-- 其他
vim.keymap.set('n', '<S-n>', function()
    vim.wo.number = not vim.wo.number
end, { desc = 'Toggle line numbers' })
