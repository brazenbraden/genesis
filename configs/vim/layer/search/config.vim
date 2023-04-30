" incseach settings
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" escape clears highlight after search
map <esc> :noh<cr>

" FZF Options -------------------------------------
" If in a git directory, load files from root, else from current directory
" fun! FzfOmniFiles()
"   let is_git = system('git status')
"   if v:shell_error
"     :Files
"   else
"     :GFiles --exclude-standard --cached --others
"   endif
" endfun
" let g:rg_command = '
"   \ rg --column --line-number --no-heading --fixed-strings --smart-case --color "always"
"   \ -g "*.{js,jsx,json,php,md,css,scss,haml,erb,html,config,py,rb,conf}"
"   \ -g "!{.git,node_modules,vendor}/*" '
" command! -bang -nargs=* Rg call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1,
"   \  fzf#vim#with_preview({ 'dir': systemlist('git rev-parse --show-toplevel')[0] }),
"   \   <bang>0)

" Map ff to fuzzy text search with rg and fzf
" map ff :Rg!<cr>
" map <C-p> :call FzfOmniFiles() <cr>
" FZF Options End -----------------------------------
