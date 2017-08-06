# My Dotfiles

These dotfiles are designed for Mac

### Steps to adapt

Fork / clone the repo

Run the install shell script: `./install`
If you get an error, you might need to make the install script executable: `chmod u+x install.sh`

Press prefix (Ctrl-A) + I to fetch tmux plugins

Open vim and enter: `:PlugInstall`
If you get errors installing the vim plugins, make sure you have installed the xcode dev tools: `xcode-select --install`

Restart your terminal

### iTerm Settings

For the same terminal color theme as vim: set the theme to `base16-oceanicnext.dark.256.itermcolors`

Automatically join your tmux session by sending the following text at start: `tmux attach -t mysession || tmux new -s mysession`

### Features
Leader-Up = moves the current pane into it's own temporary window
Leader-Down = undoes the above command
Leader-Left/Right = resize panes
Ctrl-HJKL = seamlessly hop between tmux/vim panes
Leader-ff = FuzzyFind (CommandT plugin)
Leader-nt = directory file structure (NERDTree plugin)

### Screenshots
[](screenshot.png)

Enjoy!
