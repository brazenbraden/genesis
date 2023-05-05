local actions = require("telescope.actions")
local builtin = require('telescope.builtin')

-- Default to find_files if not in a git directory
vim.keymap.set('n', '<C-p>', function()
  local opts = {}
  vim.fn.system('git rev-parse --is-inside-work-tree')
  if vim.v.shell_error == 0 then
    builtin.git_files(opts)
  else
    builtin.find_files(opts)
  end
end)

vim.keymap.set('n', '<leader>ff', require('telescope.builtin').live_grep)

vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gb', function()
  require('telescope.builtin').buffers(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end)

vim.keymap.set('n', '<leader>mm', require('telescope.builtin').marks)

require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      }
    }
  },
})
