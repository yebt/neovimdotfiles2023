local create_cmd = vim.api.nvim_create_user_command
local create_aucmd = vim.api.nvim_create_autocmd
local create_agroup = vim.api.nvim_create_augroup

---------------------------------------------------------

-- -- Restore last cusor position
-- local a = create_agroup("RC", { clear = true })
-- create_aucmd({ "BufReadPost" }, {
-- 	pattern = { "*" },
-- 	group = a,
-- 	command = [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif"]],
-- 	-- execute g'" command
-- })
-- File options adjust
local b = create_agroup("FILETYPEADJUST", { clear = true })
-- makdown
create_aucmd({ "FileType" }, {
	pattern = { "markdown", "gitcommit" },
	group = b,
	callback = function()
		vim.opt.spell = true
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
	end,
})
-- javascript indentation
create_aucmd({ "FileType" }, {
	pattern = { "javascript" },
	group = b,
	callback = function()
		vim.opt.tabstop = 2
		vim.opt.shiftwidth = 2
	end,
})
-- json doc support
create_aucmd({ "FileType" }, {
	pattern = { "json" },
	group = b,
	callback = function()
		vim.cmd.syntax("match Comment +\\/\\/.\\+$+")
	end,
})
-- lua indentation with tabs
create_aucmd({ "FileType" }, {
	pattern = { "lua" },
	group = b,
	callback = function()
		vim.opt.expandtab = false
	end,
})
-- apache
-- apache setlocal commentstring=#\ %s
create_aucmd({ "FileType" }, {
	pattern = { "apache" },
	group = b,
	callback = function()
		vim.opt_local.commentstring = "# %s"
	end,
})
-- Packer
create_aucmd({ "BufEnter" }, {
	pattern = {
		"plugins.lua",
	},
	callback = function()
		vim.cmd("source <afile>")
	end,
})
-- Terminal options
local c = create_agroup("TERMING", { clear = true })
create_aucmd({ "TermOpen" }, {
	pattern = { "*" },
	group = c,
	command = [[setlocal nonumber | setlocal norelativenumber | setlocal  signcolumn=no|startinsert]],
})
create_aucmd({ "BufEnter", "WinEnter" }, { pattern = { "term://*" }, group = c, command = [[startinsert]] })
create_aucmd({ "BufLeave" }, { pattern = { "term://*" }, group = c, command = [[stopinsert]] })

--
---------------------------------------------------------
-- create_cmd("AuRn", function()
-- 	print("Auto run starts now ...")
-- end, {})
---
create_cmd("Chmdpx", function()
	vim.cmd("! chmod +x %")
end, {})
create_cmd("Chmdmx", function()
	vim.cmd("! chmod -x %")
end, {})

-- lua
create_aucmd({ "FileType" }, {
	pattern = { "lua" },
	callback = function()
		create_cmd("Stylua", function()
			vim.cmd(":!stylua %")
		end, {})
	end,
})
-- :%s/\\u\(\x\{4\}\)/\=nr2char(str2nr(submatch(1),16))/g

---------------------------------------------------------
-- take from lazynvim
local function augroup(name)
	return create_agroup("lazyvim_" .. name, { clear = true })
end

-- Check if we need to reload the file when it changed
create_aucmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("checktime"),
  command = "checktime",
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})
-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})
