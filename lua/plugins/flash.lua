return {
  "folke/flash.nvim",
  enable = true,
  event = "VeryLazy",
  -- ---@type Flash.Config
  -- opts = {},
  -- -- stylua: ignore
  keys = {
    { "s", false}, -- disable default keymap
    { "S", false}, -- disable default keymaps

    { ",", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
