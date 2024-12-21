-- vim-rspec config
vim.g.rspec_command = "Dispatch RAILS_ENV=test bundle exec rspec {spec}"

-- RSpec.vim mappings
-- map <Leader>t :call RunCurrentSpecFile()<CR>
vim.keymap.set("n", "<Leader>t", ":Dispatch bundle exec rspec %<CR>")
vim.keymap.set("n", "<Leader>s", ":call RunNearestSpec()<CR>")

require('nvim-treesitter.configs').setup {
    endwise = {
        enable = true,
    },
}
