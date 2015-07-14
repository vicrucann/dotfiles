" SETTINGS

" Switch syntax highlighting on, when the terminal has colors
syntax on

" Use vim, not vi api
set nocompatible


" backup files
"set nobackup
"
" No write backup
set nowritebackup
"
" " No swap file
set noswapfile

" Command history
set history=100

" Always show cursor
set ruler

" Show incomplete commands
set showcmd

" Incremental searching (search as you type)
set incsearch

" Highlight search matches
set hlsearch
"
" " Ignore case in search
set smartcase
"
" " Make sure any searches /searchPhrase doesn't need the \c escape character
set ignorecase

" Allow backspace to delete end of line, indent and start of line characters
set backspace=indent,eol,start

" Convert tabs to spaces
set expandtab
"
" " Set tab size in spaces (this is for manual indenting)
set tabstop=4
"
" " The number of spaces inserted for a tab (used for auto indenting)
set shiftwidth=4
"
" " Turn on line numbers
set number
"
" " Highlight tailing whitespace
set list listchars=tab:\ \ ,trail:·

" Get rid of the delay when pressing O (for example)
" "
" http://stackoverflow.com/questions/2158516/vim-delay-before-o-opens-a-new-line
"set timeout timeoutlen=1000 ttimeoutlen=100

" " Always show status bar
set laststatus=2

" " Set the status line to something useful
set statusline=%f\ %=L:%l/%L\ %c\ (%p%%)

" " Hide the toolbar
" set guioptions-=T

" " UTF encoding
set encoding=utf-8

" " Autoload files that have changed outside of vim
set autoread

" " Use system clipboard
" "
" http://stackoverflow.com/questions/8134647/copy-and-paste-in-vim-via-keyboard-between-different-mac-terminals
" set clipboard+=unnamed
"
" " Don't show intro
set shortmess+=I

" " Better splits (new windows appear below and to the right)
set splitbelow
set splitright

" Highlight the current line
set cursorline

" " Visual autocomplete for command menu (e.g. :e ~/path/to/file)
set wildmenu

" " redraw only when we need to (i.e. don't redraw when executing a macro)
set lazyredraw

" " highlight a matching [{()}] when cursor is placed on start/end character
set showmatch

" " Set built-in file system explorer to use layout similar to the NERDTree
" plugin
let g:netrw_liststyle=3

" " Always highlight column 80 so it's easier to see where
" " cutoff appears on longer screens
" autocmd BufWinEnter * highlight ColorColumn ctermbg=darkred
" set colorcolumn=80

" PLUGINS

filetype plugin on

set t_Co=256
let g:solarized_termcolors=256
set background=light
colorscheme solarized

" CtrlP
"map <leader>t <C-p>
"map <leader>y :CtrlPBuffer<cr>
"let g:ctrlp_show_hidden=1
"let g:ctrlp_working_path_mode=0
"let g:ctrlp_max_height=30

" CtrlP -> override <C-o> to provide options for how to open files
"let g:ctrlp_arg_map = 1

" CtrlP -> files matched are ignored when expanding wildcards
"set wildignore+=*/.git/*,*/.hg/*,*/.svn/*.,*/.DS_Store

" CtrlP -> use Ag for searching instead of VimScript
" (might not work with ctrlp_show_hidden and ctrlp_custom_ignore)
"let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" CtrlP -> directories to ignore when fuzzy finding
let g:ctrlp_custom_ignore = '\v[\/]((node_modules)|\.(git|svn|grunt|sass-cache))$'

" Ack (uses Ag behind the scenes)
"let g:ackprg = 'ag --nogroup --nocolor --column'

" Airline (status line)
"let g:airline_powerline_fonts = 1

" Gist authorisation settings
"let g:github_user = $GITHUB_USER
"let g:github_token = $GITHUB_TOKEN
"let g:gist_detect_filetype = 1
"let g:gist_open_browser_after_post = 1
" Related plugins:
" https://github.com/mattn/webapi-vim
" https://github.com/vim-scripts/Gist.vim
" https://github.com/tpope/vim-fugitive

" HTML generation using 'emmet-vim'
" NORMAL mode Ctrl+y then , <C-y,>

" Git gutter
"let g:gitgutter_enabled = 1
"let g:gitgutter_eager = 0
"let g:gitgutter_sign_column_always = 1
"highlight clear SignColumn

" Searching the file system
map <leader>' :NERDTreeToggle<cr>

" Tabularize
map <Leader>e :Tabularize /=<cr>
map <Leader>c :Tabularize /:<cr>
map <Leader>es :Tabularize /=\zs<cr>
map <Leader>cs :Tabularize /:\zs<cr>

" Camel Case Motion (for dealing with programming code)
"map <silent> w <Plug>CamelCaseMotion_w
"map <silent> b <Plug>CamelCaseMotion_b
"map <silent> e <Plug>CamelCaseMotion_e
"sunmap w
"sunmap b
"sunmap e

" BINDINGS

" Map <F9> to make command
:function! C_MAKE()
:make %:r
:endfunction

:map <F9> :execute C_MAKE()<CR> :source $HOME/.vimrc<CR>

" Map <F10> to run :!./
:map <F5> :!./
