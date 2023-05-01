local options = {
  tabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  ignorecase = true,
  smartcase = true,
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
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Autosave current file on FocusLost
-- TODO: Do we even need these groups??
local autosave = vim.api.nvim_create_augroup("AutoSave", { clear = true })
vim.api.nvim_create_autocmd("FocusLost", { command = "silent! wall", group = autosave })

local trailingspace = vim.api.nvim_create_augroup("TrailingSpace", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", { pattern = { "*" }, command = [[%s/\s\+$//e]], group = trailingspace })

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
