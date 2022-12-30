local M = {}

function M.toggle_human_mode()
  if vim.g.vimspector_enable_mappings == nil then
    vim.g.vimspector_enable_mappings = "HUMAN"
  else
    vim.g.vimspector_enable_mappings = nil
  end
end

function M.setup()
  vim.cmd [[Lazy load vimspector]] -- Load vimspector
end

return M
