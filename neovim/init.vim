" ========= Install plugins ========= "
" Install vim-plug for plugins
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" Install plugins
call plug#begin('~/.config/nvim/plugged')

" Vim theme
Plug 'chriskempson/base16-vim'

" Commenting support (gc)
Plug 'tpope/vim-commentary'

" Smart pane switching
Plug 'christoomey/vim-tmux-navigator'

" Directory viewer
Plug 'scrooloose/nerdtree'

" Autocomplete ctrl-n
Plug 'Shougo/deoplete.nvim'

" Fuzzy find
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'


call plug#end()


" ========= Options ========= "
" disable compatibility to old vim
set nocompatible

" add line numbers
set number

" get bash-like tab completions
set wildmode=longest,list

" show matching brackets
set showmatch

" place the cursor, visual mode on click, mouse scrolling
set mouse=a

" change the vim leader from \ to ,
let mapleader=","

" syntax highlighting
if !exists("g:syntax_on")
	syntax enable
endif

" highlights the search matches
set hlsearch

" incremental searching, each character updates search
set incsearch

" turn off error beeping and flashing
set visualbell
set errorbells

" visually wrap long lines to see everything
set wrap
set textwidth=0

" allow backspacing over everything
set backspace=indent,eol,start

" indent a new line the same amount as the line just typed
set autoindent

" tab is four spaces
set tabstop=4

" copy the previous indentation on autoindenting
set copyindent

" number of spaces to use for autoindenting
set shiftwidth=4

" use multiple of shiftwidth when indenting with '<' and '>'
set shiftround

" insert tabs on the start of a line according to shiftwidth, not tabstop
set smarttab

" ignore case if search pattern is all lowercase, otherwise case sensitive
set smartcase

" wildcard ignore for search
set wildignore+=*.pyc,*.o,*.class,*.lo,.git

" no vim backup
set nobackup
set noswapfile

" tab button is 4 spaces
set expandtab

" remember more commands and search history
set history=1000

" remember more levels of undo
set undolevels=1000

" persistant undo history
set undodir=~/.config/nvim/undodir

" save undos when file is closed
set undofile

" number of lines to save for undo
set undoreload=10000


" ========= File Types ======== "
" filetype detection
filetype plugin indent on

" recognize markdown files
augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" set spell for text files
if version >= 700
  autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en_us
  autocmd FileType tex setlocal spell spelllang=en_us
endif

" highlight trailing whitespace
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/

" autoremove trailing spaces when saving the buffer
autocmd FileType c,cpp,elixir,eruby,html,java,javascript,php,ruby autocmd BufWritePre <buffer> :%s/\s\+$//e

" highlight too-long lines
autocmd BufRead,InsertEnter,InsertLeave * 2match LineLengthError /\%126v.*/
highlight LineLengthError ctermbg=black guibg=black
autocmd ColorScheme * highlight LineLengthError ctermbg=black guibg=black

" set up highlight group & retain through colorscheme changes
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red


" ========= Theme ======== "
" Base16 vim colorscheme
let base16colorspace=256
if !exists('g:colors_name') || g:colors_name != 'base16-oceanicnext'
  colorscheme base16-oceanicnext
endif


" ========= Plugin Options ======== "
" which file types NERDtree should ignore
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$', '\.so$', '^\.git$', '__pycache__', '\.DS_Store', '\.class$' ]


" ========= Shortcuts ======== "
" no need to press shift ; for every vim command
nnoremap ; :

" when moving up/down do not jump over long wrapped lines
nnoremap j gj
nnoremap k gk

" paste toggle with F2
set pastetoggle=<F2>

" toggling NERDTree
map <silent> <leader>nt :NERDTreeToggle<CR>

" fuzzy find
nnoremap <C-t> :Files<CR>
