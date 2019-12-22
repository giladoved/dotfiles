" =================================== "
" ======== Gilad Oved © 2019 ========
" ======== neovim config file =======
" ====== inspired by dougblack ======
" =================================== "

" Plugins {{{
" ==========
call plug#begin('~/.config/nvim/plugged')

" Vim Color Theme
Plug 'mhartington/oceanic-next'

" Commenting support (gc)
Plug 'tpope/vim-commentary'

" Directory viewer
Plug 'scrooloose/nerdtree'

" Autocomplete ctrl-n
Plug 'Shougo/deoplete.nvim'

" Fuzzy find
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Super undo
Plug 'mbbill/undotree'

call plug#end()
" ==========
" }}}

" Colors {{{
" ==========
" OceanicNext colorscheme requires termguicolors
set termguicolors

" enable syntax processing
syntax enable

" set color theme
colorscheme OceanicNext
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
set cursorline

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
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.rb :call <SID>StripTrailingWhitespaces()
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

" -- undotree --
" toggle super undo with <F5>
nnoremap <F5> :UndotreeToggle<CR>

" -- fzf --
" fuzzy find
nnoremap <C-t> :Files<CR>
" }}}

" Custom folds for this settings file = default all folded
" vim:foldmethod=marker:foldlevel=0
