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

  -- pt.foldmethod = syntax,
  foldnestmax = 10,
  -- pt.nofoldenable = true,
  foldlevel = 10,
  autoindent = true,
  swapfile = false,
  undofile = true,
  fileencoding = "utf-8",
  splitbelow = true,
  splitright = true,
  history = 1000,
  spelllang = "eng",
  -- pt.wildmode=longest,list,full,
  lazyredraw = true,   
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Autosave current file on FocusLost
local autosave = vim.api.nvim_create_augroup("AutoSave", { clear = true })
vim.api.nvim_create_autocmd("FocusLost", { command = "silent! wall", group = autosave })

-- local cleartrailingspace = vim.api.nvim_create_augroup("TrailingSpace", { clear = true })
-- vim.api.nvim_create_autocmd("BufWritePre", { command = "%s/\s\+$//e", group = cleartrailingspace })
