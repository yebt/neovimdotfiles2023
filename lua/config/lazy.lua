-- bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

-- lazyrequires
-- function prequire(...)
-- 	local status, lib = pcall(require, ...)
-- 	if status then
-- 		return lib
-- 	end
-- 	vim.notify("Not load: " .. ... , vim.log.levels.WARN )
-- 	return nil
-- end
-- vim.api.nvim_create_autocmd("User", {
-- 	group = vim.api.nvim_create_augroup("LazyVim", { clear = true }),
-- 	pattern = "VeryLazy",
-- 	callback = function()
-- 		prequire("config.keymaps")
-- 		prequire("config.options")
-- 		prequire("config.autocmds")
-- 		prequire("config.vars")
-- 	end,
-- })
-- vim.g.mapleader = ","

require("lazy").setup({
	spec = {
		-- add LazyVim and import its plugins
		--{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
		-- { "LazyVim/LazyVim" },
		-- import any extras modules here
		-- { import = "lazyvim.plugins.extras.lang.typescript" },
		-- { import = "lazyvim.plugins.extras.lang.json" },
		-- { import = "lazyvim.plugins.extras.ui.mini-animate" },
		-- import/override with your plugins
		{
			dir = "~/.config/nvim/lconf/",
			-- config = true
			import = "lconf.plugins"
		},
		{ import = "plugins" },
	},
	defaults = {
		-- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
		-- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
		lazy = false,
		-- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
		-- have outdated releases, which may break your Neovim install.
		version = false, -- always use the latest git commit
		-- version = "*", -- try installing the latest stable version for plugins that support semver
	},
	install = { colorscheme = { "tokyonight", "habamax" } },
	checker = { enabled = true }, -- automatically check for plugin updates
	performance = {
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				"gzip",
				-- "matchit",
				-- "matchparen",
				-- "netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
