if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif


" Install plugins
call plug#begin('~/.config/nvim/plugged')

" Vim plugins
Plug 'chriskempson/base16-vim'
Plug 'wincent/command-t'
Plug 'elixir-lang/vim-elixir'
Plug 'scrooloose/nerdtree'
Plug 'jtratner/vim-flavored-markdown'
Plug 'christoomey/vim-tmux-navigator'


" Autocomplete
Plug 'Shougo/deoplete.nvim'

" Commenting support (gc)
Plug 'tpope/vim-commentary'


" Haskell
Plug 'benekastah/neomake'
Plug 'janko-m/vim-test'
Plug 'raichoo/haskell-vim',           {'for': 'haskell'}
Plug 'bitc/vim-hdevtools',            {'for': 'haskell'}
Plug 'eagletmt/ghcmod-vim',           {'for': 'haskell'}
Plug 'eagletmt/neco-ghc'
Plug 'Twinside/vim-hoogle',           {'for': 'haskell'}

call plug#end()


" Haskell
set tags=tags;/,codex.tags;/

" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0

autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

autocmd FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
autocmd FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
autocmd FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>

let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typeroles = 1
let g:haskell_enable_static_pointers = 1
" ~~~~~ "



" Vimrc
set nocompatible


" ========= Options =========

syntax on
set hlsearch
set number
set showmatch
set incsearch
set background=dark
set hidden
set visualbell
set backspace=indent,eol,start
set textwidth=0 nosmartindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set wrap
set dir=/tmp//
set scrolloff=5
set ignorecase
set smartcase
set wildignore+=*.pyc,*.o,*.class,*.lo,.git
set mouse=

filetype plugin indent on

if version >= 703
  set undodir=~/.vim/undodir
  set undofile
  set undoreload=10000
endif
set undolevels=1000

" File Types
augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

autocmd FileType tex setlocal textwidth=78
autocmd BufNewFile,BufRead *.txt setlocal textwidth=78

if version >= 700
  autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en_us
  autocmd FileType tex setlocal spell spelllang=en_us
endif

" Highlight trailing whitespace
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/

" Autoremove trailing spaces when saving the buffer
autocmd FileType c,cpp,elixir,eruby,html,java,javascript,php,ruby autocmd BufWritePre <buffer> :%s/\s\+$//e

" Highlight too-long lines
autocmd BufRead,InsertEnter,InsertLeave * 2match LineLengthError /\%126v.*/
highlight LineLengthError ctermbg=black guibg=black
autocmd ColorScheme * highlight LineLengthError ctermbg=black guibg=black

" Set up highlight group & retain through colorscheme changes
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" Auto reload vimrc
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" Sharing nvim data
augroup nvimrc_aucmd
  autocmd!
  autocmd CursorHold * rshada|wshada
augroup END


syntax enable

" Base16 vim colorscheme
let base16colorspace=256
if !exists('g:colors_name') || g:colors_name != 'base16-oceanicnext'
  colorscheme base16-oceanicnext
endif

"set background=dark
"colorscheme solarized
"colorscheme monokai
"colorscheme base16-oceanicnext

" ========= Plugin Options ========

let NERDTreeIgnore=['\.pyc$', '\.o$', '\.class$', '\.lo$']

" Not working...
set wildignore+=*.pyc,*.o,*.class,*.lo,.git,vendor/*,node_modules/**,bower_components/**,*/build_gradle/*,*/build_intellij/*,*/build/*,*/_build/*

" ========= Shortcuts ========

" No need to press shift ; for every vim command
nnoremap ; :

" NERDTree
map <silent> <leader>nt :NERDTreeToggle<CR>

" Fuzzy Find
map <silent> <leader>ff :CommandT<CR>
map <silent> <leader>fr :CommandTFlush<CR>

" Set paste with leader-pp
map <silent> <leader>pp :set paste!<CR>

