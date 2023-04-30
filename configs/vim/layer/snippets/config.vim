" better ultisnip keys
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsSnippetsDir="~/.config/nvim/UltiSnips"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "~/.config/nvim/UltiSnips"]

" Configure Scratch Plugin
" gs to open scratch
let g:scratch_persistence_file = '/tmp/.scratch.vim'
let g:scratch_insert_autohide = 0
let g:scratch_filetype = "ruby"
let g:scratch_autohide = 1

" Supertab config
let g:SuperTabDefaultCompletionType = '<C-Tab>'
