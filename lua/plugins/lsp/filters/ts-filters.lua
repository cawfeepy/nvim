local M = {}
local function filter(arr, fn)
  local filtered = {}
  for k, v in pairs(arr) do
    if fn(v, k, arr) then
      table.insert(filtered, v)
    end
  end
  return filtered
end

local function filterReactDTS(value)
  return string.match(value.targetUri, '%.d.ts') == nil
end

M.documentHandler = function(err, result, method, ...)
  if vim.tbl_islist(result) and #result > 1 then
    local filtered_result = filter(result, filterReactDTS)
    return vim.lsp.handlers['textDocument/definition'](err, filtered_result, method, ...)
  end
  return vim.lsp.handlers['textDocument/definition'](err, result, method, ...)
end

return M
