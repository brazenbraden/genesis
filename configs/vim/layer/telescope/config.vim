nnoremap <C-p> <cmd>lua require'brazenbraden.telescope'.project_files()<cr>
nnoremap <leader>ev <cmd>lua require'brazenbraden.telescope'.search_dotfiles()<cr>
map <leader>ff <cmd>Telescope live_grep<cr>
nnoremap gb <cmd>Telescope buffers<cr>

autocmd FileType TelescopePrompt call deoplete#custom#buffer_option('auto_complete', v:false)

