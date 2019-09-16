" vim:fdm=marker

source ~/.config/nvim/plugins.vim
source ~/.config/nvim/denite-config.vim
source ~/.config/nvim/airline-config.vim
source ~/.config/nvim/keymaps.vim

" Don't show the previous command executed
set noshowcmd

set cmdheight=1

" Hide buffers when closed instead of completely closing them
" (this makes it easy to automatically call them back up later)
set hidden

" Configure my preference for tabs: soft tabs of two spaces each.
set shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" Allow using mouse if I accidentally use it.
set mouse=a

" Rebind Up and Down arrow keys to use line-wrap-aware motion.
nmap <Down> gj
nmap <Up> gk

" Add a blank line below the current line
map <leader><Enter> o<ESC>

" Make new horizontal splits below and vertical splits to the right
set splitbelow splitright

" Enable true color support
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" let g:oceanic_next_terminal_bold = 1
" let g:oceanic_next_terminal_italic = 1
" colorscheme OceanicNext
colo challenger_deep

" Automatically reload buffers that were changed outside of Vim.
set autoread
" Show line number of current line and others as relative to current line.
set number relativenumber

" Pressing <Space> in normal mode is the same as <PageDown>
" Pressing - in normal mode is the same as <PageUp>
noremap <Space> <PageDown>
noremap -       <PageUp>

set showtabline=2 noshowmode
set autoindent

" Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Use K to show documentation in preview window
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nnoremap <silent> K :call <SID>show_documentation()<CR>

" Automatically resize splits when resizing window
autocmd VimResized * wincmd =

" Don't use swap files, etc. It's annoying to reconcile later.
set noswapfile nobackup nowb

" === NeoSnippet === "
" Map <C-k> as shortcut to activate snippet if available
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" Load custom snippets from snippets folder
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'

" Hide conceal markers
let g:neosnippet#enable_conceal_markers = 0

" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" === echodoc === "
" Enable echodoc on startup
let g:echodoc#enable_at_startup = 1

" === vim-javascript === "
" Enable syntax highlighting for JSDoc
let g:javascript_plugin_jsdoc = 1

" Reload icons after init source
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif
