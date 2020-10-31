call plug#begin('~/.vim/plugged')
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        let g:fzf_layout = { 'down': '40%' }
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'sheerun/vim-polyglot'
        let g:tex_flavor = 'latex'
    Plug 'tpope/vim-markdown'
    Plug 'vim-scripts/indentpython.vim'
    Plug 'nvie/vim-flake8'
    Plug 'rrethy/vim-illuminate'
        let g:Illuminate_delay = 100
    Plug 'junegunn/goyo.vim'
        let g:goyo_width='45%'
        let g:goyo_height='80%'
        function! s:goyo_enter()
            if executable('tmux') && strlen($TMUX)
                silent !tmux set status off
                silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
            endif
            normal zz
            set scrolloff=999
            set noshowcmd
        endfunction
        function! s:goyo_leave()
            if executable('tmux') && strlen($TMUX)
                silent !tmux set status on
                silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
            endif
            set scrolloff=0
            set showcmd
            call Highlights()
        endfunction
        autocmd! User GoyoEnter nested call <SID>goyo_enter()
        autocmd! User GoyoLeave nested call <SID>goyo_leave()
    Plug 'morhetz/gruvbox'
    Plug 'airblade/vim-gitgutter'
        let g:gitgutter_sign_removed = '-'
    Plug 'yegappan/taglist'
call plug#end()

" General settings
set encoding=utf8
filetype plugin indent on
syntax enable
set backspace=indent,eol,start
set hidden
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent smartindent
set showmode showcmd
set number relativenumber
set cursorline
set showmatch
set matchpairs+=<:>
set splitbelow splitright
set ignorecase smartcase incsearch
set wrap
set scrolloff=1
set signcolumn=yes
set wildmenu wildmode=longest,full
set path+=**
set lazyredraw
set noeb vb t_vb= 
set tm=500
set list
set lcs=tab:\ \ ,extends:…,precedes:…,nbsp:~,trail:~
set fillchars+=vert:│,fold:\ ,diff:x
set showbreak=+++\ 
set cpoptions+=n
set nobackup nowritebackup noswapfile undofile
set updatetime=100
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " Disable automatic comment when moving to a new line

" colors
set t_Co=256
set background=dark
colorscheme gruvbox

function Highlights()
    hi! link SignColumn LineNr
    hi link GitGutterAdd GruvBoxAqua
    hi link GitGutterChange GruvBoxYellow
    hi link GitGutterDelete GruvBoxRed
    hi link GitGutterChangeDelete GruvBoxOrange
    hi StatusLine cterm=NONE ctermfg=NONE ctermbg=NONE
    hi StatusLineNC cterm=NONE ctermfg=NONE ctermbg=NONE
    hi illuminatedWord cterm=reverse
endfunction
call Highlights()

" Statusline
set laststatus=2
set statusline=
set statusline+=%#GruvboxRed#
set statusline+=\ %M  " modified flag
set statusline+=%#GruvboxGreen#
set statusline+=%t  " filename
set statusline+=%#GruvboxBlue#
set statusline+=\ %y\   " filetype
set statusline+=%#LineNr# " bar color
set statusline+=%= "Right side settings
set statusline+=%#GruvboxPurple#
set statusline+=\ line\ %l
set statusline+=%#GruvboxAqua#
set statusline+=\ of\ %L\ 

" only show cursorline on current split
augroup CursorLine
    au!
    au VimEnter * setlocal cursorline
    au WinEnter * setlocal cursorline
    au BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" keybinds
let mapleader = ' '
nnoremap <F4> :so $MYVIMRC<cr>
nnoremap Y y$  " why is this not default
" move between splits
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
" resize splits
nnoremap <Up> <C-w>+
nnoremap <Down> <C-w>-
nnoremap <Left> <C-w><
nnoremap <Right> <C-w>>
nnoremap <leader>s :set hlsearch! hlsearch?<cr>
nnoremap <leader>l :set wrap! wrap?<cr>
nnoremap <leader>w :b#<cr>
nnoremap <silent> <leader>o :Files<cr>
nnoremap <silent> <leader>b :Buffers<cr>
nnoremap <silent> <leader>g :Goyo<cr>
nnoremap <silent> <leader>t :TlistToggle<cr>
nnoremap <silent> <leader>q :A<cr>
nnoremap <silent> <leader>Q :AV<cr>
" cleaner exit from insert/visual mode
vnoremap <ESC> <C-c>
inoremap <ESC> <C-c>
" repeat last macro instead of ex mode
nnoremap Q @@
" delete without saving to register
nnoremap s "_d
" go to definition is now go to tag
nnoremap gd <C-]>
command WQ wq
command Wq wq
command W w
command Q q
" run current file
au filetype python nnoremap <F5> :w<cr>:!clear<cr>:exec '!python3 %'<cr>
" run parent module (__main__ file in this dir)
au filetype python nnoremap <F6> :w<cr>:!clear<cr>:exec '!python3 .'<cr>
" c/c++
" compile and run current c file
au filetype c nnoremap <F5> :w<cr>:!clear<cr>:exec '!gcc % -o %:r && ./%:r'<cr>
" compile and run current c++ file
au filetype cpp nnoremap <F5> :w<cr>:!clear<cr>:exec '!g++ % -o %:r && ./%:r'<cr>
" compile with makefile and run output (output must be named 'main')
"au filetype cpp nnoremap <F6> :w<cr>:!clear<cr>:exec '!make && ./main'<cr>
au filetype cpp nnoremap <F6> :w<cr>:make!<cr>:exec '!clear && ./main'<cr>
" compile latex on save
au BufWritePost *.tex exec '!pdflatex %'
