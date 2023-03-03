return {
	{
		"vigoux/notifier.nvim",
		event = "VeryLazy",
		opts = {
			notify = {
				clear_time = 4000, -- Time in milliseconds before removing a vim.notify notification, 0 to make them sticky
				min_level = vim.log.levels.INFO, -- Minimum log level to print the notification
			},
		},
	},
	-- better vim.ui
	{
		"stevearc/dressing.nvim",
		lazy = true,
		init = function()
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end,
	},

	-- indent guides for Neovim
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			char = "▏",
			--char = "│",
			filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
			show_trailing_blankline_indent = false,
			show_current_context = false,
		},
	},

	-- active indent guide and indent text objects
	{
		"echasnovski/mini.indentscope",
		version = false, -- wait till new 0.7.0 release to put it back on semver
		event = { "BufReadPre", "BufNewFile" },
		-- opts = {
		-- 	draw = {
		-- 		delay = 100,
		-- 		animation = 0,
		-- 	},
		-- 	-- symbol = "▏",
		-- 	-- symbol = "│",
		-- 	symbol = "╎",
		-- 	options = { try_as_border = true },
		-- },
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
		config = function(_, opts)
			-- .setup(opts)
			local mindentscope = require("mini.indentscope")

			mindentscope.setup({
				draw = {
					delay = 100,
					animation= mindentscope.gen_animation.none()
				},
				symbol = "│",
				options = { try_as_border = true },
			})
			--require('mini.indentscope').gen_animation.none()
		end,
	},
}
