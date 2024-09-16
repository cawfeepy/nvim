local isWezTerm = os.getenv("TERM_PROGRAM") == "WezTerm"
return {

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function(_, opts)
      require('lualine').setup {
        options = {
          theme = "catppuccin"
        }
      }
      require("catppuccin").setup(opts)
    end,
    opts = {
      transparent_background = isWezTerm,
      term_colors = isWezTerm
    },
    dependencies = {
      "nvim-lualine/lualine.nvim"
    }
  },
  {
    "nvim-lua/plenary.nvim",
    lazy = false,
  },
  {
    "folke/tokyonight.nvim",
    enabled = false
  },
  {
    "LazyVim/LazyVim",
		opts = {
			colorscheme = function()
				require("catppuccin").load()
			end,
		},
  },
  -- {
  --   "tpope/vim-surround",
  --   enabled = true
  -- },
  {
    "tpope/vim-repeat",
    enabled = true
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = { use_diagnostic_signs = true },
  },
  {
    "hrsh7th/cmp-buffer",
    lazy = true
  },
  {
    "hrsh7th/cmp-path",
    lazy = true
  },
  {
    "nvim-tree/nvim-web-devicons",
    enabled = true,
    lazy = true,
  },
  {
    "nvim-notify",
    enabled = false 
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    after = "Catppuccino.nvim", -- important
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, "😄")
    end,
  },
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   event = "VeryLazy",
  --   opts = function()
  --     return {
  --       --[[add your custom lualine config here]]
  --     }
  --   end,
  -- },
  -- use mini.starter instead of alpha
  { import = "lazyvim.plugins.extras.ui.mini-starter" },

  -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
  { import = "lazyvim.plugins.extras.lang.json" },

}
