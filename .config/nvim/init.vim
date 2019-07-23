set nocompatible
" Show the number for the current line and relative numbers for all other
" lines.
set relativenumber number
" set Vim-specific sequences for RGB colors
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

syntax on
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set autoindent
set shiftwidth=2 tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set cmdheight=2
set updatetime=300
set signcolumn=yes  " always show signcolumns

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

packadd minpac

call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('tpope/vim-surround')
call minpac#add('itchyny/lightline.vim')
call minpac#add('scrooloose/nerdtree')
call minpac#add('w0rp/ale')
call minpac#add('nathanaelkane/vim-indent-guides')
call minpac#add('neoclide/coc.nvim', {'branch': 'release'})
call minpac#add('sheerun/vim-polyglot')
call minpac#add('HerringtonDarkholme/yats.vim')
call minpac#add('junegunn/fzf')
call minpac#add('prettier/vim-prettier')
call minpac#add('aonemd/kuroi.vim')

packloadall

set laststatus=2 noshowmode

command! -nargs=0 Prettier :CocCommand prettier.formatFile
nnoremap <C-p> :<C-u>FZF<CR>
nnoremap <D-.> :CocAction
set mouse=a

let g:lightline = { }
if strftime('%H') >= 7 && strftime('%H') < 19
  set background=light
else
  set background=dark
endif
colorscheme kuroi
