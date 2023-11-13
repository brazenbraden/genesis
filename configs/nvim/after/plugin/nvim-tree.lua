-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

-- keymappings
vim.keymap.set("n", "<leader>r", ":NvimTreeFindFile<CR>")
vim.keymap.set("n", "<leader>R", ":NvimTreeClose<CR>")

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
    highlight_opened_files = "none",
    root_folder_label = true,
  },
  filters = {
    dotfiles = true,
  },
  view = {
    cursorline = true,
    width = 30,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
})

-- Auto-closing has been removed due to event issues. Read more here and play
-- with some possible solutions https://github.com/nvim-tree/nvim-tree.lua/wiki/Auto-Close

require('nvim-web-devicons').setup({})
