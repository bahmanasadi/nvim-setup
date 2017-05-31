execute pathogen#infect()
filetype plugin indent on

" Generic setup
set hlsearch
set ruler
set wildmode=longest,list
set softtabstop=2 expandtab shiftwidth=2 smarttab
set laststatus=2

syntax on
set background=light
colorscheme solarized

if has('mouse') | set mouse=a | endif

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
let eslint_exec = $PWD .'/node_modules/.bin/eslint'
let flow_exec = $PWD .'/node_modules/.bin/flow'
if executable(eslint_exec) && executable(flow_exec)
  let g:neomake_javascript_eslint_exe = eslint_exec
  let g:neomake_javascript_flow_exe = flow_exec
  let g:neomake_javascript_enabled_makers = ['eslint', 'flow']
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
