local options = {
  tabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  ignorecase = true,
  smartcase = true,
  linebreak = true,
  termguicolors=true,
  scrolloff = 8,
  number = true,
  relativenumber = true,
  clipboard = "unnamedplus",
  mouse = "",
  cursorline = true,
  hlsearch = true,
  foldmethod = "expr",
  foldexpr = "nvim_treesitter#foldexpr()",
  foldnestmax = 10,
  foldenable = false,
  foldlevel = 10,
  autoindent = true,
  swapfile = false,
  undofile = true,
  fileencoding = "utf-8",
  splitbelow = true,
  splitright = true,
  history = 1000,
  spelllang = "eng",
  wildmode = { "longest", "list", "full" },
  lazyredraw = true,
  completeopt = "menuone,noselect",
  conceallevel = 0,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Autosave current file on FocusLost
-- TODO: Do we even need these groups??
local autosave = vim.api.nvim_create_augroup("AutoSave", { clear = true })
vim.api.nvim_create_autocmd("FocusLost", { command = "silent! wall", group = autosave })

local trailingspace = vim.api.nvim_create_augroup("TrailingSpace", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*" },
  callback = function(ev)
    save_cursor = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos(".", save_cursor)
  end,
  group = trailingspace
})

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- TODO: extract this to a utils file or something
-- TODO: Investigate why this isnt working properly
vim.keymap.set("n", "<Leader>ln", ":lua ToggleLineDecoration()<CR>")
function ToggleLineDecoration()
  if vim.opt.number == true then
    vim.opt.number = false
    vim.opt.relativenumber = false
    vim.cmd("IndentLinesDisable")
    vim.cmd("Gitsigns toggle_signs")
  else
    vim.opt.number = true
    vim.opt.relativenumber = true
    vim.cmd("IndentLinesEnable")
    vim.cmd("Gitsigns toggle_signs")
  end
end
