return {
  "L3MON4D3/LuaSnip",
  dependencies = { "rafamadriz/friendly-snippets" },
  enabled = true,
  config = function()
    local luasnip = require("luasnip")

    luasnip.filetype_extend("javascriptreact", { "html" })
    luasnip.filetype_extend("typescriptreact", { "html" })

    require("luasnip/loaders/from_vscode").lazy_load({ path = { "../config/my_snippets" } })
  end,
}
