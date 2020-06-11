" ============================================ "
"  Created On           : August 6th, 2017
"  Forked from          : thebearjew/dotfiles
" ============================================ "


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
" Git Branch on lightline
Plug 'itchyny/vim-gitbranch'
" Sessions
Plug 'tpope/vim-obsession'


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
" JSON5 syntax
Plug 'GutenYe/json5.vim'
" Elm
Plug 'elmcast/elm-vim'
" Tmux syntax
Plug 'keith/tmux.vim'


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


" Basic Settings {{{
" ==========

let g:mapleader=","                         " Set leader to comma

set shell=/bin/zsh                          " Setting shell to zsh
set updatetime=300                          " Time Vim waits after you stop typing before it triggers the plugin
set nostartofline                           " Keep cursor in the same column when moving up or down
set virtualedit=block                       " To be able to select past EOL in visual block mode
set scrolloff=5                             " Scroll when closing to top or bottom of the screen

" ==========
" }}}


" UI {{{
" ==========

set cursorline                              " Highlight the active line but only style the line number highlight
set showmatch                               " Show matching brackets when text indicator is over them
set matchtime=2                             " How many tenths of a second to blink when matching brackets

                                            " As it turns out, there is a negative performce issue when having lazy redraw
                                            " on while use tmux. It causes an ugly redraw that makes the entire pane blank
set nolazyredraw                            " Don't redraw while executing macros (better performance)

set showcmd                                 " Show commands as you type them
set number                                  " Just absolute numbers
set noshowmode                              " Don't show mode, lightline will show it instead
set nowrap                                  " Do not wrap long line
set cmdheight=1                             " Command line height
set pumheight=10                            " Completion window max size
set visualbell                              " turn off error flashing
set errorbells                              " turn off error beeping

" ==========
" }}}


" Search {{{
" ==========

set ignorecase                              " Ignore case by default
set smartcase                               " Make search case sensitive only if it contains uppercase letters
set wrapscan                                " Search again from top when reached the bottom
set nohlsearch                              " Don't highlight after search
set completeopt-=preview                    " Don't show preview scratch buffers

" wildcard ignore for search
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=tmp/**
set wildignore+=*.pyc,*.class,*.lo,.git

" ==========
" }}}


" History {{{
" ==========

if has('persistent_undo')
  set undofile                              " Save undos when file is closed
  set undodir=~/.config/nvim/tmp/undo//     " Persistant undo history
  set undolevels=10000                      " Number of changes to save for undo
  set history=200                           " Number of vim commands and search history to save
endif

set noswapfile                              " New buffers will be loaded without creating a swapfile
set nobackup                                " No vim backup

" ==========
" }}}


" Windows {{{
" ==========

" easier window switching
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" split settings
set splitbelow                              " Splitting a window will put the new window below the current
set splitright                              " Splitting a window will put the new window right of the current

" ALT-HJKL to change 10x horizontal window resize
map <silent> ¬ 10<C-w>>
map <silent> ˙ 10<C-w><
map <silent> ∆ 10<C-w>-
map <silent> ˚ 10<C-w>+

" Toggle fullscreen window
nnoremap <silent> <C-a>z :MaximizerToggle<CR>
inoremap <silent> <C-a>z :MaximizerToggle<CR>

" ==========
" }}}


" Shortcuts {{{
" ==========

" disable arrow keys to become legit
nnoremap <up> <NOP>
nnoremap <down> <NOP>
nnoremap <left> <NOP>
nnoremap <right> <NOP>
inoremap <up> <NOP>
inoremap <down> <NOP>
inoremap <left> <NOP>
inoremap <right> <NOP>

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

" Quick save and close buffer
nnoremap <leader>s :w<CR>
nnoremap <silent> <leader>w :Sayonara!<CR>
nnoremap <silent> <leader>q :Sayonara<CR>

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Reselect last-pasted text
nnoremap gp `[v`]

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" [S]plit line (sister to [J]oin lines) S is covered by cc.
nnoremap S mzi<CR><ESC>`z

" Quiting and saving all
cnoremap ww wqall
cnoremap qq qall

" jk is <esc> in insert mode
inoremap jk <esc>

"Auto save settings without having to reload VIM
" TODO fricks up the foldings
" nnoremap <Leader>r :source ~/.config/nvim/init.vim<C-CR>

" no need to press shift ; for every vim command
nnoremap ; :

" Make sure Vim returns to the same line when you reopen a file. Thanks, Amit and Steve Losh.
augroup line_return
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" ==========
" }}}


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

" ==========
" }}}


" Clipboard {{{
" ==========

" Allow to use system clipboard
set clipboard+=unnamed

" Yank and paste from clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>yy "+yy
nnoremap <leader>p "+p

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


" File Types {{{
" ==========

set suffixesadd+=.js,.rb                    " Add js and ruby files to suffixes, to help 'gf'
filetype plugin on                          " Filetype settings
filetype indent on                          " Filetype settings

" ==========
" }}}


" Tabs & Spaces {{{
" ==========

" === Whitespace characters ===
set list                                    " Show listchars by default
set listchars=tab:▸\ ,extends:❯,precedes:❮,trail:·
set nojoinspaces                            " No extra space when joining a line which ends with . ? !

" Autoremove trailing spaces when saving the buffer
autocmd FileType c,cpp,elixir,eruby,html,java,javascript,php,ruby autocmd BufWritePre <buffer> :%s/\s\+$//e
" Remove trailing whitespaces automatically before save
" autocmd BufWritePre * call utils#stripTrailingWhitespaces()

" ==========
" }}}


" Misc Settings {{{
" ==========

" === Timeout ===
" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely. (by Steve Losh)
set notimeout
set ttimeout
set ttimeoutlen=10

" === Neovim ===
let g:loaded_python_provider=1              " Disable python 2 interface
let g:python_host_skip_check=1              " Skip python 2 host check

" === Native Terminal ===
" Native Neovim terminal switching
" tnoremap <C-h> <C-\><C-n><C-w>h
" tnoremap <C-j> <C-\><C-n><C-w>j
" tnoremap <C-k> <C-\><C-n><C-w>k
" tnoremap <C-l> <C-\><C-n><C-w>l
" Terminal mode mappings
tnoremap <ESC> <C-\><C-n>
tnoremap ,<ESC> <ESC>

" ==========
" }}}


" Lightline {{{
" ==========

function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, '❌ ' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, '⚠️  ' . info['warning'])
  endif
  return join(msgs, ' ')
endfunction

let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'tab': {
      \   'active': [ 'filename' ],
      \   'inactive': [ 'filename' ]
      \ },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'modified', 'filename'], ['gitbranch'], [ 'session' ],  ['cocstatus' ] ],
      \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'filetype', 'fileencoding' ] ]
      \ },
      \ 'component': {
     \   'readonly': '%{&filetype=="help"?"HELP":&readonly?"RO":""}'
      \ },
      \ 'component_function': {
      \   'mode': 'utils#lightLineMode',
      \   'filename': 'utils#lightLineFilename',
      \   'fileencoding': 'utils#lightLineFileencoding',
      \   'gitbranch': 'gitbranch#name',
      \   'cocstatus': 'StatusDiagnostic',
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

" === NERDTree ===
let g:NERDTreeMinimalUI=1
let g:NERDTreeWinSize=30
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeShowHidden=1
let g:NERDTreeHighlightCursorline=0
let g:NERDTreeRespectWildIgnore=1

let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$', '\.so$', '^\.git$', '__pycache__', '\.DS_Store', '\.class$' ]

map <silent> <leader>nt :NERDTreeToggle<CR>
" nnoremap <silent> <Space>n :call utils#nerdWrapper()<CR>
" nnoremap <silent> <F5> :source $MYNVIMRC<CR>

" === Undotree ===
nnoremap <F5> :UndotreeToggle<CR>

" === vim-jsx ===
let g:jsx_ext_required=0

" === vim-markdown ===
let g:vim_markdown_no_default_key_mappings=1
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_frontmatter=1

" === COC ===

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" use shift tab to browse options backwards
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <space> to confirm completion
inoremap <expr> <space> pumvisible() ? "\<C-y>" : "\<C-g>u\<space>"

" don't give |ins-completion-menu messages
set shortmess+=c

" Close the preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Comment syntax in JSONC files (coc-settings)
autocmd FileType json syntax match Comment +\/\/.\+$+

" Use C to open coc config
function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction
call SetupCommandAbbrs('C', 'CocConfig')

let g:coc_global_extensions = [
      \ 'coc-java',
      \ 'coc-eslint',
      \ 'coc-git',
      \ 'coc-css',
      \ 'coc-html',
      \ 'coc-json',
      \ 'coc-markdownlint',
      \ 'coc-python',
      \ 'coc-snippets',
      \ 'coc-solargraph',
      \ 'coc-tsserver',
      \ 'coc-yaml',
      \ ]


" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call CocActionAsync("doHover")<CR>

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Format and import on save of go files using COC
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

" === fzf ===
nnoremap <C-t> :Files<CR>

" === RSpec ===
nmap <silent> <leader>rn :TestNearest<CR>
nmap <silent> <leader>rf :TestFile<CR>
nmap <silent> <leader>rl :TestLast<CR>

" === Vimplug ===
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pu :PlugUpdate<CR>
nnoremap <leader>pU :PlugUpgrade<CR>
nnoremap <leader>pc :PlugClean<CR>

" ==========
" }}}


" Custom folds for this settings file = default all folded
" vim:foldmethod=marker:foldlevel=0
