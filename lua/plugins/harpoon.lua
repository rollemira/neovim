return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup({})
      -- basic telescope configuration
      local conf = require("telescope.config").values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require("telescope.pickers")
          .new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
              results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
          })
          :find()
      end

      local wk = require("which-key")
      wk.register({
        a = {
          name = "harpoon",
          a = {
            function()
              harpoon:list():add()
            end,
            "Append to harpoon list",
          },
          d = {
            function()
              harpoon:list():remove()
            end,
            "Remove from harpoon list",
          },
          f = {
            function()
              toggle_telescope(harpoon:list())
            end,
            "Find harpooned files",
          },
          k = {
            function()
              harpoon:list():clear()
            end,
            "Clear harpoon list",
          },
          n = {
            function()
              harpoon:list():next()
            end,
            "Next harpooned file",
          },
          p = {
            function()
              harpoon:list():prev()
            end,
            "Previous harpooned file",
          },
          s = {
            function()
              --toggle_telescope(harpoon:list())
              harpoon.ui:toggle_quick_menu(harpoon:list())
            end,
            "Select harpooned file",
          },
        },
      }, { prefix = "<leader>" })

      harpoon:extend({
        UI_CREATE = function(cx)
          vim.keymap.set("n", "<C-v>", function()
            harpoon.ui:select_menu_item({ vsplit = true })
          end, { buffer = cx.bufnr })

          vim.keymap.set("n", "<C-x>", function()
            harpoon.ui:select_menu_item({ split = true })
          end, { buffer = cx.bufnr })

          vim.keymap.set("n", "<C-t>", function()
            harpoon.ui:select_menu_item({ tabedit = true })
          end, { buffer = cx.bufnr })
        end,
      })

      vim.keymap.set("n", "<C-e>", function()
        toggle_telescope(harpoon:list())
      end, { desc = "View harpooned files" })
    end,
  },
}
