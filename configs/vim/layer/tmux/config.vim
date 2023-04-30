" Write all buggers before navigating from vim to tmux pane
let g:tmux_navigator_save_on_switch = 2
" Disable tmux navigator when zooming the vim pane
let g:tmux_navigator_disable_when_zoomed = 1

" Leader + et to quickly edit tmux.conf in a vertical split
nnoremap <Leader>et :vsplit ~/.tmux.conf<cr>
