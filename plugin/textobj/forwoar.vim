" textobj-forward - Text objects for a range forward a character.
" Version: 0.2.0
" Author : thinca <thinca+vim@gmail.com>
" License: zlib License

if exists('g:loaded_textobj_forward')
  finish
endif
let g:loaded_textobj_forward = 1

let s:save_cpo = &cpo
set cpo&vim

" Interface  "{{{1
call textobj#user#plugin('forward', {
\      '-': {
\        'forward': ';',  '*select-a-function*': 'textobj#forward',
\      }
\    })


let &cpo = s:save_cpo
unlet s:save_cpo
