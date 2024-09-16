local on_attach = require("plugins.lsp.opts").on_attach
local capabilities = require("plugins.lsp.opts").capabilities

return {
  handlers = {
    ["textDocument/definition"] = require("plugins.lsp.filters.ts-filters").documentHandler
  },
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    -- specify some or all of the following settings if you want to adjust the default behavior
    javascript = {
      inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = false,
        includeInlayFunctionParameterTypeHints = false,
        includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = false,
        includeInlayVariableTypeHints = true,
      },
    },
    inlayHints = {
    typescript = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = false,
        includeInlayFunctionParameterTypeHints = false,
        includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = false,
        includeInlayVariableTypeHints = true,
      },
    },
  },
}
