return {
  "nvim-treesitter/nvim-treesitter",
  -- 只有在没有传入文件参数时才启用懒加载，加快启动速度
  lazy = vim.fn.argc(-1) == 0,
  -- 在打开文件、创建新文件或保存前触发加载
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  -- 插件加载前，先将其添加到 runtimepath，并预加载 query_predicates
  init = function(plugin)
    require("lazy.core.loader").add_to_rtp(plugin)
    require("nvim-treesitter.query_predicates")
  end,
  -- 构建和更新命令
  build = ":TSUpdate",

  -- 传给 setup 的选项
  opts = {
    -- 要安装的 parser 列表
    ensure_installed = {
      "go", "json", "markdown", "sql", "vim", "bash", "lua",
      -- 可选："markdown_inline", "vim", "vimdoc"
    },
    -- 自动安装缺失的 parser
    sync_install = true,
    auto_install = true,

    -- 语法高亮
    highlight = {
      enable = true,
      -- 禁用大型文件高亮，防止卡顿
      disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
      additional_vim_regex_highlighting = false,
    },

    -- 基于 Treesitter 的智能缩进
    indent = { enable = true },
  },

  -- 插件加载完毕后执行的配置
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)

    -- 文件类型检测完毕后启用基于 Treesitter 的折叠
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        if pcall(vim.treesitter.start) then
          vim.opt_local.foldexpr   = "v:lua.vim.treesitter.foldexpr()"
          vim.opt_local.foldmethod = "expr"
        end
      end,
    })
  end,
}

