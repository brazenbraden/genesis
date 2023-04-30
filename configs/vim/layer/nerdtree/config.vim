" NERDTree settings && NERDCommenter settings
autocmd StdinReadPre * let s:std_in=1
" open NERDTree by default if no file supplied to vim
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" open NERDTree if opening vim with a folder
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" close vim if nothing but NERDTree is open with q!
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Ctrl + R opens NERDTree to the file.
" TODO: Remap this because it overwrites vim redo
map <Leader>r :NERDTreeFind<CR>
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
" Remap open files in NERDTree with horizontal split
" let g:NERDTreeMapOpenSplit='h'
" Remap open files in NERDTree with vertical split
" let gNERDTreeMapOpenVSplit='s'
" Ctrl + / to comment out code
let g:NERDCreateDefaultMappings = 0
let g:NERDTreeToggleCheckAllLines = 0

" Don't display indentLine for help for NERDTree
let g:indentLine_enabled = 1
let g:indentLine_fileTypeExclude=['help']
let g:indentLine_bufNameExclude=['NERD_tree.*']
