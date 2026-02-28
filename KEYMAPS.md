# Neovim 快捷键清单

## 📋 快捷键分类总览

### 🔧 基础编辑 (lua/config/keymaps.lua)

#### 寄存器操作（不影响默认寄存器）
| 快捷键 | 模式 | 功能 |
|--------|------|------|
| `x` | Normal | 删除字符（不保存到寄存器）|
| `<leader>p` | Normal/Visual | 粘贴 0 寄存器内容 |
| `<leader>P` | Normal | 粘贴 0 寄存器内容（行前）|
| `<leader>c` | Normal/Visual | 修改（不保存到寄存器）|
| `<leader>C` | Normal/Visual | 修改到行尾（不保存）|
| `<leader>d` | Normal/Visual | 删除（不保存到寄存器）|
| `<leader>D` | Normal/Visual | 删除到行尾（不保存）|

#### 数字和行操作
| 快捷键 | 模式 | 功能 |
|--------|------|------|
| `+` | Normal | 数字递增 |
| `-` | Normal | 数字递减 |
| `<C-a>` | Normal | dial.nvim 智能递增 |
| `<C-x>` | Normal | dial.nvim 智能递减 |
| `dw` | Normal | 向后删除单词 |
| `<leader>sa` | Normal | 全选 |
| `<leader>o` | Normal | 下方插入空行 |
| `<leader>O` | Normal | 上方插入空行 |

#### 快速操作
| 快捷键 | 模式 | 功能 |
|--------|------|------|
| `<C-q>` | Normal | 快速退出 |
| `<C-s>` | Normal/Insert | 快速保存 |

---

### 🪟 窗口和标签 (lua/config/keymaps.lua)

#### Tab 管理
| 快捷键 | 功能 |
|--------|------|
| `te` | 新建 tab |
| `<Tab>` | 下一个 buffer (bufferline) |
| `<S-Tab>` | 上一个 buffer (bufferline) |

#### 窗口分割
| 快捷键 | 功能 |
|--------|------|
| `ss` | 水平分割 |
| `sv` | 垂直分割 |

#### 窗口导航
| 快捷键 | 功能 |
|--------|------|
| `sh` | 移到左边窗口 |
| `sj` | 移到下边窗口 |
| `sk` | 移到上边窗口 |
| `sl` | 移到右边窗口 |

#### 窗口大小调整
| 快捷键 | 功能 |
|--------|------|
| `<C-w><left>` | 缩小宽度 |
| `<C-w><right>` | 增加宽度 |
| `<C-w><up>` | 增加高度 |
| `<C-w><down>` | 减少高度 |

---

### 🔍 搜索和导航 (lua/plugins/editor.lua)

#### 内容搜索（Telescope）
| 快捷键 | 功能 | 范围 |
|--------|------|------|
| `<leader>fp` | 项目内容搜索 | 整个项目 |
| `<leader>fb` | 目录内容搜索 | 当前目录 |
| `<leader>ff` | 文件内容搜索 | 当前文件 |

#### 文件查找
| 快捷键 | 功能 |
|--------|------|
| `;f` | 查找文件（当前工作目录）|
| `<leader>fP` | 查找插件文件 |
| `<leader>fG` | Go 标准库源码 |

#### 其他 Telescope 功能
| 快捷键 | 功能 |
|--------|------|
| `\\` | Buffer 列表 |
| `;t` | 帮助文档搜索 |
| `;;` | 恢复上次搜索 |
| `;e` | LSP 诊断 |
| `;s` | Treesitter 符号 |
| `;c` | LSP 调用层次 |
| `sf` | 文件浏览器 |

#### 快速跳转（Flash）
| 快捷键 | 模式 | 功能 |
|--------|------|------|
| `<leader>j` | Normal/Visual/Operator | 快速跳转到任意位置 |
| `<leader>J` | Normal/Visual/Operator | Treesitter 节点跳转 |

---

### 💻 LSP 功能 (lua/plugins/lsp.lua)

#### 基础导航
| 快捷键 | 功能 |
|--------|------|
| `gd` | 跳转到定义 (Telescope) |
| `gr` | 查看引用 |
| `gR` | 异步查看引用 |
| `gD` | 跳转到声明 |
| `gi` | 跳转到实现 |
| `gp` | 定义预览 |
| `g0` | 文档符号 |
| `gW` | 工作区符号搜索 |
| `<Space>D` | 类型定义 |

#### 代码操作
| 快捷键 | 模式 | 功能 |
|--------|------|------|
| `<leader>ca` | Normal/Visual | 代码操作 |
| `<leader>rn` | Normal | 重命名 |
| `<leader>cf` | Normal/Visual | 格式化代码 |
| `<Space>ff` | Normal/Visual | LSP 格式化 |
| `<leader>lr` | Normal | LSP 重启 |

#### 诊断
| 快捷键 | 功能 |
|--------|------|
| `<C-j>` | 下一个诊断 |
| `]d` | 下一个诊断 |
| `[d` | 上一个诊断 |
| `gL` | 显示所有诊断 |
| `gG` | 显示当前 buffer 诊断 |
| `<leader>dt` | 切换诊断显示 |

#### 其他
| 快捷键 | 功能 |
|--------|------|
| `<leader>i` | 切换 Inlay Hints |
| `<leader>r` | 替换 Hex 为 HSL |
| `<M-k>` (Insert) | 签名帮助 |
| `<leader>k` | 高亮当前符号 |

---

### 🐛 调试 (lua/plugins/dap.lua)

| 快捷键 | 功能 |
|--------|------|
| `<leader>db` | 切换断点 |
| `<leader>dc` | 继续/开始调试 |
| `<leader>di` | 步入 |
| `<leader>do` | 步过 |
| `<leader>dO` | 步出 |
| `<leader>dr` | 切换 REPL |
| `<leader>dl` | 运行上次调试 |
| `<leader>dt` | 终止调试 |
| `<leader>du` | 切换调试 UI |

---

### 🐹 Go 开发 (after/ftplugin/go.lua)

**注意**: 这些快捷键只在 Go 文件中生效

#### 运行和构建
| 快捷键 | 功能 |
|--------|------|
| `<leader>Gr` | 运行 |
| `<leader>Gb` | 构建 |

#### 测试
| 快捷键 | 功能 |
|--------|------|
| `<leader>Gt` | 测试当前函数 |
| `<leader>GT` | 测试当前文件 |
| `<leader>Gp` | 测试当前包 |
| `<leader>Ga` | 添加测试 |

#### 覆盖率
| 快捷键 | 功能 |
|--------|------|
| `<leader>GC` | 显示覆盖率 |
| `<leader>Gc` | 切换覆盖率显示 |

#### 代码生成
| 快捷键 | 功能 |
|--------|------|
| `<leader>Gf` | 填充结构体 |
| `<leader>Gi` | 实现接口 |
| `<leader>Gg` | 添加标签 |
| `<leader>Ge` | 生成 if err |
| `<leader>GR` | 生成 return |
| `<leader>Gm` | 生成注释 |

#### 格式化和文档
| 快捷键 | 功能 |
|--------|------|
| `<leader>Gd` | 查看文档 |
| `<leader>GF` | 格式化 |
| `<leader>GI` | 添加导入 |
| `<leader>GL` | 切换 Inlay Hints |
| `<leader>Gl` | 运行 Lint |

#### 调试
| 快捷键 | 功能 |
|--------|------|
| `<leader>GD` | 调试测试 |
| `<leader>Gx` | 切换断点 |
| `<leader>Gs` (Visual) | 更改函数签名 |

---

### 📂 Buffer 和文件管理

| 快捷键 | 功能 |
|--------|------|
| `<leader>bh` | 关闭隐藏的 buffer |
| `<leader>bu` | 关闭未命名的 buffer |

---

### 🔀 Git (lua/plugins/editor.lua)

| 快捷键 | 功能 |
|--------|------|
| `<leader>gb` | Git blame |
| `<leader>go` | 在浏览器打开 |
| `<leader>gd` | 打开 Diffview |
| `<leader>gc` | 关闭 Diffview |
| `<leader>gh` | 文件历史 |
| `<leader>gH` | 当前文件历史 |

---

### 💻 终端 (lua/plugins/editor.lua)

#### 打开终端
| 快捷键 | 功能 |
|--------|------|
| `<C-\>` | 切换浮动终端 |
| `<leader>tf` | 浮动终端 |
| `<leader>th` | 水平终端 |
| `<leader>tv` | 垂直终端 |

#### 终端内快捷键
| 快捷键 | 功能 |
|--------|------|
| `<Esc>` 或 `jk` | 退出终端模式 |
| `<C-h/j/k/l>` | 窗口导航 |
| `<C-w>` | 窗口命令前缀 |
| `<C-\>` | 关闭终端 |

---

### 🎨 UI 和其他

| 快捷键 | 功能 |
|--------|------|
| `<leader>z` | Zen Mode |
| `<C-m>` | 跳转列表前进 |

---

## ✅ 已解决的冲突

1. **`<C-a>` 冲突** - 保留 dial.nvim，全选改为 `<leader>sa`
2. **`<Tab>` 冲突** - 保留 bufferline，移除 tab 导航

---

## 💡 使用提示

### Leader 键分组
- `<leader>f*` - Find/搜索相关
- `<leader>g*` - Git 相关
- `<leader>d*` - Debug 相关
- `<leader>b*` - Buffer 相关
- `<leader>t*` - Terminal/Toggle 相关
- `<leader>l*` - LSP 相关
- `<leader>G*` - Go 开发（仅 Go 文件）
- `<leader>c*` - Code 相关

### 快速记忆
- 所有搜索都以 `<leader>f` 或 `;` 开头
- 所有 Go 命令都以 `<leader>G` 开头（大写 G）
- 调试都以 `<leader>d` 开头
- 终端都以 `<leader>t` 开头

---

**最后更新**: $(date)
**配置版本**: LazyVim + ray-x 增强
