local status_cmp_ok, cmp_types = pcall(require, "cmp.types.cmp")
if not status_cmp_ok then
  return
end

local ConfirmBehavior = cmp_types.ConfirmBehavior
-- local SelectBehavior = cmp_types.SelectBehavior
return {
  "hrsh7th/nvim-cmp",
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  dependencies = {
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "mlaursen/vim-react-snippets",
    "rafamadriz/friendly-snippets",
  },
  config = function(_, opts)
    local cmp = require("cmp")
    cmp.setup(opts)

    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
    local vim_react_snippets = require("vim-react-snippets")
    vim_react_snippets.lazy_load()
    cmp.setup({
      window = {
        documentation = cmp.config.disable
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      active = true,
      on_config_done = nil,
      enabled = function()
        local buftype = vim.api.nvim_buf_get_option(0, "buftype")
        if buftype == "prompt" then
          return false
        end
        return true
      end,
      confirm_opts = {
        behavior = ConfirmBehavior.Replace,
        select = false,
      },

      completion = {
        ---@usage The minimum length of a word to complete on.
        keyword_length = 1,
        completeopt = "menu,menuone,noinsert",
      },
      experimental = {
        ghost_text = true,
        native_menu = false,
      },
      sources = {
        { name = "path" },
        { name = "nvim_lsp", keyword_length = 1 },
        { name = "buffer", keyword_length = 3 },
        { name = "luasnip", keyword_length = 2 },
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        max_width = 0,
        -- kind_icons = lvim.icons.kind,
        source_names = {
          nvim_lsp = "(LSP)",
          emoji = "(Emoji)",
          path = "(Path)",
          calc = "(Calc)",
          cmp_tabnine = "(Tabnine)",
          vsnip = "(Snippet)",
          luasnip = "(Snippet)",
          buffer = "(Buffer)",
          tmux = "(TMUX)",
          copilot = "(Copilot)",
          treesitter = "(TreeSitter)",
        },
        duplicates = {
          buffer = 1,
          path = 1,
          nvim_lsp = 0,
          luasnip = 1,
        },
      },
    })
  end,
}
