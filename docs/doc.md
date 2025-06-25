

# 普通快捷键映射

## 基础操作

| 模式 | 快捷键       | 命令                       | 描述            | 功能分类   |
| ---- | ------------ | -------------------------- | --------------- | ---------- |
| n    | `<leader>p`  | `:set invpaste paste?<CR>` | 切换 paste 模式 | 代码格式化 |
| n    | `<leader>tf` | `gg=G`                     | 格式化整个文件  | 代码格式化 |

## 窗口操作

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

## 文本移动

| 模式 | 快捷键  | 命令                  | 描述             | 功能分类 |
| ---- | ------- | --------------------- | ---------------- | -------- |
| v    | `<C-j>` | `:move '>+1<CR>gv-gv` | 选中文本下移一行 | 区块移动 |
| v    | `<C-k>` | `:move '<-2<CR>gv-gv` | 上移选中／当前行 | 区块移动 |

## insert 模式导航

| 模式 | 快捷键  | 命令     | 描述     | 功能分类 |
| ---- | ------- | -------- | -------- | -------- |
| i    | `<C-h>` | `<ESC>I` | 跳至行首 | 插入导航 |
| i    | `<C-l>` | `<ESC>A` | 跳至行尾 | 插入导航 |

## 清除与保存

| 模式       | 快捷键  | 命令          | 描述           | 功能分类 |
| ---------- | ------- | ------------- | -------------- | -------- |
| n          | `<ESC>` | `:nohlsearch` | 清除搜索高亮   | 搜索清理 |
| i, x, n, s | `<C-q>` | `:quit`       | 退出当前缓冲区 | 快速退出 |
| i, x, n, s | `<C-s>` | `:write`      | 保存当前文件   | 快速保存 |

## 其他

| 模式 | 快捷键  | 命令                                               | 描述           | 功能分类 |
| ---- | ------- | -------------------------------------------------- | -------------- | -------- |
| n    | `<S-n>` | `function() vim.wo.number = not vim.wo.number end` | 显示或隐藏行号 | 行号显示 |

# 插件快捷键映射

## blinkcmp 快捷键

| 模式    | 快捷键      | 命令                                                 | 描述                                              | 功能分类     |
| ------- | ----------- | ---------------------------------------------------- | ------------------------------------------------- | ------------ |
| c (cmd) | `<CR>`      | `select_and_accept` → `fallback`                     | 在 cmdline 模式下选中并接受候选，或回退到原生命令 | 补全选择     |
| i       | `<C-space>` | `show` → `show_documentation` → `hide_documentation` | 显示补全菜单并切换文档视图                        | 补全/文档    |
| i       | `<CR>`      | `select_and_accept` → `fallback`                     | 选中并接受当前候选                                | 补全选择     |
| i       | `<S-Tab>`   | `select_prev` → `snippet_backward` → `fallback`      | 上一个候选；无 snippet 时后退                     | 补全/Snippet |
| i       | `<Tab>`     | `select_next` → `snippet_forward` → `fallback`       | 下一个候选；无 snippet 时前进                     | 补全/Snippet |
| i       | `<C-b>`     | `scroll_documentation_up` → `fallback`               | 向上滚动文档                                      | 文档浏览     |
| i       | `<C-f>`     | `scroll_documentation_down` → `fallback`             | 向下滚动文档                                      | 文档浏览     |
| i       | `<C-e>`     | `snippet_forward` → `select_next` → `fallback`       | snippet 跳转优先，否则下一个候选                  | 补全/Snippet |
| i       | `<C-u>`     | `snippet_backward` → `select_prev` → `fallback`      | snippet 后退优先，否则上一个候选                  | 补全/Snippet |

## bufferline

| 模式 | 快捷键       | 命令                             | 描述                              | 功能分类    |
| ---- | ------------ | -------------------------------- | --------------------------------- | ----------- |
| n    | `<leader>b-` | `<cmd>bprevious<CR>`             | 切换到上一个 buffer               | Buffer 导航 |
| n    | `<leader>b=` | `<cmd>bnext<CR>`                 | 切换到下一个 buffer               | Buffer 导航 |
| n    | `<leader>bd` | `<cmd>bdelete<CR>`               | 关闭当前 buffer                   | Buffer 管理 |
| n    | `<leader>bo` | `<cmd>BufferLineCloseOthers<CR>` | 关闭其他 buffer                   | Buffer 管理 |
| n    | `<leader>bb` | `<cmd>b `                        | 模糊搜索并切换到指定名字的 buffer | Buffer 搜索 |

## comment

| 模式 | 快捷键      | 功能说明                    |
| ---- | ----------- | --------------------------- |
| n    | `<leader>/` | 注释 / 取消注释当前行       |
| v    | `<leader>/` | 注释 / 取消注释选中的所有行 |

## flash

| 模式       | 快捷键       | 命令                                                         | 描述                      |
| ---------- | ------------ | ------------------------------------------------------------ | ------------------------- |
| n, x, o    | `s`          | `require("flash").jump({ search = { multi_window = true } })` | 跨窗口使用 Flash 跳转     |
| n, x, o    | `S`          | `require("flash").treesitter()`                              | Treesitter 快捷跳转       |
| o          | `r`          | `require("flash").remote()`                                  | 远程 Flash                |
| o, x       | `R`          | `require("flash").treesitter_search()`                       | 基于 Treesitter 的搜索    |
| c          | `<C-s>`      | `require("flash").toggle()`                                  | 切换 Flash 搜索           |
| n, x, o    | `<leader>l`  | `require("flash").jump({ search = { mode = "search", max_lenghth = 0 }, label = { after = { 0, 0 } },pattern = "^", })` | 跳转行                    |
| n, x, o, c | `<leader>sf` | `require("flash").toggle()`                                  | ‘/’ or ‘?’ 是否启用 flash |

## fold

| 模式 | 快捷键 | 功能说明                         |
| ---- | ------ | -------------------------------- |
| n    | `za`   | 切换当前光标的折叠区域           |
| n    | `zr`   | 展开当前缓冲区中的所有折叠区域   |
| n    | `zm`   | 折叠当前缓冲区中的所有可折叠区域 |

## fzf

| Mode | Shortcut     | Command                                    | 描述                              |
| ---- | ------------ | ------------------------------------------ | --------------------------------- |
| n    | `<C-e>`      | `<cmd>FzfLua buffers<CR>`                  | 浏览并切换打开的缓冲区            |
| n    | `<C-f>`      | `<cmd>FzfLua lgrep_curbuf<CR>`             | 在当前缓冲区搜索                  |
| n    | `<leader>fp` | `<cmd>FzfLua live_grep<CR>`                | 在项目文件中实时搜索              |
| n    | `<leader>fo` | `<cmd>FzfLua oldfiles<CR>`                 | 打开最近使用的文件列表            |
| n    | `<leader>ts` | `<cmd>FzfLua treesitter<CR>`               | 使用 Treesitter 搜索符号          |
| n    | `<leader>sh` | `<cmd>FzfLua search_history<CR>`           | 搜索命令行历史                    |
| n    | `<leader>fm` | `<cmd>FzfLua marks<CR>`                    | 列出所有标记并跳转                |
| n    | `<leader>gp` | `<cmd>FzfLua git_commits<CR>`              | 浏览 Git 提交记录                 |
| n    | `<leader>gb` | `<cmd>FzfLua git_bcommits<CR>`             | 浏览当前缓冲区文件的 Git 提交记录 |
| n    | `<leader>gs` | `<cmd>FzfLua git_status<CR>`               | 显示 Git 状态和暂存更改           |
| n    | `<leader>fd` | `<cmd>FzfLua lsp_document_diagnostics<CR>` | 列出 LSP 诊断并跳转到问题         |

## gitstatus

| 模式  | 快捷键       | 执行命令                               | 描述                          |
| ----- | ------------ | -------------------------------------- | ----------------------------- |
| `n`   | `<leader>h=` | `gitsigns.nav_hunk('next')`            | 跳转到下一个改动 (hunk)       |
| `n`   | `<leader>h-` | `gitsigns.nav_hunk('prev')`            | 跳转到上一个改动 (hunk)       |
| `n`   | `<leader>hs` | `gitsigns.stage_hunk()`                | 暂存当前 hunk                 |
| `v`   | `<leader>hs` | `gitsigns.stage_hunk({range})`         | 暂存选中的 hunk               |
| `n`   | `<leader>hr` | `gitsigns.reset_hunk()`                | 重置当前 hunk                 |
| `v`   | `<leader>hr` | `gitsigns.reset_hunk({range})`         | 重置选中的 hunk               |
| `n`   | `<leader>hS` | `gitsigns.stage_buffer()`              | 暂存整个缓冲区                |
| `n`   | `<leader>hR` | `gitsigns.reset_buffer()`              | 重置整个缓冲区                |
| `n`   | `<leader>hp` | `gitsigns.preview_hunk()`              | 预览当前 hunk                 |
| `n`   | `<leader>hi` | `gitsigns.preview_hunk_inline()`       | 内联预览当前 hunk             |
| `n`   | `<leader>hb` | `gitsigns.blame_line({ full = true })` | 显示当前行 Blame 信息（详细） |
| `n`   | `<leader>hd` | `gitsigns.diffthis()`                  | 查看当前文件改动差异          |
| `n`   | `<leader>hD` | `gitsigns.diffthis('~')`               | 与上次提交的改动对比          |
| `n`   | `<leader>hQ` | `gitsigns.setqflist('all')`            | 所有 hunk 加入 quickfix       |
| `n`   | `<leader>hq` | `gitsigns.setqflist()`                 | 未暂存 hunk 加入 quickfix     |
| `n`   | `<leader>lb` | `gitsigns.toggle_current_line_blame()` | 切换当前行 Blame 显示         |
| `n`   | `<leader>wd` | `gitsigns.toggle_word_diff()`          | 切换 word diff 显示           |
| `o/x` | `ih`         | `gitsigns.select_hunk()`               | 选择当前 hunk（文本对象）     |

## go-vim

| 模式 | 快捷键       | 命令                                  | 描述                  | 功能分类   |
| ---- | ------------ | ------------------------------------- | --------------------- | ---------- |
| n    | `<leader>fe` | `:GoIfErr<CR>`                        | 填充错误处理          | Go 辅助    |
| n    | `<leader>fs` | `:GoFillStruct<CR>`                   | 生成 struct 填充      | Go 辅助    |
| n    | `<leader>fc` | `:GoFillSwitch<CR>`                   | 生成 switch 填充      | Go 辅助    |
| n    | `<leader>ta` | `:GoAddTag<CR>`                       | 添加 struct tag       | Go 辅助    |
| n    | `<leader>tr` | `:GoRmTag<CR>`                        | 删除指定的 struct tag | Go 辅助    |
| n    | `<leader>tc` | `:GoClearTag<CR>`                     | 清空 struct tag       | Go 辅助    |
| n    | `<leader>rn` | `vim.lsp.buf.rename()`                | 重命名符号            | LSP 重命名 |
| n    | `gd`         | `<cmd>FzfLua lsp_definitions<CR>`     | 跳转到定义            | LSP 导航   |
| n    | `gr`         | `<cmd>FzfLua lsp_references<CR>`      | 跳转到引用            | LSP 导航   |
| n    | `gi`         | `<cmd>FzfLua lsp_implementations<CR>` | 跳转到实现            | LSP 导航   |

## indentrainbow

| 模式 | 快捷键       | 执行命令         | 描述             |
| ---- | ------------ | ---------------- | ---------------- |
| `n`  | `<leader>ri` | `:IBLToggle<CR>` | 开关彩虹缩进显示 |

## LSP

| 模式 | 快捷键       | 命令                                     | 描述                       | 功能分类     |
| :--- | :----------- | :--------------------------------------- | :------------------------- | :----------- |
| n    | `K`          | `vim.lsp.buf.hover({border = "single"})` | 悬浮提示功能               | 文档查看     |
| n    | `<leader>aw` | `vim.lsp.buf.code_action()`              | 打开代码修复建议           | LSP 代码操作 |
| n    | `<leader>d`  | `vim.diagnostic.open_float()`            | 浮动窗口显示当前行诊断信息 | LSP 诊断     |
| n    | `<leader>-`  | `vim.diagnostic.goto_prev()`             | 跳转到上一个诊断位置       | LSP 诊断导航 |
| n    | `<leader>=`  | `vim.diagnostic.goto_next()`             | 跳转到下一个诊断位置       | LSP 诊断导航 |
| n    | `<leader>ih` | `:InlayHintsToggle<CR>`                  | 切换内联提示显示           | LSP 辅助功能 |

## multicursor

| 模式 | 快捷键           | 执行命令                            | 描述                                   |
| ---- | ---------------- | ----------------------------------- | -------------------------------------- |
| n/v  | `<C-Up>`         | `mc.lineAddCursor(-1)`              | 在上方添加一个新光标                   |
| n/v  | `<C-Down>`       | `mc.lineAddCursor(1)`               | 在下方添加一个新光标                   |
| n/v  | `<leader><Up>`   | `mc.lineSkipCursor(-1)`             | 跳过上方已有光标                       |
| n/v  | `<leader><Down>` | `mc.lineSkipCursor(1)`              | 跳过下方已有光标                       |
| n/v  | `<C-Left>`       | `mc.nextCursor`                     | 将主光标移动到下一个光标               |
| n/v  | `<C-Right>`      | `mc.prevCursor`                     | 将主光标移动到上一个光标               |
| n/v  | `<C-k>`          | `mc.matchAddCursor(1)`              | 匹配下一个单词并添加光标               |
| n/v  | `<leader>k`      | `mc.matchSkipCursor(1)`             | 跳过下一个匹配项                       |
| n/v  | `<C-S-k>`        | `mc.matchAddCursor(-1)`             | 匹配上一个单词并添加光标               |
| n/v  | `<leader>K`      | `mc.matchSkipCursor(-1)`            | 跳过上一个匹配项                       |
| n    | `<C-LeftMouse>`  | `mc.handleMouse`                    | Ctrl+左键点击添加/移除光标（GUI 支持） |
| n/v  | `<leader>m`      | `mc.toggleCursor`                   | 手动添加或删除当前光标                 |
| v    | `<leader>m`      | `mc.matchCursors`                   | 选区中匹配并添加多个光标               |
| n    | `<Esc>`          | `mc.enableCursors()/clearCursors()` | 启用/禁用多光标状态                    |

## neo-tree

### window

| 模式 |     快捷键      | 命令名                    | 描述（中文）                                | 功能分类    |
| ---- | :-------------: | ------------------------- | ------------------------------------------- | ----------- |
| n    |    `<space>`    | `toggle_node`             | 展开/收起目录节点                           | 导航/结构   |
| n    | `<2-LeftMouse>` | `open`                    | 双击打开文件                                | 打开        |
| n    |     `<CR>`      | `open`                    | 回车打开文件                                | 打开        |
| n    |     `<ESC>`     | `cancel`                  | 关闭预览或浮动窗口                          | UI操作      |
| n    |       `P`       | `toggle_preview`          | 切换预览模式（浮动）                        | 预览        |
| n    |       `l`       | `focus_preview`           | 聚焦预览窗口                                | 预览        |
| n    |       `S`       | `open_split`              | 横向分屏打开文件                            | 分屏        |
| n    |       `s`       | `open_vsplit`             | 纵向分屏打开文件                            | 分屏        |
| n    |       `t`       | `open_tabnew`             | 在新 tab 中打开文件                         | 打开        |
| n    |       `w`       | `open_with_window_picker` | 选择窗口打开文件                            | 打开        |
| n    |       `C`       | `close_node`              | 收起当前目录节点                            | 导航/结构   |
| n    |       `z`       | `close_all_nodes`         | 一次性关闭所有节点                          | 导航/结构   |
| n    |       `a`       | `add`                     | 添加文件（支持 brace expansion）            | 文件操作    |
| n    |       `A`       | `add_directory`           | 添加目录（支持 brace expansion）            | 文件操作    |
| n    |       `d`       | `delete`                  | 删除文件或目录                              | 文件操作    |
| n    |       `r`       | `rename`                  | 重命名（完整路径）                          | 文件操作    |
| n    |       `b`       | `rename_basename`         | 仅重命名文件名，不改路径                    | 文件操作    |
| n    |       `y`       | `copy_to_clipboard`       | 复制到剪贴板                                | 文件操作    |
| n    |       `x`       | `cut_to_clipboard`        | 剪切到剪贴板                                | 文件操作    |
| n    |       `p`       | `paste_from_clipboard`    | 从剪贴板粘贴                                | 文件操作    |
| n    |       `c`       | `copy`                    | 复制并输入目标路径                          | 文件操作    |
| n    |       `m`       | `move`                    | 移动文件/目录（可配置路径显示）             | 文件操作    |
| n    |       `q`       | `close_window`            | 关闭 Neo-tree 窗口                          | UI操作      |
| n    |       `R`       | `refresh`                 | 刷新文件树                                  | 状态更新    |
| n    |       `?`       | `show_help`               | 显示帮助菜单                                | 帮助        |
| n    |       `<`       | `prev_source`             | 切换到上一个 source（如 git/files/buffers） | source 切换 |
| n    |       `>`       | `next_source`             | 切换到下一个 source                         | source 切换 |
| n    |       `i`       | `show_file_details`       | 显示文件详细信息（创建、修改时间等）        | 文件信息    |

### filesystem

| 模式 | 快捷键  | 命令                     | 描述                                           | 功能分类      |
| ---- | ------- | ------------------------ | ---------------------------------------------- | ------------- |
| n    | `<bs>`  | `navigate_up`            | 切换到父目录                                   | 导航          |
| n    | `.`     | `set_root`               | 将当前目录设为根                               | 导航          |
| n    | `H`     | `toggle_hidden`          | 切换显示/隐藏过滤项（dotfiles、gitignored 等） | 视图          |
| n    | `/`     | `fuzzy_finder`           | 弹出模糊查找窗口（全路径搜索）                 | 查找          |
| n    | `D`     | `fuzzy_finder_directory` | 仅在当前目录内模糊查找                         | 查找          |
| n    | `#`     | `fuzzy_sorter`           | 弹出排序选择（使用 fzy 算法）                  | 排序          |
| n    | `f`     | `filter_on_submit`       | 跳出输入框，按回车后根据输入过滤文件           | 过滤          |
| n    | `<C-x>` | `clear_filter`           | 清除当前过滤条件                               | 过滤          |
| n    | `[g`    | `prev_git_modified`      | 跳到上一个 Git 修改的文件                      | Git 集成/导航 |
| n    | `]g`    | `next_git_modified`      | 跳到下一个 Git 修改的文件                      | Git 集成/导航 |
| n    | `o`     | `show_help`              | 显示“Order by”子菜单，并等待后续按键           | 帮助/子命令   |
| n    | `oc`    | `order_by_created`       | 按创建时间排序                                 | 排序          |
| n    | `od`    | `order_by_diagnostics`   | 按诊断（LSP Warning/Error）排序                | 排序          |
| n    | `og`    | `order_by_git_status`    | 按 Git 状态排序                                | 排序          |
| n    | `om`    | `order_by_modified`      | 按最后修改时间排序                             | 排序          |
| n    | `on`    | `order_by_name`          | 按文件名排序                                   | 排序          |
| n    | `os`    | `order_by_size`          | 按文件大小排序                                 | 排序          |
| n    | `ot`    | `order_by_type`          | 按文件类型排序                                 | 排序          |

### buffer

| 模式 | 快捷键  | 命令                     | 描述                                           | 功能分类      |
| ---- | ------- | ------------------------ | ---------------------------------------------- | ------------- |
| n    | `<bs>`  | `navigate_up`            | 切换到父目录                                   | 导航          |
| n    | `.`     | `set_root`               | 将当前目录设为根                               | 导航          |
| n    | `H`     | `toggle_hidden`          | 切换显示/隐藏过滤项（dotfiles、gitignored 等） | 视图          |
| n    | `/`     | `fuzzy_finder`           | 弹出模糊查找窗口（全路径搜索）                 | 查找          |
| n    | `D`     | `fuzzy_finder_directory` | 仅在当前目录内模糊查找                         | 查找          |
| n    | `#`     | `fuzzy_sorter`           | 弹出排序选择（使用 fzy 算法）                  | 排序          |
| n    | `f`     | `filter_on_submit`       | 跳出输入框，按回车后根据输入过滤文件           | 过滤          |
| n    | `<C-x>` | `clear_filter`           | 清除当前过滤条件                               | 过滤          |
| n    | `[g`    | `prev_git_modified`      | 跳到上一个 Git 修改的文件                      | Git 集成/导航 |
| n    | `]g`    | `next_git_modified`      | 跳到下一个 Git 修改的文件                      | Git 集成/导航 |
| n    | `o`     | `show_help`              | 显示“Order by”子菜单，并等待后续按键           | 帮助/子命令   |
| n    | `oc`    | `order_by_created`       | 按创建时间排序                                 | 排序          |
| n    | `od`    | `order_by_diagnostics`   | 按诊断（LSP Warning/Error）排序                | 排序          |
| n    | `og`    | `order_by_git_status`    | 按 Git 状态排序                                | 排序          |
| n    | `om`    | `order_by_modified`      | 按最后修改时间排序                             | 排序          |
| n    | `on`    | `order_by_name`          | 按文件名排序                                   | 排序          |
| n    | `os`    | `order_by_size`          | 按文件大小排序                                 | 排序          |
| n    | `ot`    | `order_by_type`          | 按文件类型排序                                 | 排序          |

### git 

| 模式 | 快捷键 | 命令                   | 描述                                 | 功能分类    |
| ---- | ------ | ---------------------- | ------------------------------------ | ----------- |
| n    | `A`    | `git_add_all`          | 将所有更改的文件加入暂存区           | Git 操作    |
| n    | `gu`   | `git_unstage_file`     | 将当前文件从暂存区移除               | Git 操作    |
| n    | `ga`   | `git_add_file`         | 将当前文件加入暂存区                 | Git 操作    |
| n    | `gr`   | `git_revert_file`      | 恢复当前文件到上一次提交状态         | Git 操作    |
| n    | `gc`   | `git_commit`           | 弹出提交消息输入（commit）           | Git 操作    |
| n    | `gp`   | `git_push`             | 推送本地提交到远程                   | Git 操作    |
| n    | `gg`   | `git_commit_and_push`  | 先提交再推送                         | Git 操作    |
| n    | `o`    | `show_help`            | 显示排序子菜单（Order by），等待输入 | 帮助/子命令 |
| n    | `oc`   | `order_by_created`     | 按创建时间排序                       | 排序        |
| n    | `od`   | `order_by_diagnostics` | 按诊断警告/错误数排序                | 排序        |
| n    | `om`   | `order_by_modified`    | 按最后修改时间排序                   | 排序        |
| n    | `on`   | `order_by_name`        | 按文件名排序                         | 排序        |
| n    | `os`   | `order_by_size`        | 按文件大小排序                       | 排序        |
| n    | `ot`   | `order_by_type`        | 按文件类型排序                       | 排序        |

### 自定义

| 模式 | 快捷键       | 命令                          | 描述                                     |
| ---- | ------------ | ----------------------------- | ---------------------------------------- |
| n    | `<leader>e`  | `<Cmd>Neotree toggle<CR>`     | 切换文件资源管理器（打开/关闭 Neo-tree） |
| n    | `<leader>rf` | `<Cmd>Neotree reveal<CR>`     | 在资源管理器中定位并展开当前文件         |
| n    | `<leader>gs` | `<Cmd>Neotree git_status<CR>` | 打开 Git 状态视图                        |
| n    | `<leader>tb` | `<Cmd>Neotree buffers<CR>`    | 打开 Buffers 视图                        |

## outline

### 编辑模式

| 模式 | 快捷键       | 执行命令                                            | 描述                    |
| :--- | :----------- | :-------------------------------------------------- | :---------------------- |
| n    | `<leader>v`  | `<cmd>Outline<CR>`                                  | 切换大纲面板            |
| n    | `<leader>of` | `function() require("outline").focus_outline() end` | 编辑窗口 `-->` 大纲窗口 |

### outline 内部mappings

| 模式 | 快捷键      | 执行命令                                | 描述                           |
| ---- | ----------- | --------------------------------------- | ------------------------------ |
| n    | `<leader>v` | `<cmd>Outline<CR>`                      | 切换大纲面板                   |
| n    | `?`         | `require("outline").show_help()`        | 显示帮助                       |
| n    | `<Esc>`     | `require("outline").close()`            | 关闭大纲窗口                   |
| n    | `q`         | `require("outline").close()`            | 关闭大纲窗口                   |
| n    | `<CR>`      | `require("outline").goto_location()`    | 跳转到光标下符号位置           |
| n    | `o`         | `require("outline").peek_location()`    | 跳转到符号并保持在大纲窗口     |
| n    | `<S-CR>`    | `require("outline").goto_and_close()`   | 跳转到符号并关闭大纲           |
| n    | `<C-g>`     | `require("outline").restore_location()` | 同步大纲窗口光标到当前代码位置 |
| n    | `<C-space>` | `require("outline").hover_symbol()`     | 悬停显示符号信息               |
| n    | `K`         | `require("outline").toggle_preview()`   | 切换代码预览                   |
| n    | `r`         | `require("outline").rename_symbol()`    | 重命名符号                     |
| n    | `a`         | `require("outline").code_actions()`     | 触发代码操作（Code Action）    |
| n    | `n`         | `require("outline").fold()`             | 折叠当前节点                   |
| n    | `i`         | `require("outline").unfold()`           | 展开当前节点                   |
| n    | `<Tab>`     | `require("outline").fold_toggle()`      | 切换当前节点折叠/展开          |
| n    | `<S-Tab>`   | `require("outline").fold_toggle_all()`  | 全部折叠/展开切换              |
| n    | `N`         | `require("outline").fold_all()`         | 折叠所有节点                   |
| n    | `I`         | `require("outline").unfold_all()`       | 展开所有节点                   |
| n    | `R`         | `require("outline").fold_reset()`       | 重置所有折叠状态               |

## surround

| 模式 | 快捷键       | 执行命令                        | 描述                       |
| ---- | ------------ | ------------------------------- | -------------------------- |
| n/v  | `<leader>sr` | `MiniSurround.add()`            | 添加包围符                 |
| n    | `<leader>sd` | `MiniSurround.delete()`         | 删除包围符                 |
| n    | `<leader>sf` | `MiniSurround.find()`           | 向右查找最近的包围符       |
| n    | `<leader>sF` | `MiniSurround.find_left()`      | 向左查找最近的包围符       |
| n    | `<leader>sh` | `MiniSurround.highlight()`      | 高亮光标处所在的包围范围   |
| n    | `<leader>cs` | `MiniSurround.replace()`        | 替换包围符                 |
| n    | `<leader>sn` | `MiniSurround.update_n_lines()` | 更新查找包围符时的行数范围 |

## toggleterm

| 模式 | 快捷键  | 执行命令     | 描述              |
| ---- | ------- | ------------ | ----------------- |
| n, i | `<C-\>` | `ToggleTerm` | 打开/关闭终端窗口 |

## winbar

## normal

| 模式     | 快捷键      | 执行命令                                       | 描述                              |
| -------- | ----------- | ---------------------------------------------- | --------------------------------- |
| 普通模式 | `<Leader>;` | `require("dropbar.api").pick()`                | 打开 Dropbar 菜单，选择当前上下文 |
| 普通模式 | `[c`        | `require("dropbar.api").goto_context_start()`  | 跳转到当前上下文的起始位置        |
| 普通模式 | `]c`        | `require("dropbar.api").select_next_context()` | 选择下一个上下文                  |

### 菜单

| 模式     | 快捷键        | 执行命令                     | 描述                             |
| -------- | ------------- | ---------------------------- | -------------------------------- |
| 菜单模式 | `<LeftMouse>` | 内部处理函数（点击菜单组件） | 用鼠标左键点击菜单项             |
| 菜单模式 | `<CR>`        | `confirm()`                  | 确认当前选中组件                 |
| 菜单模式 | `i`           | `confirm()`                  | 同上，用 `i` 键确认              |
| 菜单模式 | `<esc>`       | `<C-w>q`                     | 关闭菜单                         |
| 菜单模式 | `q`           | `<C-w>q`                     | 关闭菜单                         |
| 菜单模式 | `n`           | `<C-w>q`                     | 关闭菜单                         |
| 菜单模式 | `<MouseMove>` | 内部处理函数（更新高亮）     | 鼠标移动时更新当前悬停组件的高亮 |
