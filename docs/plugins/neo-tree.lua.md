# neo-tree

> 源码位于：[neo-tree](../../lua/plugins/neo-tree.lua)

## 1. 第一个插件

```lua
return {
  -- If you want neo-tree's file operations to work with LSP (updating imports, etc.), you can use a plugin like
  -- https://github.com/antosha417/nvim-lsp-file-operations:
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim",
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },
    ... -- 其他配置
}
```

* 使用的第一个插件：`nvim-lsp-file-operations`，通过 LSP 实现文件操作时（例如重命名、移动），同步更新引用（import 路径）等。
* **dependencies**：列出了此插件运行所必需的其他库：
  * `plenary.nvim`：一套通用的 Lua 辅助函数。
  * `neo-tree.nvim`：核心文件树插件，确保文件操作能正确反映到树视图中。
* **config**：在插件加载后执行。`require("lsp-file-operations").setup()` 会初始化该插件默认行为。

## 2. 第二个插件

```lua
{
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = { … },
  lazy = false,
  -- …
}
```

* `neo-tree.nvim`：核心插件；
  * **branch = "v3.x"**：指定使用 `v3.x` 分支的新特性或 API，避免跟主分支不兼容。
  * **dependencies**：
    * `plenary.nvim`：同上。
    * `nvim-web-devicons`：提供文件图标显示（可选但推荐）。
    * `nui.nvim`：构建 Neovim 原生 UI 组件的库，neo-tree 的界面元素依赖它。
    * 可选的 `image.nvim`：在预览窗口中支持图像渲染。
    * **嵌套依赖** `nvim-window-picker`。
  * `lazy = false`：指示这个插件在启动时就加载（而非按需延迟加载），因为文件树通常是常用的核心功能。

```lua
{
  "s1n7ax/nvim-window-picker",
  version = "2.*",
  config = function()
    require("window-picker").setup({
      filter_rules = {
        include_current_win = false,
        autoselect_one = true,
        bo = {
          filetype = { "neo-tree", "neo-tree-popup", "notify" },
          buftype  = { "terminal", "quickfix" },
        },
      },
    })
  end,
},
```

* `nvim-window-picker`：
  * **用途**：在多个窗口（split/tab）时，提供一个交互式窗口选择界面，配合 neo-tree 的 `open_with_window_picker` 功能用于打开文件到指定窗口。
  * **version = "2.\*"**：使用 `2.x` 的稳定版本。
  * **filter_rules**：过滤不作为目标的窗口：
    * `include_current_win = false`：不把当前 neo-tree 窗口列入选择列表。
    * `autoselect_one = true`：如果只剩一个符合条件的目标，自动选中。
    * `bo.filetype` / `bo.buftype`：根据 buffer 的类型过滤，比如忽略 terminal、quickfix、neo-tree 自己的弹窗等。

## 3. neo-tree 配置

```lua
config = function()
  require("neo-tree").setup({
    close_if_last_window = false,    -- 如果 Neo-tree 是标签页中最后一个窗口，是否自动关闭
    popup_border_style = "rounded",  -- 弹出窗口的边框样式
    enable_git_status = true,        -- 是否显示 Git 状态（新增、修改、删除等）
    enable_diagnostics = true,       -- 是否显示 LSP 的诊断（错误、警告、提示等）
    open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
                                     -- 打开文件时，不使用包含这些 filetype/buftype 的窗口
    open_files_using_relative_paths = false,
                                     -- 是否用相对路径打开文件（相对于工作目录）
    sort_case_insensitive = false,   -- 排序时是否忽略大小写
    sort_function = nil,             -- 自定义排序函数（默认 nil 使用内置排序）
    ...
}
```

## 4. default 模块配置

```lua
default_component_configs = {
  container = {
      ...
  },
  indent = {
      ...
  },
  icon = {
      ...      
  }
  ...
},
```

### container

```lua
container = {
  enable_character_fade = true,
},
```

* 控制容器（container）内文本的渐隐效果。当文件名过长超过可视区域时，开启字符渐隐可以让两端内容有更自然的衔接。
* `enable_character_fade`：开启后，超出的字符会自动淡出显示，提升视觉美观。

### indent

```lua
indent = {
    indent_size = 2,
    padding = 1, -- extra padding on left hand side
    -- indent guides
    with_markers = true,
    indent_marker = "│",
    last_indent_marker = "└",
    highlight = "NeoTreeIndentMarker",
    -- expander config, needed for nesting files
    with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
    expander_collapsed = "",
    expander_expanded = "",
    expander_highlight = "NeoTreeExpander",
},
```

* **indent_size**：每级缩进使用的空格数，默认 2 个。
* **padding**：在最左侧额外插入的空白列数，用于让内容和窗口左边缘保持距离。
* **with_markers**：启用后在缩进处绘制竖线，用于可视化文件树层级。
* **indent_marker** / **last_indent_marker**：分别表示一般层级线和最后一条分支线的字符。
* **highlight**：指定缩进线的高亮组。
* **with_expanders**：如果设置为 `true`，就会在有子节点的行前显示可折叠图标；若为 `nil` 则根据节点是否嵌套动态决定。
* **expander_collapsed** / **expander_expanded**：折叠和展开状态下的图标。
* **expander_highlight**：折叠/展开图标的高亮组。

### icon

```lua
icon = {
    folder_closed = "",
    folder_open = "",
    folder_empty = "",
    provider = function(icon, node, state) -- default icon provider utilizes nvim-web-devicons if available
        if node.type == "file" or node.type == "terminal" then
            local success, web_devicons = pcall(require, "nvim-web-devicons")
            local name = node.type == "terminal" and "terminal" or node.name
            if success then
                local devicon, hl = web_devicons.get_icon(name)
                icon.text = devicon or icon.text
                icon.highlight = hl or icon.highlight
            end
        end
    end,
    -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
    -- then these will never be used.
    default = "*",
    highlight = "NeoTreeFileIcon",
},
```

* **folder_closed / folder_open / folder_empty**：分别对应关闭、打开、空文件夹的默认图标。
* **provider**：一个 Lua 函数，用于动态为文件或终端节点加载 [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) 图标：
* 1. 通过 `pcall` 安全加载插件。
  2. 根据节点类型选择名称（terminal 节点统一用 `"terminal"`）。
  3. 如果成功获取到图标，用之替换默认 `icon.text`，并应用相应高亮。
* **default**：当 `provider` 没有找到图标时的 fallback 字符。
* **highlight**：图标所在列的高亮组。

### modified

```lua
modified = {
  symbol    = "[+]",
  highlight = "NeoTreeModified",
},
```

* **symbol**：文件被修改时在文件名后显示的标记。
* **highlight**：修改标记的高亮组。

### name

```lua
name = {
  trailing_slash        = false,
  use_git_status_colors = true,
  highlight             = "NeoTreeFileName",
},
```

* **trailing_slash**：是否在文件夹名称后加上斜杠（`/`）。
* **use_git_status_colors**：启用后，根据 Git 状态（新增、修改、冲突等）改变文件名的前景色。
* **highlight**：文件名文本的高亮组。

### git_status

```lua
git_status = {
  symbols = {
    added     = "",
    modified  = "",
    deleted   = "✖",
    renamed   = "",
    untracked = "",
    ignored   = "",
    unstaged  = "",
    staged    = "",
    conflict  = "",
  },
},
```

**symbols**：不同 Git 状态对应的图标。

* `added`、`modified` 这里留空，表示只用颜色或默认处理；
* 其他如 `deleted`（删除）、`renamed`（重命名）、`untracked`（未跟踪）、`conflict`（冲突）等都有各自符号。

### file_size

```lua
file_size = {
  enabled        = true,
  width          = 12,   -- 列宽
  required_width = 64,   -- 窗口最小宽度
},
```

* **enabled**：是否在列表中显示文件大小列。
* **width**：该列的字符宽度。
* **required_width**：只有当 Neo-tree 窗口宽度 ≥ 此值时才会渲染该列。

### type

```lua
type = {
  enabled        = true,
  width          = 10,
  required_width = 122,
},
```

* 与 `file_size` 类似，显示文件类型（后缀或 MIME），并设置列宽与最小窗口宽度条件。

### last_modified

```lua
last_modified = {
  enabled        = true,
  width          = 20,
  required_width = 88,
},
```

* 显示『最后修改时间』列。字段含义同上。

### created

```lua
created = {
  enabled        = true,
  width          = 20,
  required_width = 110,
},
```

* 显示『创建时间』列。字段含义同上。

### symlink_target

```lua
symlink_target = {
  enabled        = false,
},
```

* **enabled**：是否在符号链接（symlink）节点下显示其目标路径。默认关闭。

## 5. window 模块配置

```lua
window = {
    position = "left",
    width = 40,
    mapping_options = {
        noremap = true,
        nowait = true,
    },
    mappings = {
        ["<space>"] = {
            "toggle_node",
            nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
        },
        ["<2-LeftMouse>"] = "open",
        ["<cr>"] = "open",
        ["<esc>"] = "cancel", -- close preview or floating neo-tree window
        ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
        -- Read `# Preview Mode` for more information
        ["l"] = "focus_preview",
        ["S"] = "open_split",
        ["s"] = "open_vsplit",
        -- ["S"] = "split_with_window_picker",
        -- ["s"] = "vsplit_with_window_picker",
        ["t"] = "open_tabnew",
        -- ["<cr>"] = "open_drop",
        -- ["t"] = "open_tab_drop",
        ["w"] = "open_with_window_picker",
        --["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
        ["C"] = "close_node",
        -- ['C'] = 'close_all_subnodes',
        ["z"] = "close_all_nodes",
        --["Z"] = "expand_all_nodes",
        ["a"] = {
            "add",
            -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
            -- some commands may take optional config options, see `:h neo-tree-mappings` for details
            config = {
                show_path = "none", -- "none", "relative", "absolute"
            },
        },
        ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
        ["d"] = "delete",
        ["r"] = "rename",
        ["b"] = "rename_basename",
        ["y"] = "copy_to_clipboard",
        ["x"] = "cut_to_clipboard",
        ["p"] = "paste_from_clipboard",
        ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
        -- ["c"] = {
        --  "copy",
        --  config = {
        --    show_path = "none" -- "none", "relative", "absolute"
        --  }
        --}
        ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
        ["q"] = "close_window",
        ["R"] = "refresh",
        ["?"] = "show_help",
        ["<"] = "prev_source",
        [">"] = "next_source",
        ["i"] = "show_file_details",
        -- ["i"] = {
        --   "show_file_details",
        --   -- format strings of the timestamps shown for date created and last modified (see `:h os.date()`)
        --   -- both options accept a string or a function that takes in the date in seconds and returns a string to display
        --   -- config = {
        --   --   created_format = "%Y-%m-%d %I:%M %p",
        --   --   modified_format = "relative", -- equivalent to the line below
        --   --   modified_format = function(seconds) return require('neo-tree.utils').relative_date(seconds) end
        --   -- }
        -- },
    },
},
```

### 源码结构

```lua
window = {
  position = "left",
  width = 40,
  mapping_options = {
    noremap = true,
    nowait = true,
  },
  mappings = {
    -- 映射列表
  },
},
```

* `position`：控制 Neo-tree 窗口出现的位置、可选值：`"left"`、`"right"`、`"top"`、`"bottom"`。
* `width`：指定 Neo-tree 窗口的宽度（字符数）。默认使用 40 个字符宽。
* `mapping-options`：设置所有映射键的通用选项，等同于 `vim.keymap.set()` 的参数。
  * `noremap = true`：表示非递归映射，防止出现重复绑定。
  * `nowait = true`：映射立即触发，而不会等待进一步的组合键（如果你绑定了 `<space>` 开头的快捷键，这个要小心）。

* 快捷键的 mappings 如下：

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

## 6. filesystem 模块配置

### filtered_items

```lua
filtered_items = {
    visible = false,          -- 是否显示被过滤的项目（以不同样式区分）
    hide_dotfiles = false,    -- 隐藏以 “.” 开头的文件
    hide_gitignored = true,   -- 隐藏被 Git 忽略的文件
    hide_hidden = true,       -- 隐藏“隐藏”属性的文件（仅 Windows 生效）
    hide_by_name = {          -- 按文件名精确匹配隐藏
        -- "node_modules"
    },
    hide_by_pattern = {       -- 按 glob 模式隐藏
        -- "*.meta",
        -- "*/src/*/tsconfig.json",
    },
    always_show = {           -- 即使其它过滤规则生效也要始终显示
        -- ".gitignored",
    },
    always_show_by_pattern = {-- 按模式始终显示
        -- ".env*",
    },
    never_show = {            -- 强制隐藏，优先级高于 always_show
        -- ".DS_Store",
        -- "thumbs.db"
    },
    never_show_by_pattern = { -- 强制按模式隐藏
        -- ".null-ls_*",
    },
},
```

* **visible**

  * `false`：被过滤的项目完全不显示。

  * `true`：显示在列表中，但会以灰度或其他样式区分。

* **hide_dotfiles / hide_gitignored / hide_hidden**

  * 分别控制隐藏以点开头、被 Git 忽略、系统“隐藏”属性的文件。

* **hide_by_name / always_show / never_show**

  * 支持通过文件或目录名称精确匹配来隐藏或强制显示，`never_show` 优先级最高。

* **hide_by_pattern / always_show_by_pattern / never_show_by_pattern**

  * 支持 glob 模式（`*.log`、`*/build/*` 等）进行更灵活的过滤。

### follow_current_file

```lua
follow_current_file = {
    enabled = false,          -- 跟随当前打开的 buffer 文件，自动定位并展开
    leave_dirs_open = false,  -- 自动跳转时，是否保持原本展开的目录不收起
},
```

* **enabled**

  * `true`：当你在编辑器中切换 buffer 时，Neo-tree 会自动定位到该文件并展开父目录。

  * `false`：关闭此功能。

* **leave_dirs_open**

  * `true`：在自动定位时，不会收起之前打开的所有目录。

  * `false`：会收起非目标文件所在的目录，只展开目标路径。

### group_empty_dirs

```lua
group_empty_dirs = false,             -- 将连续的空目录折叠成一项分组
```

* `true`：若一条路径下连续多级空目录，会以单条分组形式展示，减少层级冗余。
* `false`：每级空目录仍然单独列出。

### hijack_netrw_behavior

```lua
hijack_netrw_behavior = "open_default", 
-- netrw 停用后，打开目录时按 window.position 打开 neo-tree
-- 可选：
-- "open_current" : 像 netrw 一样在当前位置打开
-- "disabled"     : 保留 netrw，neo-tree 不接管
```

* **open_default**（默认）
  * 关闭内置 `netrw`，你在命令行或文件浏览器里打开目录时，Neo-tree 会按照 `window.position` 弹出窗口。

* **open_current**
  * 同样关闭 `netrw`，但打开行为更贴近 `netrw`：在当前窗口里打开目录。

* **disabled**
  * 保留 `netrw` 行为，不让 Neo-tree 接管任何目录打开操作。

### use_libuv_file_watcher

```lua
use_libuv_file_watcher = false,       -- 使用 OS 级别的文件监听（libuv），而非 nvim autocmd
```

* `true`：基于 libuv（Node.js 底层库）提供的文件系统监听接口，实时感知文件增删改操作。
* `false`：依赖 Neovim 的 `autocmd` 事件，比如 `BufWritePost`、`DirChanged` 等来刷新。

### window

#### mappings

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

#### fuzzy_finder_mappings

这些映射只在你按 `/` 或 `D` 调出 fuzzy_finder 窗口时生效，用于在候选列表中上下移动或关闭窗口：

| 模式 | 快捷键   | 命令               | 描述             |
| :--- | -------- | ------------------ | :--------------- |
| n    | `<down>` | `move_cursor_down` | 向下移动一个候选 |
| n    | `<up>`   | `move_cursor_up`   | 向上移动一个候选 |
| n    | `<esc>`  | `close`            | 关闭模糊查找窗口 |

## 7. buffers 模块配置

### follow_current_file

```lua
follow_current_file = {
  enabled = true,
  leave_dirs_open = false,
},
```

* **enabled**
  *  打开 Neo-tree 的 Buffer 视图时，自动定位并展开到与当前活动 Neovim buffer 对应的文件行。

* **leave_dirs_open**

  * `false`：在跳转并展开目标文件所在目录时，会收起那些非目标路径的自动展开目录；

  * `true`：则保留之前所有自动展开的目录节点，不会收起。

### group_empty_dirs

```lua
group_empty_dirs = true,
```

* 当多个空目录（即下面没有文件的目录）**连续嵌套**存在时，Neo-tree 会将它们**合并为一行**显示，减少视觉层级冗余。

### show_unloaded

```lua
show_unloaded = true,
```

* 控制是否在 Buffer 列表中显示那些**尚未加载**到内存（unloaded）的 buffer。
* `true`：也会列出未加载的缓冲区；
* `false`：仅显示当前已加载并活跃的缓冲区。

### window.mappings

映射同样仅在 Neo-tree 的 Buffer 视图里生效，用于对 buffer 列表进行导航、关闭、排序等操作：

| 模式 | 快捷键 | 命令                   | 描述                                   | 功能分类    |
| ---- | ------ | ---------------------- | -------------------------------------- | ----------- |
| n    | `d`    | `buffer_delete`        | 关闭当前选中 buffer                    | Buffer 操作 |
| n    | `bd`   | `buffer_delete`        | 同上                                   | Buffer 操作 |
| n    | `<bs>` | `navigate_up`          | 切换到上一级目录                       | 导航        |
| n    | `.`    | `set_root`             | 将当前目录设为根                       | 导航        |
| n    | `o`    | `show_help`            | 显示“Order by”子命令提示并等待后续按键 | 帮助/子命令 |
| n    | `oc`   | `order_by_created`     | 按创建时间排序                         | 排序        |
| n    | `od`   | `order_by_diagnostics` | 按诊断信息排序                         | 排序        |
| n    | `om`   | `order_by_modified`    | 按修改时间排序                         | 排序        |
| n    | `on`   | `order_by_name`        | 按名称排序                             | 排序        |
| n    | `os`   | `order_by_size`        | 按大小排序                             | 排序        |
| n    | `ot`   | `order_by_type`        | 按类型排序                             | 排序        |

## 8. Git

```lua
window = {
    position = "float",
    ...
}
```

* **浮动窗口**：Git 状态会以浮动窗口形式弹出，居中显示，不影响主侧边栏布局。
* 可以改为 `"left"`、`"right"`、`"top"` 或 `"bottom"`，让它像文件树一样固定在某侧。

### mappings

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

## 9. 自定义

| 模式 | 快捷键       | 命令                          | 描述                                     |
| ---- | ------------ | ----------------------------- | ---------------------------------------- |
| n    | `<leader>e`  | `<Cmd>Neotree toggle<CR>`     | 切换文件资源管理器（打开/关闭 Neo-tree） |
| n    | `<leader>rf` | `<Cmd>Neotree reveal<CR>`     | 在资源管理器中定位并展开当前文件         |
| n    | `<leader>gs` | `<Cmd>Neotree git_status<CR>` | 打开 Git 状态视图                        |
| n    | `<leader>tb` | `<Cmd>Neotree buffers<CR>`    | 打开 Buffers 视图                        |
