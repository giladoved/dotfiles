" =================================== "
" ======== Gilad Oved © 2020 ========
" ======== neovim config file =======
" ====== inspired by dougblack ======
" ====== inspired by martin-svk =====
" =================================== "

" Plugins {{{
" ==========

" Auto install Plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

" --------------------------------------------------
" 1.1 General tools - colors, linters, formatting, etc.
" --------------------------------------------------

" Vim Color Theme
Plug 'mhartington/oceanic-next'
" Commenting support (gc), gcc to comment line
Plug 'tpope/vim-commentary'
" CamelCase and snake_case motions
Plug 'bkad/CamelCaseMotion'
" Auto tabbing and spacing
Plug 'tpope/vim-sleuth'
" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Smooth scrolling
Plug 'psliwka/vim-smoothie'
" Intelligent buffer closing
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
" Vim Maximizer will make the current window 'fullscreen'
Plug 'szw/vim-maximizer'


" --------------------------------------------------
" 1.2 Javascript
" --------------------------------------------------

" Javascript
Plug 'pangloss/vim-javascript'
" JSX
Plug 'mxw/vim-jsx', { 'for': ['jsx', 'javascript.jsx'] }
" JSX React
Plug 'peitalin/vim-jsx-typescript'
" Typescript
Plug 'leafgarland/typescript-vim'


" --------------------------------------------------
" 1.3 HTML/CSS
" --------------------------------------------------

" HTML5 syntax
Plug 'othree/html5.vim'
" HTML Tag Closing
Plug 'alvan/vim-closetag'
" SCSS syntax
Plug 'cakebaker/scss-syntax.vim'
" Color highlighter
Plug 'lilydjwg/colorizer', { 'for': ['css', 'sass', 'scss', 'less', 'html', 'xdefaults', 'javascript', 'javascript.jsx', 'vim'] }


" --------------------------------------------------
" 1.4 Ruby
" --------------------------------------------------

" Rails highlighting
Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby', 'haml', 'slim'] }
" Rails do end autowriting
Plug 'tpope/vim-endwise'
" Rails testing
Plug 'janko-m/vim-test'


" --------------------------------------------------
" 1.5 Other languages
" --------------------------------------------------

" Elixir syntax
Plug 'elixir-lang/vim-elixir'
" Yaml indentation
Plug 'martin-svk/vim-yaml'
" Markdown syntax
Plug 'tpope/vim-markdown'
" Git syntax
Plug 'tpope/vim-git'
" Tmux syntax
Plug 'keith/tmux.vim'
" Dockerfile
Plug 'honza/dockerfile.vim'
" GraphQL
Plug 'jparise/vim-graphql'
"JSON syntax
Plug 'sheerun/vim-json'


" --------------------------------------------------
" 1.6  FZF Fuzzy Searcher
" --------------------------------------------------

" Fuzzy find
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'


" --------------------------------------------------
" 1.7 Interface improving
" --------------------------------------------------

" Directory viewer
Plug 'scrooloose/nerdtree'
" Lightline (simple status line)
Plug 'itchyny/lightline.vim'
" Super undo - F5
Plug 'mbbill/undotree'


call plug#end()
" ==========
" }}}


" basic settings
set shell=/bin/zsh                          " Setting shell to zsh
set number                                  " Just absolute numbers
set showmode                                " Always show mode
set nowrap                                  " Do not wrap long line
set showcmd                                 " Show commands as you type them
set cmdheight=1                             " Command line height
set pumheight=10                            " Completion window max size
set noswapfile                              " New buffers will be loaded without creating a swapfile
set clipboard+=unnamed                      " Allow to use system clipboard

                                            " As it turns out, there is a negative performce issue when having lazy redraw
                                            " on while use tmux. It causes an ugly redraw that makes the entire pane blank
set nolazyredraw                            " Don't redraw while executing macros (better performance)

set showmatch                               " Show matching brackets when text indicator is over them
set matchtime=2                             " How many tenths of a second to blink when matching brackets
set nostartofline                           " Keep cursor in the same column when moving up or down
set virtualedit=block                       " To be able to select past EOL in visual block mode
set nojoinspaces                            " No extra space when joining a line which ends with . ? !
set scrolloff=5                             " Scroll when closing to top or bottom of the screen
set updatetime=300                          " Update time used to create swap file or other things
set suffixesadd+=.js,.rb                    " Add js and ruby files to suffixes, to help 'gf'
set cursorline                              " Highlight the active line but only style the line number highlight

" split settings
set splitbelow                              " Splitting a window will put the new window below the current
set splitright                              " Splitting a window will put the new window right of the current

" timeout settings
" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely. (by Steve Losh)
set notimeout
set ttimeout
set ttimeoutlen=10

" search
set ignorecase                              " Ignore case by default
set smartcase                               " Make search case sensitive only if it contains uppercase letters
set wrapscan                                " Search again from top when reached the bottom
set nohlsearch                              " Don't highlight after search

" undo history
if has('persistent_undo')
  set undofile                              " Save undos when file is closed
  set undodir=~/.config/nvim/tmp/undo//     " Persistant undo history
  set undolevels=1000                       " Number of changes to save for undo
  set history=200                          " Number of vim commands and search history to save
endif

" Whitespace characters
set list                                    " Show listchars by default
set listchars=tab:▸\ ,extends:❯,precedes:❮,trail:·

" Filetype settings
filetype plugin on
filetype indent on

" folding settings
" set foldmethod=marker                       " Markers are used to specify folds.
" set foldlevel=2                             " Start folding automatically from level 2
" set fillchars="fold: "                      " Characters to fill the statuslines and vertical separators

"omni completion
set completeopt-=preview                    " Don't show preview scratch buffers
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=tmp/**
set wildignore+=*.pyc,*.class,*.lo,.git

" neovim settings
let g:loaded_python_provider=1              " Disable python 2 interface
let g:python_host_skip_check=1              " Skip python 2 host check
" Creates a special virtualenvironment for neovim so packages do not need to
" be reinstalled in each new virtual environment
let g:python3_host_prog=$HOME."/.pyenv/versions/neovim_python_venv/bin/python"




" Mappings
let g:mapleader=","                         " Set leader to comma

" disable arrow keys to become legit
nnoremap <up> <NOP>
nnoremap <down> <NOP>
nnoremap <left> <NOP>
nnoremap <right> <NOP>
inoremap <up> <NOP>
inoremap <down> <NOP>
inoremap <left> <NOP>
inoremap <right> <NOP>

" easier window switching
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Native Neovim terminal switching
tnoremap <Esc> <C-\><C-n>
" tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" Move cursor by display lines when wrapping
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" use gj gk to go quicker
nnoremap gj 5j
nnoremap gk 5k
vnoremap gj 5j
vnoremap gk 5k

" When jump to next match also center screen
" Note: Use :norm! to make it count as one command. (i.e. for i_CTRL-o)
nnoremap <silent> n :norm! nzz<CR>
nnoremap <silent> N :norm! Nzz<CR>
vnoremap <silent> n :norm! nzz<CR>
vnoremap <silent> N :norm! Nzz<CR>

" " Same when moving up and down
" nnoremap <C-u> <C-u>zz
" nnoremap <C-d> <C-d>zz
" nnoremap <C-f> <C-f>zz
" nnoremap <C-b> <C-b>zz
" vnoremap <C-u> <C-u>zz
" vnoremap <C-d> <C-d>zz
" vnoremap <C-f> <C-f>zz
" vnoremap <C-b> <C-b>zz

" H and L to go to beginning and end of line
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L g_

" More logical Y (default was alias for yy)
nnoremap Y y$

" Don't yank to default register when changing something
nnoremap c "xc
xnoremap c "xc

" After block yank and paste, move cursor to the end of operated text and don't override register
vnoremap y y`]
vnoremap p "_dP`]
nnoremap p p`]

" Use CamelCaseMotion instead of default motions
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

" Fix the cw at the end of line bug default vim has special treatment (:help cw)
nmap cw ce
nmap dw de

" Uppercases word in insert mode
inoremap <C-u> <ESC>mzgUiw`za

" Matching brackets with TAB (using matchit) (Breaks the <C-i> jump)
map <TAB> %
silent! unmap [%
silent! unmap ]%

" Don't cancel visual select when shifting
xnoremap <  <gv
xnoremap >  >gv

" Terminal mode mappings
if has('nvim')
  tnoremap <ESC> <C-\><C-n>
  tnoremap ,<ESC> <ESC>
endif

" Stay down after creating fold
vnoremap zf mzzf`zzz

" common tasks
" Quick save and close buffer
nnoremap <leader>s :w<CR>
nnoremap <silent> <leader>w :Sayonara!<CR>
nnoremap <silent> <leader>q :Sayonara<CR>

" Yank and paste from clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>yy "+yy
nnoremap <leader>p "+p

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Reselect last-pasted text
nnoremap gp `[v`]

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" [S]plit line (sister to [J]oin lines) S is covered by cc.
nnoremap S mzi<CR><ESC>`z

" Start substitute on current word under the cursor
" nnoremap <Space>s :%s///gc<Left><Left><Left>

" Start search on current word under the cursor
" nnoremap <Space>/ /<CR>

" Start reverse search on current word under the cursor
" nnoremap <Space>? ?<CR>

" Faster sort
" vnoremap <Space>s :!sort<CR>

" windows and buffers

" Buffers navigation and management
nnoremap <silent> + :bn<CR>
nnoremap <silent> _ :bp<CR>

" ALT-HJKL to change 10x horizontal window resize
map <silent> ¬ 10<C-w>>
map <silent> ˙ 10<C-w><
map <silent> ∆ 10<C-w>-
map <silent> ˚ 10<C-w>+

" Toggle fullscreen window
nnoremap <silent> <C-w>z :MaximizerToggle<CR>
inoremap <silent> <C-w>z :MaximizerToggle<CR>

" Quiting and saving all
cnoremap ww wqall
cnoremap qq qall


" jk is <esc> in insert mode
inoremap jk <esc>

" no need to press shift ; for every vim command
nnoremap ; :

" no vim backup
set nobackup

" turn off search highlight with <esc><esc> (double tab escape)
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>



" Make sure Vim returns to the same line when you reopen a file. Thanks, Amit and Steve Losh.
augroup line_return
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END





" Plugin settings

" vimplug
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pu :PlugUpdate<CR>
nnoremap <leader>pU :PlugUpgrade<CR>
nnoremap <leader>pc :PlugClean<CR>







" = lightline
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'tab': {
      \   'active': [ 'filename' ],
      \   'inactive': [ 'filename' ]
      \ },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename' ], [ 'session' ],  ['cocstatus' ] ],
      \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'filetype', 'fileencoding' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"HELP":&readonly?"RO":""}'
      \ },
      \ 'component_function': {
      \   'mode': 'utils#lightLineMode',
      \   'filename': 'utils#lightLineFilename',
      \   'fileencoding': 'utils#lightLineFileencoding',
      \   'cocstatus': 'coc#status',
      \ },
      \ 'component_expand': {
      \   'session': 'utils#lightLineSession'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&readonly)'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

" Changes the lightline middle color for the active buffer
" This helps a lot with finding out which split is active
" Howver it's confusing as to which 256 color is magenta (the one set in alacritty.yaml)
let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
" Active buffer gets yellow middle bar color
let s:palette.normal.middle = [ [ "#30302c", "#1f9966", 236, 222 ] ]
" Inctive buffers get usual middle bar color
let s:palette.inactive.middle = [ [ "#30302c", "#30302c", 236, 236 ] ]



" Colors {{{
" ==========
" Syntax highlighting
syntax on

" OceanicNext colorscheme requires termguicolors
if (has("termguicolors"))
  set termguicolors
end

" Color scheme
colorscheme OceanicNext
" colorscheme base16-railscasts
" colorscheme base16-ocean

" ==========
" }}}

" Spelling {{{
" ==========
set spellfile=~/.config/nvim/spell/dictionary.utf-8.add
set spelllang=en_us                         " Set language to US English
set nospell                                 " Disable checking by default

" Fix spelling error on the go
inoremap <C-s> <C-g>u<ESC>[s1z=`]a<C-g>u

" Fix spelling error in normal mode
nnoremap <C-s> <C-g>u<ESC>[s1z=`]a<C-g>u

" toggle spelling with F4 key
map <F4> :set spell!<CR><Bar>:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>

"Turn spellcheck on for markdown files
autocmd BufNewFile,BufRead *.md setlocal spell
autocmd BufNewFile,BufRead *.md setlocal tw=80

" = SPELLING
" ==========
" }}}

" Tabs & Spaces {{{
" ==========
" when vim opens a file and sees a <tab> it displays 4 spaces
set tabstop=4

" size of an indent
set shiftwidth=4

" when editing, number of spaces inserted for a <tab>
" number of spaces deleted when pressing <delete>
set softtabstop=4

" pressing tab is the same as pressing x spaces
" convert tabs to spaces
set expandtab

" turns on filetype detection
" allows loading of language specific indentation files based on that detection
filetype plugin indent on

" allow backspace to delete anything in insert mode
set backspace=indent,eol,start

" indent a new line the same amount as the line just typed
set autoindent

" ==========
" }}}

" UI {{{
" ==========
" add line numbers
set number

" highlight the current line the cursor is on
" set cursorline

" do not redraw in the middle of macros
set lazyredraw

" show matching brackets
set showmatch

" place the cursor when clicking
" activate visual mode on click
" allow mouse scrolling
set mouse=a

" turn off error beeping and flashing
set visualbell
set errorbells

" character to use as wall between vertical vim pane splits
set fillchars+=vert:┃
" ==========
" }}}

" Search {{{
" ==========
" search as characters are entered
set incsearch

" highlight matches
set hlsearch

" turn off search highlight with <esc><esc> (double tab escape)
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" ignore case if search pattern is all lowercase, otherwise case sensitive
set smartcase

" wildcard ignore for search
set wildignore+=*.pyc,*.o,*.class,*.lo,.git
" ==========
" }}}

" Folding {{{
" ==========
"  show all the folds
set foldenable

" when opening a new file, show no folds
" set nofoldenable

" starting fold level when opening a new file
" 0 - all folds are closed
" 99 - all folds are open
" 10 - only very nested blocks are folded when opening new file
set foldlevelstart=10

" guards you against too many nested folds
set foldnestmax=10

" custom folds for this file
set modelines=1

" <space> opens/closes the fold around the current block
nnoremap <space> za

" fold method based on syntax
set foldmethod=indent

" Custom text when a block is folded - Title .... x lines [ y% ]
set foldtext=CustomFoldText('.')
" ==========
" }}}

" Shortcuts {{{
" ==========
" vertically travel over wrapped lines as if it was two lines
nnoremap j gj
nnoremap k gk

" change the vim leader from \ to ,
let mapleader=","

" jk is <esc> in insert mode
inoremap jk <esc>

" save session
nnoremap <leader>s :mksession<CR>

" cu (clean-up) to reformat whole file
nnoremap cu gg=G``

" no need to press shift ; for every vim command
nnoremap ; :

" paste toggle with F2
set pastetoggle=<F2>
" ==========
" }}}

" Backup {{{
" ==========
" no vim backup
set nobackup
set noswapfile

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
" ==========
" }}}

" Autogroups {{{
" ==========
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

" language-specific settings for certain filetypes/file extensions - dougblack
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
    autocmd BufEnter *.py setlocal tabstop=4
    autocmd BufEnter *.md setlocal ft=markdown
    autocmd BufEnter *.go setlocal noexpandtab
    autocmd BufEnter *.avsc setlocal ft=json
augroup END
" ==========
" }}}

" Custom Functions {{{
" ==========
" https://github.com/chrisbra/vim_dotfiles/blob/master/plugin/CustomFoldText.vim
fu! CustomFoldText(string)
    "get first non-blank line
    let fs = v:foldstart
    if getline(fs) =~ '^\s*$'
        let fs = nextnonblank(fs + 1)
    endif
    if fs > v:foldend
        let line = getline(v:foldstart)
    else
        let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
    endif
    let pat  = matchstr(&l:cms, '^\V\.\{-}\ze%s\m')
    " remove leading comments from line
    let line = substitute(line, '^\s*'.pat.'\s*', '', '')
    " remove foldmarker from line
    let pat  = '\%('. pat. '\)\?\s*'. split(&l:fmr, ',')[0]. '\s*\d\+'
    let line = substitute(line, pat, '', '')

    let w = get(g:, 'custom_foldtext_max_width', winwidth(0)) - &foldcolumn - (&number ? 8 : 0)
    let foldSize = 1 + v:foldend - v:foldstart
    let foldSizeStr = " " . foldSize . " lines "
    let foldLevelStr = '+'. v:folddashes
    let lineCount = line("$")
    if has("float")
        try
            let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
        catch /^Vim\%((\a\+)\)\=:E806/	" E806: Using Float as String
            let foldPercentage = printf("[of %d lines] ", lineCount)
        endtry
    endif
    if exists("*strwdith")
        let expansionString = repeat(a:string, w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
    else
        let expansionString = repeat(a:string, w - strlen(substitute(foldSizeStr.line.foldLevelStr.foldPercentage, '.', 'x', 'g')))
    endif
    return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endf
" ==========
" }}}

" Plugin Options {{{
" ==========
" -- NERDTree --
" which file types NERDtree should ignore
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$', '\.so$', '^\.git$', '__pycache__', '\.DS_Store', '\.class$' ]
" toggling NERDTree
map <silent> <leader>nt :NERDTreeToggle<CR>
" NERDTree wrapper
" nnoremap <silent> <Space>n :call utils#nerdWrapper()<CR>
" Source (reload configuration)
nnoremap <silent> <F5> :source $MYNVIMRC<CR>


" -- undotree --
" toggle super undo with <F5>
nnoremap <F5> :UndotreeToggle<CR>

" -- fzf --
" fuzzy find
nnoremap <C-t> :Files<CR>

" rails testing
nmap <silent> <leader>rn :TestNearest<CR>
nmap <silent> <leader>rf :TestFile<CR>
nmap <silent> <leader>rl :TestLast<CR>



" ==========
" }}}


" Custom folds for this settings file = default all folded
" vim:foldmethod=marker:foldlevel=0
