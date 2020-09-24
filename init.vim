" Save as $HOME/.config/nvim/init.vim

" Dependencies
" vim-plug:  https://github.com/junegunn/vim-plug

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }            " fzf Fuzzy Search
Plug 'w0rp/ale'                                                              " ale linter
Plug 'vim-airline/vim-airline'                                               " Status bar
Plug 'vim-airline/vim-airline-themes'                                        " airline themes
Plug 'scrooloose/nerdtree'                                                   " NERDTree
Plug 'Xuyuanp/nerdtree-git-plugin'                                           " git plugin for NERDTree
Plug 'mtdl9/vim-log-highlighting'                                            " Log highlighting
Plug 'dracula/vim', { 'as': 'dracula' }                                      " Dracula theme

" Initialize plugin system
call plug#end()

" Setting airline theme
let g:airline_theme='luna'

" Fixing
let g:ale_fixers = {
\  '*': ['remove_trailing_lines', 'trim_whitespace']
\}

" Enable integration between airline and ale
let g:airline#extensions#ale#enabled=1

" Enable autocompletion
let g:ale_completion_enabled=1

" Turn line numbers on
set number

" Highlight ocurrences of searched word
set hlsearch

" Makes new splits open on right and below
set splitright splitbelow

" Tabs
 set tabstop=4 shiftwidth=4 expandtab

" Stop Neovim from autocommenting on Enter or Newline <o>
set formatoptions-=cro
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" For being able to edit using relative paths
" Makes the path where edit opens use the path of the current buffer
set autochdir

" Change split with g+(vim direction key)
nnoremap gh <C-W><C-H>
nnoremap gj <C-W><C-J>
nnoremap gk <C-W><C-K>
nnoremap gl <C-W><C-L>

" NERDTree window width
let g:NERDTreeWinSize=50

" NERDTree UI changes
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1

" open NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" Close when NERDTree is the only window open
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Activating NERDTree on boot
" autocmd vimenter * NERDTree