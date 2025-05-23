-- 复用 opt 参数
local opt = {noremap = true, silent = true }

vim.keymap.set("n", "<leader>i", "gg=G", opt) -- 格式化文件中所有代码行（nvim-treesitter 代码格式化）

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
vim.keymap.set("v", "j", ":move '>+1<CR>gv-gv", opt)
vim.keymap.set({"n", "i"}, "<C-k>", ":move '<-2<CR>gv-gv", opt)

-- insert 模式下，跳到行首行尾
vim.keymap.set("i", "<C-h>", "<ESC>I", opt)
vim.keymap.set("i", "<C-l>", "<ESC>A", opt)

-- 打开或者光比 neo-tree
vim.keymap.set("n", "<C-b>", ":Neotree<CR>", opt)

-- 清除高亮
vim.keymap.set("n", "<ESC>", vim.cmd.nohlsearch, { desc = "Clear Highlights" })
-- 简化退出、保存文件
vim.keymap.set({ "i", "x", "n", "s" }, "<C-q>", vim.cmd.quit, { desc = "Quit File" })
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", vim.cmd.write, { desc = "Save File" })

-- Go IDE
-- 绑定 Ctrl+i 快捷键执行 GoFillStruct  
-- vim.keymap.set("n", "<C-i>", ":GoFillStruct<CR>", { desc = "Fill Struct in Go" })  
vim.keymap.set("n", "<leader>fe", ":GoIfErr<CR>", { desc = "Fill Struct in Go" })  
vim.keymap.set("n", "<leader>fs", ":GoFillStruct<CR>", { desc = "Fill Struct in Go" })  
vim.keymap.set("n", "<leader>fc", ":GoFillSwitch<CR>", { desc = "Fill Struct in Go" })  
vim.keymap.set("n", "<leader>ta", ":GoAddTag<CR>", { desc = "Fill Struct in Go" })  
vim.keymap.set("n", "<leader>tr", ":GoRmTag<CR>", { desc = "Fill Struct in Go" })  
vim.keymap.set("n", "<leader>tc", ":GoClearTag<CR>", { desc = "Fill Struct in Go" })  
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)  
vim.keymap.set("n", "gd", "<cmd>FzfLua lsp_definitions<CR>", { desc = "Go to Definition" })  
vim.keymap.set("n", "gr", "<cmd>FzfLua lsp_references<CR>", { desc = "Go to Definition" })  
vim.keymap.set("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", { desc = "Go to Definition" })  
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)  

-- FZF-Lua
vim.keymap.set("n", "<C-e>", "<cmd>FzfLua buffers<CR>", { desc = "buffers" })  
vim.keymap.set("n", "<leader>r", "<cmd>FzfLua oldfiles<CR>", { desc = "mru" })   --mru: most recent used
vim.keymap.set("n", "<leader>s", "<cmd>FzfLua treesitter<CR>", { desc = "mru" })   --mru: most recent used
vim.keymap.set("n", "<leader>f", "<cmd>FzfLua live_grep<CR>", { desc = "lines" })  
vim.keymap.set("n", "<leader>h", "<cmd>FzfLua search_history<CR>", { desc = "lines" })  
vim.keymap.set("n", "<leader>m", "<cmd>FzfLua marks<CR>", { desc = "lines" })  
vim.keymap.set("n", "<leader>gp", "<cmd>FzfLua git_commits<CR>", { desc = "lines" })  
vim.keymap.set("n", "<leader>gb", "<cmd>FzfLua git_bcommits<CR>", { desc = "lines" })  
vim.keymap.set("n", "<leader>gs", "<cmd>FzfLua git_status<CR>", { desc = "lines" })  
vim.keymap.set("n", "<C-f>", "<cmd>FzfLua lgrep_curbuf<CR>", { desc = "lines" })  

-- Git
vim.keymap.set("n", "<leader>b", "<cmd>BlameToggle<CR>", { desc = "lines" })  

-- 其他
vim.keymap.set('n', '<S-n>', function()  
  vim.wo.number = not vim.wo.number  
end, { desc = 'Toggle line numbers' })  

-- vim.keymap.set("i", "<C-BS>", "<C-W>")
-- vim.keymap.set("i", "<C-H>", "<C-W>")

-- Go Quick Println
vim.api.nvim_create_user_command('AddPrintln', function()
    if vim.bo.filetype ~= "go" then return end
    
    -- 获取当前光标位置
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    
    -- 构造插入内容（包含缩进）
    local line = vim.api.nvim_get_current_line()
    local indent = line:match("^%s*")  -- 获取当前行缩进
    
    -- 在下一行插入打印语句
    vim.api.nvim_buf_set_lines(0, row, row, false, {
        indent .. 'fmt.Println("")'
    })
    
    -- 设置光标到引号中间
    vim.api.nvim_win_set_cursor(0, {row + 1, #indent + 12})
    
    -- 进入插入模式
    vim.api.nvim_command("startinsert")
end, {})

-- 绑定快捷键
vim.keymap.set('n', '<C-p>', '<cmd>AddPrintln<CR>', { noremap = true, silent = true })

-- neo-tree 快捷键
vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = 'Toggle Neo-tree' })
