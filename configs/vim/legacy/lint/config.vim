" ALE linting
let g:ale_lint_on_save = 0
let g:ale_fix_on_save = 0
let g:ale_enabled = 0

" Leader ll to toggle on and off linter
nmap <Leader>ll :ALEToggle<CR>

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0

" JAVASCRIPT:
let g:ale_linters = {
\   'javascript': ['prettier', 'eslint']
\}
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint']
\}

" PYTHON:
let g:ale_linters = {
\   'python': ['flake8', 'pylint']
\}
let g:ale_fixers = {
\   'python': ['autopep8', 'yapf']
\}
