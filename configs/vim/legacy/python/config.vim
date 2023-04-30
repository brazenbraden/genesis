let g:python_host_prog = '/usr/local/opt/python@3.8/bin/python3'

" PYTHON STUFF
nnoremap <Leader>rp :!python3 %:p<cr>

" YouCompleteMe configuration
let g:ycm_python_interpreter_path = '/opt/anaconda3/envs/opencv/bin/python3'
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/global_extra_conf.py'

