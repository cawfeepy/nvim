local M = {}
local keymap = vim.keymap.set
local cmp_nvim_lsp = require("cmp_nvim_lsp")

M.capabilities = cmp_nvim_lsp.default_capabilities()

local buffer_mappings = {
  normal_mode = {
    ["gd"] = {"<cmd>lua vim.lsp.buf.definition()<cr>", "Show definition"},
    ["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Goto Declaration" },
    ["K"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Show hover" },
    ["gr"] = { "<cmd>lua require('telescope.builtin').lsp_references()<CR>", "Goto references" },
    ["gi"] = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Goto Implementation" },
    -- ["gs"] = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "show signature help" },
    ["ga"] = { "<cmd>lua vim.lsp.buf.code_action<cr>", "Code action" },
    ["gl"] = { "<cmd>lua vim.diagnostic.open_float<cr>", "Expand error" },
    ["gR"] = { "<cmd>lua vim.lsp.buf.rename<cr>", "Rename variable" },
    ["]d"] = { "<cmd>lua vim.diagnostic.goto_next<cr>", "Next diagnostic" },
    ["[d"] = { "<cmd>lua vim.diagnostic.goto_next<cr>", "Previous diagnostic" },
  },
  insert_mode = {},
  visual_mode = {}
}

local function lsp_keymaps(bufnr)
  local mappings = {
    normal_mode = "n",
    insert_mode = "i",
    visual_mode = "v",

  }

  for mode_name, mode_char in pairs(mappings) do
    for key, remap in pairs(buffer_mappings[mode_name]) do
      local opts = { buffer = bufnr, desc = remap[2], noremap = true, silent = true }
      vim.keymap.set(mode_char, key, remap[1], opts)
    end
  end
  -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  -- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  -- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  -- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
  -- vim.keymap.set(
  --   "n",
  --   "<leader>ca",
  --   vim.lsp.buf.code_action,
  --   { buffer = bufnr, noremap = true, silent = true, desc = "Code Action" }
  -- )
  --
  -- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  -- vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
  -- vim.keymap.set("n", "<leader>tD", vim.lsp.buf.type_definition, opts)
  -- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
  -- vim.keymap.set("n", "<leader>gR", vim.lsp.buf.rename, { buffer = bufnr, noremap = true, silent = true, desc = "Rename" })
  -- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  -- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
end

-- Highlight symbol under cursor
local function lsp_highlight(client, bufnr)
  if client.supports_method("textDocument/documentHighlight") then
    vim.api.nvim_create_augroup("lsp_document_highlight", {
      clear = false,
    })
    vim.api.nvim_clear_autocmds({
      buffer = bufnr,
      group = "lsp_document_highlight",
    })
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      group = "lsp_document_highlight",
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
      group = "lsp_document_highlight",
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end
end

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
  lsp_highlight(client, bufnr)
end

M.on_init = function(client, _)
  if client.supports_method("textDocument/semanticTokens") then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

return M
