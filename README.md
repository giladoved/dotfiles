# My Dotfiles

These are dotfiles that I use to make my workflow the most efficient and comfortable. Feel free to fork and customize!

## Screenshot
![screenshot](screenshot.png)


## TMUX

- Prefix is set to CTRL-A. I mapped my CAPS button to CTRL for quick access.

- Smart pane switching to easily move between tmux/vim panes: Prefix-h,j,k,l.

- Panes are created with `-` (horizontal split) and `|` (vertical split).

- Resize panes using Prefix-H,J,K,L.

- Vim copy / pasting (in copy mode): Prefix-v to start, Prefix-y to copy, prefix-P (uppercase P) to paste.

- Control-r for reverse command history search (uses fzf)

- Control-t fuzzy finds files in a directory (uses fzf)

- Option select to copy/paste with clipboard

## NEOVIM

### Plug-ins:
#####  Fuzzy Find [(fzf)](https://github.com/junegunn/fzf)
- Activate with Control-t.

- Cancel with Control-c.

##### Autocomplete [(deoplete)](https://github.com/Shougo/deoplete.nvim) 
- While typing, press Control-n to see possible completions.

- Esc to cancel.

##### Directory Tree Viewer [(NERDTree)](https://github.com/scrooloose/nerdtree) 
- Toggle with ',' followed by 'n' 't'.

- Refresh with ',' followed by 'n' 'r'.

- Toggle hidden files with Shift i.

##### Undo Tree [(undotree)](https://github.com/mbbill/undotree) 
- View undo history with F5.

##### Commenting [(vim-commentary)](https://github.com/tpope/vim-commentary)
- To toggle comments, press 'g' 'c' on a highlighted block of code.

##### Rails Testing [(vim-test)](https://github.com/janko/vim-test)
- Run nearest test, ',' followed by 'r' 'n'
- Run tests in whole file, ',' followed by 'r' 'f'
- Run last test, ',' followed by 'r' 'l'

### Features:

- Persistant undos (allows undos even after closing and reopening a file)

- No need to press shift while typing : (remaps ; to :)

- Use F2 to toggle paste mode

- Abort vim search by double tapping ESC

- Open/close folds with SPACE

- Use 'j' 'k' to ESCAPE (remaps jk to ESC)

- Save session with ',' 's'. Use vim -S to restore

- Reformat your whole file with 'cu' (clean-up)

- Highlights trailing whitespace or extralong lines

- Removes trailing whitespace on save


## iTerm Settings

- For the same terminal color theme as vim: set the theme to `base16-oceanicnext.dark.256.itermcolors`

- Automatically join your running tmux session by sending the following text at start: `tmux attach -t mysession || tmux new -s mysession`

## Steps to adapt

1. Fork / clone the repo

2. Run the install shell script: `./install`
If you get an error, you might need to make the install script executable: `chmod u+x install.sh`

3. Install the tmux plugins by typing: Prefix-I

4. Open vim and enter: `:PlugInstall`
If you get errors installing the vim plugins, make sure you have installed the xcode dev tools: `xcode-select --install`

5. Restart your terminal


Enjoy! ✌
