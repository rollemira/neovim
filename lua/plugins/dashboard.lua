return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
██╗  ██╗███████╗ █████╗ ██╗   ██╗███████╗
██║  ██║██╔════╝██╔══██╗██║   ██║██╔════╝
███████║█████╗  ███████║██║   ██║█████╗  
██╔══██║██╔══╝  ██╔══██║╚██╗ ██╔╝██╔══╝  
██║  ██║███████╗██║  ██║ ╚████╔╝ ███████╗
╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚══════╝
 rollemira
]]
      --       local logo = [[
      -- ██████╗  ██████╗ ██╗     ██╗     ███████╗███╗   ███╗████████╗███████╗ ██████╗██╗  ██╗
      -- ██╔══██╗██╔═══██╗██║     ██║     ██╔════╝████╗ ████║╚══██╔══╝██╔════╝██╔════╝██║  ██║
      -- ██████╔╝██║   ██║██║     ██║     █████╗  ██╔████╔██║   ██║   █████╗  ██║     ███████║
      -- ██╔══██╗██║   ██║██║     ██║     ██╔══╝  ██║╚██╔╝██║   ██║   ██╔══╝  ██║     ██╔══██║
      -- ██║  ██║╚██████╔╝███████╗███████╗███████╗██║ ╚═╝ ██║   ██║   ███████╗╚██████╗██║  ██║
      -- ╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝╚══════╝╚═╝     ╚═╝   ╚═╝   ╚══════╝ ╚═════╝╚═╝  ╚═╝
      --  rolleira X @rollemira
      --             ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
      opts.theme = "doom"
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },
}
