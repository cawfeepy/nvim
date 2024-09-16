return {
  "nvim-neo-tree/neo-tree.nvim",
  config = true,
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = true,
        never_show = { "node_modules", ".git"}
      }
    }
  }
}
