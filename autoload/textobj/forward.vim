" textobj-forward - Text objects for a range forward a character.
" Version: 0.2.0
" Author : thinca <thinca+vim@gmail.com>
" License: zlib License

let s:save_cpo = &cpo
set cpo&vim

function! textobj#forward()
  return s:select()
endfunction

function! s:select()
  let c = getchar()
  if type(c) == type(0)
    let c = nr2char(c)
  endif
  if c !~ '[[:print:]]'
    return 0
  endif

  let save_ww = &whichwrap
  set whichwrap=h,l

  try
    let start = getpos('.')
    let pat = c == '\' ? '\\' : '\V' . c
    for i in range(v:count1)
      if !search(pat, 'bW')
        return 0
      endif
    endfor
    " let start = getpos('.')

    call setpos('.', pos)
    for i in range(v:count1)
      if !search(pat, 'W')
        return 0
      endif
    endfor
    let end = getpos('.')
    return ['v', start, end]
  finally
    let &whichwrap = save_ww
  endtry
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
