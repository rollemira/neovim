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
          name = "Harpoon",
          a = {
            function()
              harpoon:list():append()
            end,
            "append to harpoon list",
          },
          d = {
            function()
              harpoon:list():remove()
            end,
            "remove from harpoon list",
          },
          n = {
            function()
              harpoon:list():next()
            end,
            "next harpooned file",
          },
          p = {
            function()
              harpoon:list():prev()
            end,
            "previous harpooned file",
          },
        },
      }, { prefix = "<leader>" })

      vim.keymap.set("n", "<C-e>", function()
        toggle_telescope(harpoon:list())
      end, { desc = "Open harpooned files in telescope" })
    end,
  },
}
