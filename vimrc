" SETTINGS {{{

set ff=unix

" Switch syntax highlighting on, when the terminal has colors
syntax on

" Use vim, not vi api
set nocompatible

" No write backup
set nowritebackup

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
" set list listchars=tab:\ \ ,trail:·

" Get rid of the delay when pressing O (for example)
" "
" http://stackoverflow.com/questions/2158516/vim-delay-before-o-opens-a-new-line
set timeout timeoutlen=1000 ttimeoutlen=100

" " Always show status bar
set laststatus=2

" " Set the status line to something useful
set statusline=%f\ %=L:%l/%L\ %c\ (%p%%)

" " UTF encoding
set encoding=utf-8

" " Autoload files that have changed outside of vim
set autoread

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

" }}}

" PLUGINS {{{

filetype plugin on

" Vundle settings
" required to use with Vundle - begin
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'       " required by vundle
Plugin 'altercation/vim-colors-solarized'
"Plugin 'flazz/vim-colorschemes'  " diff color schemes, we will only use solarized
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'airblade/vim-gitgutter'
call vundle#end()
filetype plugin indent on
" required by vundle - end

" Solarized color scheme
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
"let g:ctrlp_custom_ignore = '\v[\/]((node_modules)|\.(git|svn|grunt|sass-cache))$'

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
"let g:gitgutter_override_sign_column_highlight = 0
"highlight SignColumn ctermbg=230
"highlight GitGutterChange ctermfg=blue
let g:gitgutter_enabled = 1
let g:gitgutter_eager = 0
let g:gitgutter_sign_column_always = 1
highlight clear SignColumn

" Searching the file system
map <leader>' :NERDTreeToggle<cr>

" NERDTree special characters are not used
let g:NERDTreeDirArrows=0

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
" }}}

" BINDINGS {{{

" Map <F9> to make command
:function! C_MAKE()
:make %:r | :cwindow
:endfunction

":function! C11_MAKE()
":make %:r -std=c++11 | :cwindow
":endfunction

:nmap <F9> <Esc> :w<CR> :let rowm=line('.')<CR> :let colm=col('.')<CR> :execute C_MAKE()<CR> :source $HOME/.vimrc<CR> :call cursor(rowm, colm)<CR>
:imap <F9> <Esc> :w<CR> :let rowm=line('.')<CR> :let colm=col('.')<CR> :execute C_MAKE()<CR> :source $HOME/.vimrc<CR> :call cursor(rowm, colm)<CR>

":nmap <F10> <Esc> :w<CR> :let rowm=line('.')<CR> :let colm=col('.')<CR> :execute C11_MAKE()<CR> :source $HOME/.vimrc<CR> :call cursor(rowm, colm)<CR>
":imap <F10> <Esc> :w<CR> :let rowm=line('.')<CR> :let colm=col('.')<CR> :execute C11_MAKE()<CR> :source $HOME/.vimrc<CR> :call cursor(rowm, colm)<CR>

" Map <F5> to run
:nmap <F5> <Esc> :!./%:r<CR>
:imap <F5> <Esc> :!./%:r<CR>

" Map <F4> to open NERDTree
:nmap <F4> <Esc> :NERDTree<CR>
:imap <F4> <Esc> :NERDTree<CR>

" }}}

" COMMANDS {{{

" " When *.cpp file created, load it from template
autocmd BufNewFile *.cpp r ~/.vim/template.cpp

" " Automatically close the folds when the file is open
autocmd BufRead * setlocal foldmethod=marker
autocmd BufRead * normal zM

" " file formats
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd Filetype markdown setlocal wrap linebreak nolist textwidth=0
" wrapmargin=0 " http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
autocmd FileType sh,cucumber,ruby,yaml,zsh,vim setlocal shiftwidth=2
" tabstop=2 expandtab

" "specify syntax highlighting for specific files
autocmd Bufread,BufNewFile *.md set filetype=markdown

" Highlight words to avoid in tech writing
" " http://css-tricks.com/words-avoid-educational-writing/
highlight TechWordsToAvoid ctermbg=red ctermfg=white
match TechWordsToAvoid /\cobviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however\|so,\|easy/
autocmd BufWinEnter * match TechWordsToAvoid /\cobviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however,\|so,\|easy/
autocmd InsertEnter * match TechWordsToAvoid /\cobviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however,\|so,\|easy/
autocmd InsertLeave * match TechWordsToAvoid /\cobviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however,\|so,\|easy/
autocmd BufWinLeave * call clearmatches()

" Rainbow parenthesis always on!
if exists(':RainbowParenthesesToggle')
    autocmd VimEnter * RainbowParenthesesToggle
    autocmd Syntax * RainbowParenthesesLoadRound
    autocmd Syntax * RainbowParenthesesLoadSquare
    autocmd Syntax * RainbowParenthesesLoadBraces
endif

" Reset spelling colours when reading a new buffer
" " This works around an issue where the colorscheme is changed by
" .local.vimrc
fun! SetSpellingColors()
    highlight SpellBad cterm=bold ctermfg=white ctermbg=red
    highlight SpellCap cterm=bold ctermfg=red ctermbg=white
endfun
autocmd BufWinEnter * call SetSpellingColors()
autocmd BufNewFile * call SetSpellingColors()
autocmd BufRead * call SetSpellingColors()
autocmd InsertEnter * call SetSpellingColors()
autocmd InsertLeave * call SetSpellingColors()

" Change colourscheme when diffing
fun! SetDiffColors()
    highlight DiffAdd    cterm=bold ctermfg=white ctermbg=DarkGreen
    highlight DiffDelete cterm=bold ctermfg=white ctermbg=DarkGrey
    highlight DiffChange cterm=bold ctermfg=white ctermbg=DarkBlue
    highlight DiffText   cterm=bold ctermfg=white ctermbg=DarkRed
endfun
autocmd FilterWritePre * call SetDiffColors()

" Keep NERDTree open by default
" autocmd VimEnter * NERDTree
" autocmd BufWinEnter * NERDTreeMirror

" }}}
