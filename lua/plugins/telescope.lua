return {
  "nvim-telescope/telescope.nvim",
  opts = function()

    local actions = require("telescope.actions")

    return {
      defaults = {
        mappings = {
          i = {
            ["<C-n>"] = actions.move_selection_next,
            ["<C-p>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<ESC>"] = actions.close,
            ["<Leader>q"] = actions.close,
            ["<CR>"] = actions.select_default,
          },
        }
      },

      pickers = {
        find_files = {
          hidden = true,
        },
        live_grep = {
          --@usage don't include the filename in the search results
          only_sort_text = true,
        },
        grep_string = {
          only_sort_text = true,
        },
      }

    }
end
}
