local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

vim.g.mapleader = "\\"

-- NORMAL mode keymaps
-- Disable arrow keys
keymap("n", "<Up>", "<NOP>")
keymap("n", "<Down>", "<NOP>")
keymap("n", "<Left>", "<NOP>")
keymap("n", "<Right>", "<NOP>")

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)


keymap("n", "H", "^") -- Shift + H takes you to the start of the line
keymap("n", "L", "g_") -- Shift + L takes you to the end of the line

keymap("n", "o", "o<Esc>xcc") -- dont autocomment below on "o"
keymap("n", "O", "O<Esc>xcc") -- dont autocomment above on "O"
keymap("n", "<C-o>", "m`O<Esc>d$j``") -- insert new line above current position

keymap("n", "<Leader>fc", "gg=G``<CR>") -- formats entire file

-- Prevent x from overriding clipboard
keymap("n", "x", "\"_x")
keymap("n", "X", "\"_X")

-- Split line at cursor (opposite of "J")
keymap("n", "S", "i<CR><Esc>^mwgk:silent! s/\v +$//<CR>:noh<CR>`w")

-- Insert binding.pry
keymap("n", "<Leader>dd", "<S-O>binding.pry<Esc>") -- on line above

keymap("n", "<Esc>", ":noh<CR>") -- clear search highlighting on esc

keymap("n", "<F9>", "mzggg?G`z")

-- INSERT mode keymaps
-- Ctrl + q escapes back to NORMAL mode (esc button too far for my fingers)
keymap("i", "<C-q>", "<Esc>")
