# gitstatus 

> 源码位于：[gitstatus](../../lua/plugins/gitstatus.lua)

配置解释参考 [官方](https://github.com/lewis6991/gitsigns.nvim?tab=readme-ov-file#%EF%B8%8F-installation--usage) 

## mappings

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
