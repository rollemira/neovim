return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      --colorscheme = "tokyonight-storm",
      colorscheme = "catppuccin",
    },
  },
}
