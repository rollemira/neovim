return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add more treesitter parsers
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      })
      -- when we see a file try to get highlighting
      opts.auto_install = true
    end,
  },
}
