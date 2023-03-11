--vim.g.mapleader = ","
local opt = vim.opt
-- COLUMN
opt.relativenumber = true
opt.number = true
opt.numberwidth = 4
--opt.signcolumn = "auto:2"
opt.signcolumn = "auto"
-- CURSOR
opt.cursorline = true
opt.guicursor = "a:block"
-- opt.showmatch = true -- delay on write a match
-- CAHARACTERS
-- opt.listchars = "tab:--→,trail:·,precedes:«,extends:»"
-- opt.listchars = "tab:-->,trail:·,precedes:«,extends:»"
-- opt.listchars = "tab:→  ,trail:·,precedes:«,extends:»"
opt.listchars = "tab:⇀  ,trail:·,precedes:«,extends:»"
--opt.listchars = "tab:│  ,trail:·,precedes:«,extends:»"
--opt.listchars = "tab:│ ,trail:·,precedes:«,extends:»"
-- opt.listchars = "tab:┊ ,trail:·,precedes:«,extends:»"
-- opt.listchars = "tab:╼ ,trail:·,precedes:«,extends:»"
--opt.listchars = "tab:╾ ,trail:·,precedes:«,extends:»"
-- opt.listchars = "tab:╶ ,trail:·,precedes:«,extends:»"
-- opt.listchars = "tab:⇢  ,trail:·,precedes:«,extends:»"
-- opt.listchars = "tab:⇾  ,trail:·,precedes:«,extends:»"
opt.fillchars = "foldopen:,foldclose:"
opt.fillchars:append({
	horiz = "━",
	horizup = "┻",
	horizdown = "┳",
	vert = "┃",
	vertleft = "┨",
	vertright = "┣",
	verthoriz = "╋",
})
--opt.list = false
-- opt.list = true
opt.showbreak = "↳"
opt.breakindent = true -- better wrap indentation
opt.breakindentopt = "shift:2,min:40,sbr"
opt.cpoptions:append("n")
-- VIEW CHARS
opt.concealcursor = "nc"
opt.conceallevel = 2
-- FILE EDIT
opt.backspace = "indent,eol,start,nostop"
-- INDENTAION
opt.wrap = false
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smarttab = true
opt.smartindent = true
opt.autoindent = true
-- READ
opt.autoread = true
-- SPLITS
opt.splitbelow = true
opt.splitright = true
-- SEARCH
opt.ignorecase = true
opt.inccommand = "split"
opt.hlsearch=true
opt.incsearch=true
-- STATUS
opt.showcmd = true
opt.showmode = true
opt.cmdheight = 2
-- EDIT FILES
opt.undofile = true
opt.backup = false
opt.writebackup = false
opt.swapfile = false
-- SPELL
vim.g.spellfile_URL = "https://ftp.nluug.nl/vim/runtime/spell"
vim.g.loaded_spellfile_plugin = 1

opt.spelllang = "es,en"
-- opt.spell = true
-- TIMES
opt.updatetime = 300
opt.timeoutlen = 500
-- COLORS
opt.termguicolors = true
opt.background = "dark"
-- MISELANEUS
opt.completeopt = "menu,menuone,preview,noselect"
-- opt.completeopt = "menu,menuone,preview,noselect,noinsert"
-- FOLD
opt.foldlevel = 9
opt.foldcolumn = "auto"
opt.hidden = true
-- TABLINE
opt.showtabline = 1
-- SCROLL
opt.scrolloff = 2
-- SESSION
opt.sessionoptions = "blank,buffers,curdir,tabpages,winsize,terminal"

-- opt.laststatus = 3
-- opt.laststatus = 2
-- opt.winbar=" %f"

-- vim.g.loaded_perl_provider = 0
-- vim.g.loaded_ruby_provider = 0
--          |

-- -- netrw
-- -- vim.g.netrw_keepdir = 0
-- -- vim.g.netrw_winsize = 30
-- -- vim.g.netrw_banner = 1
-- -- vim.g.netrw_list_hide = "\\(^\\|\\s\\s\\)\\zs\\.\\S\\+"
--
-- vim.g.netrw_localcopydircmd = "cp -r"
-- --vim.cmd(" hi! link netrwMarkFile Search")

local global = vim.g
global.loaded_perl_provider = 0
global.loaded_ruby_provider = 0

-- netrw
global.netrw_keepdir = 0
global.netrw_winsize = 30
global.netrw_banner = 1
global.netrw_list_hide = "\\(^\\|\\s\\s\\)\\zs\\.\\S\\+"
