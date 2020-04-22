" textobj-forward - Text objects for a range forward a character.
" Version: 0.2.0
" Author : aikawa 
" License: zlib License

let s:save_cpo = &cpo
set cpo&vim

function! textobj#forward#select()
  return s:select()
endfunction

function! s:select()
  try
    let start = getpos('.')
    let pat = '\V\((\|)\|<\|>,\|.\| \|''\)'

    for i in range(v:count1)
      if !search(pat, 'W')
        return 0
      endif
    endfor
    let end = getpos('.')
    let end[2] -= 1
    echom string(end)
    return ['v', start, end]
  endtry
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
