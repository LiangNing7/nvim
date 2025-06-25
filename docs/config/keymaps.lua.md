## keymaps.lua

```lua
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
vim.keymap.set("v", "j", ":move '>+1<CR>gv-gv", opt)
vim.keymap.set("v", "k", ":move '<-2<CR>gv-gv", opt)

-- insert 模式下，跳到行首行尾
vim.keymap.set("i", "<C-h>", "<ESC>I", opt)
vim.keymap.set("i", "<C-l>", "<ESC>A", opt)

-- 清除高亮
vim.keymap.set("n", "<ESC>", vim.cmd.nohlsearch, { desc = "Clear Highlights" })

-- 简化退出、保存文件
vim.keymap.set({ "i", "x", "n", "s" }, "<C-q>", vim.cmd.quit, { desc = "Quit File" })
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", vim.cmd.write, { desc = "Save File" })

-- Git
vim.keymap.set("n", "<leader>bl", "<cmd>BlameToggle<CR>", { desc = "Toggle Git blame annotations" })

-- 其他
vim.keymap.set('n', '<S-n>', function()
    vim.wo.number = not vim.wo.number
end, { desc = 'Toggle line numbers' })
```

### 基础操作

| 模式 | 快捷键       | 命令                       | 描述            | 功能分类   |
| ---- | ------------ | -------------------------- | --------------- | ---------- |
| n    | `<leader>p`  | `:set invpaste paste?<CR>` | 切换 paste 模式 | 代码格式化 |
| n    | `<leader>tf` | `gg=G`                     | 格式化整个文件  | 代码格式化 |

### 窗口操作

| 模式 | 快捷键  | 命令         | 描述              | 功能分类 |
| ---- | ------- | ------------ | ----------------- | -------- |
| n    | `s`     | `""`         | 禁用 `s` 默认功能 | 空映射   |
| n    | `sv`    | `:vsp<CR>`   | 垂直分屏          | 分屏管理 |
| n    | `sh`    | `:sp<CR>`    | 水平分屏          | 分屏管理 |
| n    | `sc`    | `<C-w>c`     | 关闭当前窗口      | 分屏管理 |
| n    | `so`    | `<C-w>o`     | 关闭其他窗口      | 分屏管理 |
| n    | `<C-h>` | `<C-w><C-h>` | 切换到左侧窗口    | 窗口切换 |
| n    | `<C-j>` | `<C-w><C-j>` | 切换到下方窗口    | 窗口切换 |
| n    | `<C-k>` | `<C-w><C-k>` | 切换到上方窗口    | 窗口切换 |
| n    | `<C-l>` | `<C-w><C-l>` | 切换到右侧窗口    | 窗口切换 |

### 文本移动

| 模式 | 快捷键  | 命令                  | 描述             | 功能分类 |
| ---- | ------- | --------------------- | ---------------- | -------- |
| v    | `<C-j>` | `:move '>+1<CR>gv-gv` | 选中文本下移一行 | 区块移动 |
| v    | `<C-k>` | `:move '<-2<CR>gv-gv` | 上移选中／当前行 | 区块移动 |

### insert 模式导航

| 模式 | 快捷键  | 命令     | 描述     | 功能分类 |
| ---- | ------- | -------- | -------- | -------- |
| i    | `<C-h>` | `<ESC>I` | 跳至行首 | 插入导航 |
| i    | `<C-l>` | `<ESC>A` | 跳至行尾 | 插入导航 |

### 清除与保存

| 模式       | 快捷键  | 命令          | 描述           | 功能分类 |
| ---------- | ------- | ------------- | -------------- | -------- |
| n          | `<ESC>` | `:nohlsearch` | 清除搜索高亮   | 搜索清理 |
| i, x, n, s | `<C-q>` | `:quit`       | 退出当前缓冲区 | 快速退出 |
| i, x, n, s | `<C-s>` | `:write`      | 保存当前文件   | 快速保存 |

### 其他

| 模式 | 快捷键  | 命令                                               | 描述           | 功能分类 |
| ---- | ------- | -------------------------------------------------- | -------------- | -------- |
| n    | `<S-n>` | `function() vim.wo.number = not vim.wo.number end` | 显示或隐藏行号 | 行号显示 |

