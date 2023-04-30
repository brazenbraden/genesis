" TODO: Things to look into..
" stupid-EasyMotion plugin
" Learn multicursor plugin
"
" # what does this do?
" set title
" set autoread
" set autowrite
" set lazyredraw
" set linebreak
" set ttyfast
" set showcmd
" set shomode
" set modelines=0
" set wildmenu
" set formatoptions+=j " always use spaces instead of tab chars
set clipboard+=unnamedplus " always copy paste from the system clipboard
let using_neovim = has('nvim')
let using_vim = !using_neovim

set wrap linebreak nolist
set showmatch
" set list " displays a - per line space after a word
set tabstop=2
set shiftwidth=2
set expandtab
set ignorecase
set smartcase
set termguicolors
set guifont=Hack\ Nerd\ Font\ 14
set scrolloff=5
set number relativenumber
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=10
set autoindent
set noswapfile
set encoding=utf-8
set splitbelow
set splitright
set history=1000
set spelllang=eng
set wildmode=longest,list,full
set lazyredraw " Screen wont redraw while executing macros
set mouse=
filetype plugin indent on

" Save when window loses focus
au FocusLost * :silent! wall
" Autoresize windows when vim is resized
au VimResized * :wincmd =

" Return to the same line when rediting a file previously
" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

let mapleader = "\\"

" autocmd BufEnter * silent! lcd %:p:h
" Delete all trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e
" Set tabs for yaml files to two spaces
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
" Automatically reload vimrc when changes are saved
" autocmd BufWritePost init.vim source $MYVIMRC

" NERDCommenter
let g:NERDToggleCheckAllLines = 0
nnoremap <C-_> :call nerdcommenter#Comment(0,"toggle")<CR>
vnoremap <C-_> :call nerdcommenter#Comment(0,"toggle")<CR>

let g:airline_powerline_fonts = 1

" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
" autocmd FileType ruby setlocal omnifunc=LanguageClient#complete
" --------------------------

" vim-multiple-cursors settings
" TODO: Map this to Leader + d maybe?
" let g:multi_cursor_start_word_key = '<C-d>'
" let g:multi_cursor_start_key = '<C-d>'
" let g:multi_cursor_next_key = '<C-d>'
let g:multi_cursor_exit_from_visual_mode = 1
"Cannot yet map ctrl+shift+g to go back. Must investigate."
"https://stackoverflow.com/questions/1506764/how-to-map-ctrla-and-ctrlshifta-differently"

" vim-slime config
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}

" -------------------
" CUSTOM KEY BINDINGS
" -------------------
" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
" Ctrl + nav key moves around in insert mode
inoremap <c-k> <up>
inoremap <c-j> <down>
inoremap <c-h> <left>
inoremap <c-l> <right>
" Ctrl + q escapes from insert mode (same as Esc)
inoremap <C-q> <Esc>
" Remap <ESC> to escape from NVIM :terminal
tnoremap <C-q> <C-\><C-n>
" Open a split pane with console
nnoremap gc :split term://zsh<cr>
" Prevents accidental VISUAL + K which looks for man page for selected incase
" you want to select up too quickly
vnoremap K k
" Shift + h takes you to the start of a line
noremap H ^
" Shift + l takes you to the end of the line
noremap L g_
" Fold everything except where you are focused
nnoremap <Leader>z zMzvzz
" Leader + ev to quickly edit vimrc in vertical split
" nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Leader + ez to quickly edit zshrc in a vertical split
nnoremap <Leader>ez :vsplit ~/.zshrc<cr>
" Leader + sv to quickly source vimrc file
nnoremap <Leader>sv :source $MYVIMRC<cr>
" Leader fc (format code) to format the file and return to last cursor
" position
nnoremap <Leader>fc gg=G``<CR>
" Caps S splits the line to the next line at the cursor
" (oppsite of caps J which joins lines into one)
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w
" Panic button - scrambles text (just for fun)
nnoremap <f9> mzggg?G`z
" Prevent x from overriding whats in the clipboard
noremap x "_x
noremap X "_X
" Keep it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z`
" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
" Add space above and go back to where you were
nmap <C-O> m`<S-O><Esc>d$j``
" Dont auto-comment new lines on `o`
nnoremap o o<esc>xcc
" Normal mode insert binding.pry
nnoremap <leader>dd <S-O>binding.pry<esc>
" Use smartcase when doing * or # context search
nnoremap * /\<<C-R>=expand('<cword>')<CR>\>\C<CR>
nnoremap # ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>
" Tab shorcuts
nmap <S-T> :tabnew<CR>
nmap <C-Left> :tabprev<CR>
nmap <C-Right> :tabnext<CR>
nmap <S-Q> :tabclose<CR>
" https://www.youtube.com/watch?v=9J2OjH8Ao_A
" Vim for Rails devs - thoughbot
" Will this work for me?
map <Leader>e :e <C-R>=expand("%p:h") . '/'<CR>
map <Leader>s :split <C-R>=expand("%p:h") . '/'<CR>
map <Leader>v :vnew <C-R>=expand("%p:h") . '/'<CR>

" ----------------
" CUSTOM FUNCTIONS
" ----------------
" Toggle on and off IndentLines
nnoremap <Leader>ln :call ToggleLineDecoration()<cr>
function! ToggleLineDecoration()
  if &number
    set number norelativenumber
    set nonumber
    :GitGutterDisable
    :IndentLinesDisable
  else
    set number relativenumber
    set number
    :GitGutterEnable
    :IndentLinesEnable
  endif
endfunction

" Add all TODO items to the quickfix list relative to where you opened Vim.
command! TODO call s:todo()
function! s:todo() abort
  let entries = []
  for cmd in ['git grep -niIw -e TODO: -e FIXME: 2> /dev/null',
            \ 'grep -rniIw -e TODO: -e FIXME: . 2> /dev/null']
    let lines = split(system(cmd), '\n')
    if v:shell_error != 0 | continue | endif
    for line in lines
      let [fname, lno, text] = matchlist(line, '^\([^:]*\):\([^:]*\):\(.*\)')[1:3]
      call add(entries, { 'filename': fname, 'lnum': lno, 'text': text })
    endfor
    break
  endfor

  if !empty(entries)
    call setqflist(entries)
    copen
  endif
endfunction
