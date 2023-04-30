" dracula theme settings
syntax on
colorscheme dracula

" Draw a grey line at the 79 character limit
let &colorcolumn=join(range(81,999),",")
let &colorcolumn="79,".join(range(400,999),",")
" https://stackoverflow.com/questions/15283410/how-do-i-change-the-background-color-of-current-buffer-or-pane-in-vim
" Dim inactive windows using 'colorcolumn' setting
" This tends to slow down redrawing, but is very useful.
" Based on https://groups.google.com/d/msg/vim_use/IJU-Vk-QLJE/xz4hjPjCRBUJ
" XXX: this will only work with lines containing text (i.e. not '~') from
if exists('+colorcolumn')
  function! s:DimInactiveWindows()
    for i in range(1, tabpagewinnr(tabpagenr(), '$'))
      let l:range = ""
      if i != winnr()
        if &wrap
         " HACK: when wrapping lines is enabled, we use the maximum number
         " of columns getting highlighted. This might get calculated by
         " looking for the longest visible line and using a multiple of
         " winwidth().
         let l:width=256 " max
        else
         let l:width=winwidth(i)
        endif
        let l:range = join(range(1, l:width), ',')
      endif
      call setwinvar(i, '&colorcolumn', l:range)
    endfor
  endfunction
  augroup DimInactiveWindows
    au!
    au WinEnter * call s:DimInactiveWindows()
    au WinEnter * set cursorline
    au WinLeave * set nocursorline
    " Draw a grey line at the 79 character limit
    au WinEnter * let &colorcolumn=join(range(81,999),",")
    au WinEnter * let &colorcolumn="79,".join(range(400,999),",")
  augroup END
endif
