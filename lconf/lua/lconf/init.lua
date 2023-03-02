local M = {}

---@param opts? LazyVimConfig
function M.setup(opts)
  require("lconf.config").setup(opts)
end

return M
