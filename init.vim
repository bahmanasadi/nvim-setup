execute pathogen#infect()
filetype plugin indent on

" Generic setup
set hlsearch
set ruler
set wildmode=longest,list
set softtabstop=2 expandtab shiftwidth=2 smarttab
set laststatus=2

syntax on
set background=dark
colorscheme solarized

" brackets matching colors
hi MatchParen cterm=bold ctermbg=black ctermfg=white

set nobackup
set nowritebackup
set noswapfile

" ctrlp + ag setup
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


" Neomake setup
if executable('eslint') && executable('flow')
  let g:neomake_javascript_enabled_makers = ['eslint', 'flow']
elseif executable('eslint')
  let g:neomake_javascript_enabled_makers = ['eslint']
elseif executable('flow')
  let g:neomake_javascript_enabled_makers = ['flow']
endif
autocmd BufWritePost,BufEnter * Neomake
autocmd InsertChange,TextChanged * update | Neomake

" Neoforamt setup
let g:neoformat_javascript_jsbeautify = {
      \ 'exe': 'js-beautify',
      \ 'args': ['-s 2', '-X', '-b collapse,preserve-inline']
      \ }
let g:neoformat_enabled_javascript = ['jsbeautify']

" Run Neoformat on file save
augroup fmt
  autocmd!
  autocmd BufWritePre * Neoformat
augroup END
