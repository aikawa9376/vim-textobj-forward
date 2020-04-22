" textobj-forward - Text objects for a range forward a character.
" Version: 0.2.0
" Author : aikawa 
" License: zlib License

let s:save_cpo = &cpo
set cpo&vim

function! textobj#forward#select_i()
  return s:select('i')
endfunction

function! textobj#forward#select_a()
  return s:select('a')
endfunction

function! s:select(flag)
  try
    let start = getpos('.')

    if a:flag == 'i'
      let pat = '\V\((\|<\|{\|[\|,\|;\)'
    else
      let pat = '\V\( \|''\|/\||\)'
    endif

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
