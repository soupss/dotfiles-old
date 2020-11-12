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
syntax on
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
set notimeout ttimeout
set list lcs=tab:\ \ ,extends:…,precedes:…,nbsp:~,trail:~
set fillchars+=vert:│,fold:\ ,diff:x
set showbreak=+++\ 
set cpoptions+=n
set nobackup nowritebackup noswapfile undofile
" Disable automatic comment when moving to a new line
au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" correct hpp filetype
au BufEnter *.hpp setlocal filetype=hpp syntax=cpp
" when sourcing vimrc in hpp file
if (&ft == 'hpp')
    setlocal filetype=hpp syntax=cpp
endif
au BufEnter *.cpp let b:fswitchdst = 'hpp' | let b:fswitchlocs = '../inc'
au BufEnter *.hpp let b:fswitchdst = 'cpp' | let b:fswitchlocs = '../src'
" cscope
set cscopetag
if filereadable(".index/cscope.out")
    silent !cscope -Rb -f .index/cscope.out
    cs add .index/cscope.out
    " update cscope db on save  !use f3 mapping instead
    " au BufWritePost * !cscope -Rb -f .index/cscope.out
elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
endif


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
    hi StatusLine cterm=none ctermbg=none
    hi StatusLineNC cterm=none ctermbg=none
    hi illuminatedWord cterm=reverse
endfunction
call Highlights()


hi GruvboxRedReverse cterm=reverse ctermfg=167
hi GruvboxGreenReverse cterm=reverse ctermfg=142
hi GruvboxYellowReverse cterm=reverse ctermfg=214
hi GruvboxBlueReverse cterm=reverse ctermfg=109
hi GruvboxPurpleReverse cterm=reverse ctermfg=175
hi GruvboxAquaReverse cterm=reverse ctermfg=108

" Statusline
set laststatus=2
set statusline=
set statusline+=%#GruvboxRedReverse#
set statusline+=%m%r  " modified flag
set statusline+=%#GruvboxGreenReverse#
set statusline+=\ %t\   " filename
set statusline+=%#GruvboxBlueReverse#
set statusline+=\ %Y\   " filetype
set statusline+=%#GruvBoxFg0# " bar color
set statusline+=\ %F   " filename
set statusline+=%= "Right side settings
set statusline+=%{v:register}\  "Right side settings
set statusline+=%#GruvboxPurpleReverse#
set statusline+=\ line\ %l\ 
set statusline+=%#GruvboxAquaReverse#
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
nnoremap <F2> :bufdo so $MYVIMRC<cr>
nnoremap Y y$
" move between splits
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
" split zoom
noremap Zz <c-w>_ \| <c-w>\|
noremap Zo <c-w>=
" repeat last macro instead of ex mode
nnoremap Q @@
" delete without saving to register
" verb: suck (to void)
nnoremap s "_d
nnoremap S "_d$
command WQ wq
command Wq wq
command W w
command Q q
nmap gs ysiw
" go to unsaved buffer
nnoremap <leader><cr> :bm<cr>
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
nnoremap <silent> <leader><leader>g :Goyo<cr>
nnoremap <silent> <leader>t :TlistToggle<cr>
nnoremap <silent> <leader>q :FSHere<cr>
au filetype cpp nnoremap <buffer> <silent> <leader>Q :FSSplitLeft<cr>
au filetype hpp nnoremap <buffer> <silent> <leader>Q :FSSplitRight<cr>
" cleaner exit from insert/visual mode
vnoremap <ESC> <C-c>
inoremap <ESC> <C-c>
" add numbered j/k to jumplist
nnoremap <silent> k :<C-U>execute 'normal!' (v:count > 1 ? "m'" . v:count : '') . 'k'<CR>
nnoremap <silent> j :<C-U>execute 'normal!' (v:count > 1 ? "m'" . v:count : '') . 'j'<CR>
" CSCOPE MAPPINGS
" use -Rbq for large projects, !creates 2 additional files: cscope.in.out & cscope.po.out
" ':cs reset' doesnt add new db
nnoremap <f3> :!mkdir -p .index && cscope -Rb -f .index/cscope.out<cr>:cs kill -1<cr>:cs add .index/cscope.out<cr>
" lower case = under cursor
" upper case = search
" find function definition
nnoremap <leader>d :cs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader><leader>d :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>D :cs find g 
nnoremap <leader><leader>D :vert scs find g 
" find variable definition: where a symbol gets assigned a value
nnoremap <leader>a :cs find a <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader><leader>a :vert scs find a <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>A :cs find a 
nnoremap <leader><leader>A :vert scs find a 
" find calls: where function is being used
nnoremap <leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader><leader>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>C :cs find c 
nnoremap <leader><leader>C :vert scs find c 
" find exact (egrep)
nnoremap <leader>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader><leader>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>E :cs find e 
nnoremap <leader><leader>E :vert scs find e 
" open file
nnoremap <leader>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nnoremap <leader><leader>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
" find files that include the filename
nnoremap <leader>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nnoremap <leader><leader>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
" find files that include current file
nnoremap <leader>I :cs find i %:t<cr>
nnoremap <leader><leader>I :vert scs find i %:t<cr>
" COMPILING/RUNNING
" PYTHON
" run current file
au filetype python nnoremap <F5> :w<cr>:!clear<cr>:exec '!python3 %'<cr>
" run parent module (__main__ file in this dir)
au filetype python nnoremap <F6> :w<cr>:!clear<cr>:exec '!python3 .'<cr>
" C/C++
" compile and run current c file
au filetype c nnoremap <F5> :w<cr>:!clear<cr>:exec '!gcc % -o %:r && ./%:r'<cr>
" compile and run current c++ file
au filetype cpp nnoremap <F5> :w<cr>:!clear<cr>:exec '!g++ % -o %:r && ./%:r'<cr>
" compile with makefile
au filetype cpp nnoremap <leader><F6> :wa<cr>:!clear && make<cr>
" run ./main
au filetype cpp nnoremap <F6> :!clear && ./bin/debug/main<cr>
au filetype cpp nnoremap <F7> :!clear && ./bin/release/main<cr>
" compile latex on save
au BufWritePost *.tex exec '!pdflatex %'
