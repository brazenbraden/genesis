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

vim.keymap.set('n', '<leader>ff', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })

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
