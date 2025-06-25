# NeoVim & LazyVim💤 

The Ultimate NeoVim Config for LiangNing7 Users

## 1. Neovim 简介

Neovim 从名称来看：新型的 vim。按照官方说明：nvim 是一个 vim 的 fork，主要关注了扩展性和易用性。大量的 vim 用户迁移到 nvim，而 vim 的魅力出了经典的快捷键还有丰富的插件系统，这些 nvim 都继承了下来，同时内置了 Lua 引擎和 LSP，增加了 异步 IO 等新特性。

> 1. 内置 Lua 引擎，比起 vim 脚本，Lua 更易读，而且功能也更强大；
> 2. 内置对 LSP 语言服务器协议的支持，LSP 是微软提出用在编辑器中集成代码补全、诊断等功能的协议；像是 vscode 的代码提示就是完全靠 LSP 实现的。

## 2. Neovim 安装

Neovim 提供了不同的安装方式，例如：通过包管理器安装、通过源码安装。这里选择更加通用的源码安装方式。

提前安装好 `cmake`、`make`、`gcc`。

1. **检查 `cmake`**

   ```bash
   $ cmake --version
   ```

   **已安装：**会显示版本信息，例如：

   ```
   cmake version 3.25.1
   
   CMake suite maintained and supported by Kitware (kitware.com/cmake).
   ```

   **未安装：**显示`command not found: cmake`。

   **解决办法：**

   * `Ubuntu/Debian`： `sudo apt install cmake`
   * `CentOS/RHEL`：`sudo yum install cmake`
   * `macOS`：`brew install cmake`

2. **检查 `make`**

   ```bash
   $ make --version
   ```

   **已安装：**会显示版本信息，例如：

   ```
   GNU Make 4.3
   Built for x86_64-pc-linux-gnu
   ```

   **未安装：**显示`command not found: make`。

   **解决办法：**

   * Ubuntu/Debian: `sudo apt install make`

   * CentOS/RHEL: `sudo yum install make`

   * macOS: 通常已预装，若缺失可通过 Xcode 命令行工具安装：

     ```bash
     xcode-select --install
     ```

3. **检查 `gcc`(C 编译器)**

   ```bash
   $ gcc --version
   ```

   **已安装：**会显示版本信息，例如：

   ```
   gcc (Debian 12.2.0-14) 12.2.0
   Copyright (C) 2022 Free Software Foundation, Inc.
   ```

   **未安装：**显示`command not found: gcc`。

   **解决办法：**

   * Ubuntu/Debian: 安装完整编译工具链：

     ```bash
     sudo apt install build-essential
     ```

     （包含 `gcc`、`g++`、`make` 等基础工具）

   * CentOS/RHEL: 

     ```bash
     sudo yum groupinstall "Development Tools"
     ```

   * macOS: 通过 Xcode 命令行工具安装：

     ```bash
     xcode-select --install
     ```

**下载 Neovim 源码并编译**：

```bash
$ git clone https://github.com/neovim/neovim /tmp/neovim 
$ cd /tmp/neovim 
$ make CMAKE_BUILD_TYPE=RelWithDebInfo # 提示：这里需要 cmake 工具正确安装
$ sudo make install
$ nvim --version
NVIM v0.12.0-dev-38+g99529577cc
Build type: RelWithDebInfo
LuaJIT 2.1.1741730670
Run "nvim -V1 -v" for more info
```

CMAKE_BUILD_TYPE 是 CMake 构建系统中用于指定编译模式的参数，以下是具体说明和典型应用场景：

1. `Debug` 模式：优化等级-O0，用于开发调试（可断点、变量检查）；
2. `Release` 模式：优化等级-O3，用于生产环境（最高性能）；
3. `RelWithDebInfo` 模式：优化等级-O2，用于生产调试（平衡性能与可调试性）；
4. `MinSizeRel` 模式：优化等级-Os，用于最小体积发布。

安装完之后，为了方便后面的使用，需要进行以下 bash 配置：

```bash
$ tee -a $HOME/.bashrc <<'EOF' 
# Edit env
alias vi='nvim' # 将 "vi" 命令别名指向 "nvim"（NeoVim）     
alias vim='nvim' # 将 "vim" 命令别名也指向 "nvim"   
# 设置默认命令行编辑器为 "nvim"
# 影响 git 等工具的行为：`git commit` 会使用此处设置的编辑器  
export EDITOR=nvim  
EOF
```

## 3. Neovim 配置

Neovim 安装简单，重点在 Neovim 配置。这里，先来看下 Neovim 是如何配置的。

Neovim 中配置可以通过 `init.vim` 或者 `init.lua` 进行配置，当前大部分的配置都采用了 lua，本文也将会通过 lua 进行配置 nvim。如果你还不会使用 lua 也不许需要担心，lua 可以快速上手。你可以直接进入 neovim  后通过 `:h lua-guide` 进行查看 lua 教程。

类似 oh-my-zsh 相对于zsh，Neovim 也有很多优秀的开箱即用配置项目帮你快速上手，例如以下四个（按Star数量排序）：[NvChad](https://nvchad.com/)、**[LazyVim](https://www.lazyvim.org/)**、[LunarVim](https://www.lunarvim.org/)、[AstroNvim](https://astronvim.com/)。

但 Neovim 的配置其实非常简单，你完全可以配置自己独一无二的 Neovim。自定义 Neovim 配置可以带来以下好处：

* 根据个人的喜好配置 Neovim，使用起来更顺手；
* 可以根据需要去处臃肿、不需要的配置，使整个 Neovim 的配置更加轻量级；
* 有助于学习如何配置 Neovim，未来使用的过程中，可以根据需要随时更改配置。例如：修改快捷键、设置一些配置项等；

Neovim 支持结构化的配置方式，其默认配置位于 ` $HOME/.config/nvim/` 目录中，遵守 [XDG规范](https://specifications.freedesktop.org/basedir-spec/latest/)。一般的配置结构如下【示例】：

```
# Neovim 配置目录结构解析（基于 LazyVim 风格）  
.  
├── init.lua             # 主入口文件，负责加载核心配置和插件管理器  
├── lazy-lock.json       # 插件版本锁定文件（由 Lazy.nvim 自动生成维护）  
├── LICENSE              # 许可证文件（若配置开源）  
├── lua/                 # Lua 配置模块目录（Neovim 标准配置结构）  
│   ├── configs/         # 基础功能配置模块  
│   │   ├── basic.lua    # 基础设置（行号/缩进/颜色等）  
│   │   ├── keymaps.lua  # 快捷键映射配置  
│   │   └── lazy.lua     # 插件管理器 Lazy.nvim 的配置  
│   └── plugins/         # 各插件独立配置文件  
│       ├── alpha.lua    # 启动页插件 (alpha-nvim)  
│       ├── autopairs.lua # 自动括号补全 (nvim-autopairs)  
│       ├── avante.lua   # AI 编程
│       ├── catppuccin.lua # Catppuccin 主题插件  
│       ├── cmp.lua       # 代码补全引擎 (nvim-cmp)  
│       ├── comment.lua  # 注释插件 (Comment.nvim)  
│       ├── conform.lua  # 代码格式化插件 (conform.nvim)  
│       ├── fzf.lua      # 模糊搜索插件 (fzf-lua)  
│       ├── gitsigns.lua # Git 状态标记 (gitsigns.nvim)  
│       ├── go-vim.lua   # Go 语言开发插件（如 go.nvim）  
│       ├── gruvbox.lua  # Gruvbox 主题插件  
│       ├── guess-indent.lua # 自动检测缩进插件  
│       ├── indent-blankline.lua # 缩进参考线插件  
│       ├── lsp.lua      # LSP 客户端核心配置  
│       ├── lualine.lua  # 状态栏插件 (lualine.nvim)  
│       ├── markdown.lua # Markdown 增强支持  
│       ├── neo-tree.lua # 文件树插件 (neo-tree.nvim)  
│       ├── notify.lua   # 通知系统插件 (nvim-notify)  
│       ├── root.lua     # 根目录检测插件（可能结合 LSP），可自动切换至根目录
│       ├── toggleterm.lua # 内嵌终端插件  
│       ├── tokyonight.lua # Tokyo Night 主题插件  
│       ├── treesitter.lua # 语法高亮 (nvim-treesitter)  
│       └── which-key.lua # 快捷键提示插件  
└── README.md            # 项目说明文档（配置说明/快捷键备忘等）  

# 备注：  
# 1. 此结构采用模块化设计，符合现代 NeoVim 配置最佳实践  
# 2. 插件配置分离到独立文件便于维护（如更新/禁用插件）  
# 3. 实际插件名可能与文件名略有差异（如 lsp.lua 可能对应 nvim-lspconfig）  
```

这些大致了解后，我们需要先进行一些依赖配置后，再对 NeoVim 进行配置。

### 安装依赖的插件

```bash
$ go install golang.org/x/tools/gopls@latest
$ go install golang.org/x/tools/cmd/goimports@latest
$ go install mvdan.cc/gofumpt@latest
$ sudo apt install fzf
$ sudo apt install nodejs
$ sudo apt install ripgrep fd-find
$ sudo apt install xclip imagemagick curl
$ git clone https://github.com/tree-sitter/tree-sitter.git /tmp/tree-sitter
$ cd /tmp/tree-sitter
$ make
$ sudo make install
```

### 配置 LazyVim

备份当前的 Neovim files：

```bash
# required
$ mv ~/.config/nvim{,.bak}

# optional but recommended
$ mv ~/.local/share/nvim{,.bak}
$ mv ~/.local/state/nvim{,.bak}
$ mv ~/.cache/nvim{,.bak}
```

克隆 `LiangNing7’s nvim`：

```bash
$ git clone https://github.com/LiangNing7/nvim ~/.config/nvim
```

删除 `.git` 文件夹，以便以后添加到自己的 repo 中：

```bash
$ rm -rf ~/.config/nvim/.git
```

然后开始使用 Neovim：

```bash
$ nvim
```

> tips:
>
> 第一次进入 neovim 可能需要加载很多插件，会有些慢，请耐心等待！
>
> 建议在安装后运行 `:checkhealth`。这将加载所有插件并检查一切工作是否正常。

### LazyVim 文档

快捷键参考文档：[docs](/docs/doc.md)

插件文件：[plugins](./docs/plugins/)
