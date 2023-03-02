local map = vim.keymap.set
local slop = { silent = true }
--vim.g.mapleader = ","

map("n", "<leader>pv", vim.cmd.Ex, slop)
map("n", "<leader>lx", "<CMD>Lexplore %:p:h<CR>", slop)
map("n", "<leader>vx", "<CMD>Vexplore %:p:h<CR>", slop)

map("n", "<leader>q", "<CMD>q<CR>", slop)
map("n", "<M-q>", "<CMD>q<CR>", slop)

map("n", "<leader>w", "<CMD>w<CR>", slop)
map("n", "<M-w>", "<CMD>w<CR>", slop)
-- map("i", "<M-w>", "<C-o><CMD>w<CR>", slop)
map("i", "<M-w>", "<ESC><CMD>w<CR>", slop)

map("n", "<leader> ", ",", slop) --couse my lader key is ',', this rriger ','

map("n", "<leader>i", "gg=G''", slop)

map("n", "<leader>h", ":noh<cr>", slop)

map("n", "<M-Left>", "<C-w>h", slop)
map("n", "<M-Right>", "<C-w>l", slop)
map("n", "<M-Up>", "<C-w>k", slop)
map("n", "<M-Down>", "<C-w>j", slop)

map("n", "<M-h>", "<C-w>h", slop)
map("n", "<M-l>", "<C-w>l", slop)
map("n", "<M-k>", "<C-w>k", slop)
map("n", "<M-j>", "<C-w>j", slop)

map("n", "<M-S-Left>", "<CMD>bp<CR>", slop)
map("n", "<M-S-Right>", "<CMD>bn<CR>", slop)
map("n", "<M-S-h>", "<CMD>bp<CR>", slop)
map("n", "<M-S-l>", "<CMD>bn<CR>", slop)

--map("n", "<M-c>", "<CMD>bd<CR>", slop)

map("n", "<leader>a", "ggVG", slop)
map("x", "<leader>y", '"+y', slop)
map("x", "<leader>p", '"_dP', slop)

-- map("n", "Q", "<nop>", { })
-- map("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- map("i", "<ESC>", "<ESC><ESC>", {silent = true})
map("i", "<C-c>", "<ESC>", slop)

map("x", "<", "<gv", slop)
map("x", ">", ">gv", slop)
map("v", "J", ":m '>+1<CR>gv=gv", slop)
map("v", "K", ":m '<-2<CR>gv=gv", slop)

map("n", "<C-d>", "<C-d>zz", slop)
map("n", "<C-u>", "<C-u>zz", slop)

map("n", "n", "nzzzv", slop)
map("n", "N", "Nzzzv", slop)

map("t", "<ESC>", "<C-\\><C-n>", slop)

map("x", "<C-s>(", 'c(<C-r><C-o>")<ESC>vi(', slop)
map("x", "<C-s>[", 'c[<C-r><C-o>"]<ESC>vi[', slop)
map("x", "<C-s>{", 'c{<C-r><C-o>"}<ESC>vi{', slop)
map("x", '<C-s>"', 'c"<C-r><C-o>""<ESC>vi"', slop)
map("x", "<C-s>'", "c'<C-r><C-o>\"'<ESC>vi'", slop)

map("x", "<leader>s(", 'c(<C-r><C-o>")<ESC>vi(', slop)
map("x", "<leader>s[", 'c[<C-r><C-o>"]<ESC>vi[', slop)
map("x", "<leader>s{", 'c{<C-r><C-o>"}<ESC>vi{', slop)
-- map("x", '<leader>s"', 'c"<C-r><C-o>""<ESC>vi"', slop)
-- map("x", "<leader>s'", "c'<C-r><C-o>\"'<ESC>vi'", slop)

-- map("n", "<leader>jq", "<cmd>%!jq<CR>", slop)
-- map("x", "<leader>jq", ":'<,'>!jq<CR>", slop)
-- map("n", "<leader>js", ":!stylua %<CR>", slop)

-- map("n", "<F2>", ':wa<Bar>exe "mksession! " .. v:this_session<CR>:so ~/sessions/',{})
map("n", "<F2>", ':wa<Bar>exe "mksession! " .. v:this_session<CR>', {})

-- toggles
map("n", "<leader>tw", ":set wrap!<CR>")
map("n", "<leader>tr", ":set rnu!<CR>")
map("n", "<leader>tn", ":set nu!<CR>")

