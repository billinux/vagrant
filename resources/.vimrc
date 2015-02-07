" Init"{{{
" ====
if !1 | finish | endif

" Shell have to display $()
let g:is_posix=1
set nocompatible
filetype plugin off
"}}}
" Mapleader"{{{
" =========
let mapleader=','
"}}}
" Helpers"{{{
" =======
function! s:create_dir(path)
  if !isdirectory(a:path)
    call mkdir(a:path, 'p')
  endif
endfunction
"}}}
" Colors"{{{
" ======
set background=dark
"set t_Co=256
"let base16colorspace=256

"if &t_Co < 256
"  try
"    let base16colorspace=256
"    colorscheme base16-monokai
"  catch
"    colorscheme default
"  endtry
"else
"  try
"    let base16colorspace=256
"    colorscheme molokai
"  catch
"    colorscheme desert
"  endtry
"endif
"}}}
" Encoding"{{{
" ========
scriptencoding utf-8
set termencoding=utf-8
set fileencoding=utf-8
"}}}
" Formatting"{{{
" ==========
set autoindent smartindent
set tabstop=2 shiftwidth=2 softtabstop=2
set shiftround
set expandtab
set textwidth=0
set smarttab
set fileformats=unix,dos,mac
set formatoptions-=r
set formatoptions-=o

vnoremap < <gv
vnoremap > >gv
"}}}
" Search"{{{
" ======
set confirm
set ignorecase
set infercase
set smartcase
set hlsearch
set incsearch
set magic
set showmatch
set matchtime=2
set matchpairs+=<:>

nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v
cnoremap s/ s/\v
noremap <silent> <leader><space> :set hlsearch! hlsearch?<cr>
"}}}
" Shell"{{{
" =====
set shell=sh
"}}}
" Display"{{{
" =======
set backspace=indent,eol,start
set hidden
set ttyfast
set showcmd
set ruler
set laststatus=2
set modeline modelines=5

set number numberwidth=3
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set number
    set relativenumber
  endif
endfunction
nnoremap <leader>; :call NumberToggle()<cr>
"}}}
" Backup, undo, swap, view"{{{
" ========================
set nobackup undofile undoreload=1000 noswapfile
set undodir=$HOME/.cache/.vim/.cache/undo

let undo_dir=expand('~/.cache/.vim/.cache/undo')
if !isdirectory(undo_dir)
  silent call s:create_dir(undo_dir)
endif
"}}}
" list"{{{
" ====
set list
set listchars=tab:>\
set listchars+=eol:$
set listchars+=trail:.
set listchars+=extends:>
set listchars+=precedes:<
set listchars+=nbsp:+
noremap <leader>l :set list! list?<cr>
"}}}
"Errors"{{{
"======
set noerrorbells
set novisualbell
set timeoutlen=500
set t_vb=
"}}}
" Wildmenu"{{{
" ========
set wildmode=list:longest,full
set wildignore+=.hg,.git,.svn,*.o,*.out,*~
""}}}
" Folding"{{{
" =======
function! NeatFoldText()"{{{
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()
"}}}
set foldenable
set foldmethod=marker
set foldlevelstart=0
"}}}
" Windows"{{{
" =======
set splitbelow
set splitright
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
"}}}
" PasteToggle"{{{
" ===========
map ;; :set invpaste<cr>:set paste?<cr>
map <leader>, :set invpaste<cr>:set paste?<cr>
"}}}
" Mappings"{{{
" ========
inoremap jj <esc>
inoremap jk <esc>
inoremap kk <esc>
inoremap hh <esc>
inoremap jk <esc>

noremap <leader>q :qa!<cr>
noremap Y y$

nnoremap VV V
nnoremap Vit vitVkoj
nnoremap Vat vatV
nnoremap Vab vabV
nnoremap VaB vaBV

map <F11> :let &background = ( &background == "dark"? "light" : "dark" )<cr>
nnoremap <down> :bprev<cr>
nnoremap <up> :bnext<cr>
nnoremap <left> :tabnext<cr>
nnoremap <right> :tabprev<cr>
"}}}
" Omnicompletion"{{{
" ==============
set omnifunc=syntaxcomplete#Complete
"}}}
" AutoCommands"{{{
" ============
augroup VIMRC
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos ("'\""))
augroup END
"}}}
" Bundles"{{{
" =======
let iCanHazNeoBundle=1
let NeoBundle_readme=expand('~/.cache/.vim/neobundle/neobundle.vim/README.md')
if !filereadable(NeoBundle_readme)
  echo "Installing NeoBundle..."
  echo ""
  silent !mkdir -p ~/.cache/.vim/neobundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.cache/.vim/neobundle/neobundle.vim
  let iCanHazNeoBundle=0
endif

if has('vim_starting')
  set runtimepath+=~/.cache/.vim/neobundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.cache/.vim/neobundle/'))

" NeoBundles
" ----------
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim', {
  \ 'build': {
  \      'linux' : 'make',
  \      'unix'  : 'gmake'
  \    }
  \}

NeoBundle 'chriskempson/base16-vim'


filetype plugin indent on
syntax enable

if iCanHazNeoBundle == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :NeoBundleInstall
endif

call neobundle#end()
:NeoBundleCheck
"}}}


"Vim: set ft=vim sw=2 ts=2 sts=2 ff=unix fenc=utf-8:
