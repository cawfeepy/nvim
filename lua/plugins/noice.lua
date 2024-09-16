return {
  "folke/noice.nvim",
  config = function (_, opts)
    require("noice").setup(opts)
  end,
  opts = {
    lsp = {
      signature = {
        auto_open = {
          enabled = false
        }
      }
    }
  }
}
