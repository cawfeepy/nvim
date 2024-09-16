local on_attach = require("plugins.lsp.opts").on_attach
local capabilities = require("plugins.lsp.opts").capabilities
return {
  -- "jose-elias-alvarez/typescript.nvim",
  -- config = function()
  --   require("typescript").setup({
  --     server = require("plugins.lsp.servers.tsserver"),
  --   })
  --   require("null-ls").setup({
  --     sources = {
  --       require("typescript.extensions.null-ls.code-actions"),
  --     },
  --   })
  -- end,
}
