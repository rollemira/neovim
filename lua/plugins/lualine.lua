return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        theme = "dracula",
        component_separators = "",
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
        lualine_z = {
          {
            "datetime",
            -- options: default, us, uk, iso, or your own format string ("%H:%M", etc..)
            style = "%H:%M",
            separator = { right = "" },
            left_padding = 2,
          },
        },
      },
    })
  end,
}
