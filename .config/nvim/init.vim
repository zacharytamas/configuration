" Show the number for the current line and relative numbers for all other
" lines.
set relativenumber number
syntax on

set autoindent
set shiftwidth=2 tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set list listchars=eol:¬

packadd minpac

call minpac#init()

" minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('tpope/vim-surround')
call minpac#add('itchyny/lightline.vim')

packloadall

set laststatus=2 noshowmode

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

