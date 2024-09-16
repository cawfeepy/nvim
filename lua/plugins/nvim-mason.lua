return {
  "williamboman/mason.nvim",
  event = "User FilePost",

  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")
      local on_attach = require("plugins.lsp.opts").on_attach
      local capabilities = require("plugins.lsp.opts").capabilities

      local disabled_servers = {
        "tsserver",
        "ts_ls"
      }

      mason_lspconfig.setup_handlers({
        -- Automatically configure the LSP installed
        function(server_name)
          for _, name in pairs(disabled_servers) do
            if name == server_name then
              return
            end
          end
          local opts = {
            on_attach = on_attach,
            capabilities = capabilities,
          }

          -- local require_ok, server = pcall(require, "plugins.lsp.servers." .. server_name)
          -- if require_ok then
          --   opts = vim.tbl_deep_extend("force", server, opts)
          -- end

          require("lspconfig")[server_name].setup(opts)
        end,
      })
    end,
  },
}
