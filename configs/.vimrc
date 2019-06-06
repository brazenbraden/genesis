call plug#begin()
  " File browser side bar plugin
  " https://github.com/scrooloose/nerdtree
  Plug 'scrooloose/nerdtree'

  " A nice theme
  " https://github.com/joshdick/onedark.vim
  Plug 'joshdick/onedark.vim'

  " Selecting multiple of the same (ctrl + g)
  " https://github.com/terryma/vim-multiple-cursors
  Plug 'terryma/vim-multiple-cursors'

  " Surround code and change surrounding chars
  " https://github.com/tpope/vim-surround"
  Plug 'tpope/vim-surround'

  " Auto-complete brackets
  " https://github.com/jiangmiao/auto-pairs
  Plug 'jiangmiao/auto-pairs'

  " build int git powerhouse
  " https://github.com/tpope/vim-fugitive
  Plug 'tpope/vim-fugitive'

  " https://github.com/scrooloose/nerdcommenter
  " https://github.com/vim-airline/vim-airline
  Plug 'vim-airline/vim-airline'

  " Allows for easy toggling of smart comments
  " https://github.com/scrooloose/nerdcommenter
  Plug 'scrooloose/nerdcommenter'

  " Automatically closes ruby block
  " https://github.com/tpope/vim-endwise
  Plug 'tpope/vim-endwise'

  " Auto reload the file if modified somewhere else
  " https://github.com/djoshea/vim-autoread
  Plug 'djoshea/vim-autoread'

  " Highlights all search results as you type
  " https://github.com/haya14busa/incsearch.vim
  Plug 'haya14busa/incsearch.vim'

  " https://github.com/vim-ruby/vim-ruby
  Plug 'vim-ruby/vim-ruby'

  " Adds a tonne of rails related keys
  " https://github.com/tpope/vim-rails
  Plug 'tpope/vim-rails'

  " Autocomplete
  " https://github.com/Shougo/deoplete.nvim
  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  " Plug 'ncm2/ncm2'
  " Plug 'roxma/nvim-yarp'
  " Plug 'ncm2/ncm2-bufword'
  " Plug 'ncm2/ncm2-path'
  " Plug 'autozimu/LanguageClient-neovim', {
  "   \ 'branch': 'next',
  "   \ 'do': 'bash install.sh',
  "   \ }
  Plug 'Valloric/YouCompleteMe'

  " https://github.com/tmux-plugins/vim-tmux-focus-events
  Plug 'tmux-plugins/vim-tmux-focus-events'

  " Seamless switching between vim and tmux panes
  " https://github.com/christoomey/vim-tmux-navigator
  Plug 'christoomey/vim-tmux-navigator'

  " Easily interact with tmux from vim
  " https://github.com/benmills/vimux
  Plug 'benmills/vimux'

  " Turbux is designed to speed up your TDD cycle by using a single key mapping to run the most relevant test based on the current file in vim
  " https://github.com/jgdavey/vim-turbux
  Plug 'jgdavey/vim-turbux'

  " Opens a Scratch file for storing notes and shit
  " https://github.com/mtth/scratch.vim
  Plug 'mtth/scratch.vim'

  " Hybrid line numbers and stuff
  " https://github.com/jeffkreeftmeijer/vim-numbertoggle
  Plug 'jeffkreeftmeijer/vim-numbertoggle'

  " Snippets
  " https://github.com/SirVer/ultisnips
  " https://github.com/honza/vim-snippets
  " Plug 'ervandew/supertab'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  " Switch between {} and do end blocks
  " https://github.com/jgdavey/vim-blockle
  Plug 'jgdavey/vim-blockle'

  " Search in files
  " https://github.com/junegunn/fzf.vim
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " Toggle zoom into a split making it full screen
  " https://github.com/vim-scripts/ZoomWin
  " Plug 'vim-scripts/ZoomWin'
  " Doesnt seem to work.. get lots of errors
call plug#end()

let mapleader="\<Space>"
set showmatch
set tabstop=2
set shiftwidth=2
set expandtab
set ignorecase
set smartcase
set termguicolors
set scrolloff=5
set number relativenumber
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=2
set autoindent
set noswapfile
set encoding=utf-8
filetype plugin indent on

autocmd BufEnter * silent! lcd %:p:h


" onedark theme settings
 syntax on
 colorscheme onedark

" NERDTree settings && NERDCommenter settings
autocmd StdinReadPre * let s:std_in=1
" open NERDTree by default if no file supplied to vim
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" open NERDTree if opening vim with a folder
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" close vim if nothing but NERDTree is open with q!
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nnoremap <C-\> :NERDTreeToggle<CR>
vnoremap <C-\> :NERDTreeToggle<CR>
map <C-r> :NERDTreeFind<CR>

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
" Remap open file in NERDTree with horizonal split
let g:NERDTreeMapOpenSplit='h'
" Remap open file in NERDTree with vertical split
let g:NERDTreeMapOpenVSplit='v'

" Ctrl + / to comment out code
let g:NERDCreateDefaultMappings = 0
nnoremap <C-_> :call NERDComment(0,"toggle")<CR>
vnoremap <C-_> :call NERDComment(0,"toggle")<CR>

" Deoplete settings
" let g:deoplete#enable_at_startup = 1
" autocmd BufEnter * call ncm2#enable_for_buffer()
" set completeopt=noinsert,menuone,noselect
let g:LanguageClient_autoStop = 0
let g:LanguageClient_serverCommands = {
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio']
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

autocmd FileType ruby setlocal omnifunc=LanguageClient#complete
" --------------------------

" vim-multiple-cursors settings
let g:multi_cursor_start_word_key = '<C-g>'
let g:multi_cursor_start_key = '<C-g>'
let g:multi_cursor_next_key = '<C-g>'
"Cannot yet map ctrl+shift+g to go back. Must investigate."
"https://stackoverflow.com/questions/1506764/how-to-map-ctrla-and-ctrlshifta-differently"

" incseach settings
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Remaps :A to Ctrl+t to jump between file and spec
" Functionality provided by tpope/vim-rails
map <C-t> :A<CR>

" Draw a grey line at the 79 character limit
let &colorcolumn=join(range(81,999),",")
let &colorcolumn="79,".join(range(400,999),",")

" remapDCompactSexyComs = 1uo access vim menu quickly
noremap ; :

" escape clears highlight after search
map <esc> :noh<cr>

" Write all buggers before navigating from vim to tmux pane
let g:tmux_navigator_save_on_switch = 2
" Disable tmux navigator when zooming the vim pane
let g:tmux_navigator_disable_when_zoomed = 1

" Custom key bindings
" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Shortcut to reload your .vimrc config
nnoremap <leader>vr :source $MYVIMRC<CR>

" Map Ctrl+F to find all string matches in all files for the word under your cursor
map <C-F> :execute ":noautocmd vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

" Map Ctrl+Alt+l to autoformat code
map <Leader>cf gg=G<cr>

" Maps Ctrl+d to duplicate and paste the line you are on
map <C-d> yyp

" Set tabs for yaml files to two spaces
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Configure Scratch Plugin
" gs to open scratch
let g:scratch_persistence_file = '.scratch.vim'
let g:scratch_insert_autohide = 0

" FZF Options -------------------------------------
" If in a git directory, load files from root, else from current directory
fun! FzfOmniFiles()
  let is_git = system('git status')
  if v:shell_error
    :Files
  else
    :GFiles --exclude-standard --cached --others
  endif
endfun

let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --smart-case --color "always"
  \ -g "*.{js,jsx,json,php,md,css,scss,haml,erb,html,config,py,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* Rg call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1,
  \  fzf#vim#with_preview({ 'dir': systemlist('git rev-parse --show-toplevel')[0] }),
  \   <bang>0)

" Map ff to fuzzy text search with rg and fzf
map ff :Rg!<cr>
map <C-p> :call FzfOmniFiles() <cr>

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-h': 'split',
  \ 'ctrl-v': 'vsplit' } " TODO: This isnt working!!
" FZF Options End -----------------------------------

" Map Leader + f to toggle code folding
map <Leader>f za

" Map g + b to open FZF :Buffers
map gb :Buffers <cr>

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
" better ultismip keys
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

let g:ycm_autoclose_preview_window_after_insertion = 1

" Ctrl + q escapes from insert mode (remap of escape key)
inoremap <C-q> <Esc>

" Delete all trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Open file in ranger
let g:ranger_map_keys = 0
map <leader>fo :Ranger<CR>

" Load a split into its own tab
nmap <Leader>z :tabnew %<cr>

" Map leader and [ ] to jump between tabs
nnoremap <Leader>] :tabnext<cr>
nnoremap <Leader>[ :tabprevious<cr>
