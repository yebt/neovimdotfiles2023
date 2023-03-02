require("lconf.config").init()

return {
  { "folke/lazy.nvim", version = "*" },
  { "lconf", priority = 10000, lazy = false, config = true, version = "*" },
}
