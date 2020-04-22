" ,---.  ,---..-./`) ,---.    ,---..-------.        _______    
" |   /  |   |\ .-.')|    \  /    ||  _ _   \      /   __  \   
" |  |   |  .'/ `-' \|  ,  \/  ,  || ( ' )  |     | ,_/  \__)  
" |  | _ |  |  `-'`"`|  |\_   /|  ||(_ o _) /   ,-./  )        
" |  _( )_  |  .---. |  _( )_/ |  || (_,_).' __ \  '_ '`)      
" \ (_ o._) /  |   | | (_ o _) |  ||  |\ \  |  | > (_)  )  __  
"  \ (_,_) /   |   | |  (_,_)  |  ||  | \ `'   /(  .  .-'_/  ) 
"   \     /    |   | |  |      |  ||  |  \    /  `-'`-'     /  
"    `---`     '---' '--'      '--'''-'   `'-'     `._____.'   

"	PLUGINS
"  .-.-.   .-.-.   .-.-.   .-.-.   .-.-.   .-.-.   .-.-.   .-.-
" / / \ \ / / \ \ / / \ \ / / \ \ / / \ \ / / \ \ / / \ \ / / \
"`-'   `-`-'   `-`-'   `-`-'   `-`-'   `-`-'   `-`-'   `-`-'

call plug#begin('~/.vim/plugged')

" Tools
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'scrooloose/nerdtree'
    Plug 'junegunn/goyo.vim'
    Plug 'xuyuanp/nerdtree-git-plugin'
    Plug 'ryanoasis/vim-devicons'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'sheerun/vim-polyglot'
" Syntax
    Plug 'vim-syntastic/syntastic'
    Plug 'rrethy/vim-illuminate'
    Plug 'lepture/vim-jinja'
    Plug 'tpope/vim-markdown'
    Plug 'ap/vim-css-color'
" colors
    Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

" General settings
set encoding=utf8
syntax enable
set hidden
set showmode showcmd
set number relativenumber
filetype plugin on
set ruler
set autoread
set autoindent
set nowrap
set linebreak
set softtabstop=4
set shiftwidth=4
set wildmenu
set wildmode=longest,full
set path+=**
set smartcase
set incsearch 
set lazyredraw 
filetype indent on
set splitbelow splitright
set showmatch 
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set matchpairs+=<:>
set scrolloff=5
set backspace=indent,eol,start
set showbreak=\\ "
set lcs+=trail:-,extends:>,precedes:<,nbsp:~,eol:\ ,tab:\ \ 
set list
set cursorline
set nobackup
set nowritebackup
set noswapfile
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " Disable automatic comment when moving to a new line
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_checkers = ['python']


" Color settings
let g:dracula_colorterm = 0
colorscheme dracula
set background=dark

" Statusline
set laststatus=2

 "Active statusbar is green
hi StatusLine ctermbg=2 ctermfg=0 guibg='#50FA7B' guifg=background
 "Inactive statusbar is transparent
hi StatusLineNC ctermbg=NONE ctermfg=2 guibg=background guifg='#50FA7B'

set statusline=
set statusline+=\ %y
set statusline+=\ %r
set statusline+=\ %F
set statusline+=%#CursorLineNr# "transparent
set statusline+=%= "Right side settings
set statusline+=%#WildMenu#
set statusline+=\ line\ %l/%L
set statusline+=\ -\ %p%%

" Keybindings
let mapleader=' '

nnoremap <leader>g :Goyo<cr>
nnoremap <leader>w :b#<cr>
nnoremap <leader>s :set hlsearch! hlsearch?<cr>
nnoremap <leader>l :set wrap! wrap?<cr>
nnoremap <leader>z :set list! list?<cr>

nnoremap <silent> <leader>o :Files<cr>
nnoremap <leader>n :NERDTreeToggle<cr>

nnoremap <leader><tab> :tabnext<cr>
nnoremap <leader><S-tab> :tabprevious<cr>

" Move selection
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

vnoremap <ESC> <C-c> " prevent visual mode exit lag
nnoremap Q <nop> " Disable ex mode

" NERDTree
" Open nerdtree when opening folder at start
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

" Git file symbols
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "Ｍ",
    \ "Staged"    : "Ｓ",
    \ "Untracked" : "+",
    \ "Renamed"   : "Ｒ",
    \ "Unmerged"  : "Ｕ",
    \ "Deleted"   : "Ｄ",
    \ "Dirty"     : "𝓭",
    \ "Clean"     : "Ｃ",
    \ 'Ignored'   : 'Ｉ',
    \ "Unknown"   : "?"
    \ }

" Goyo settings
function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" COC - Conquer Of Completion
let g:coc_global_extensions = [
    \ 'coc-pairs',
    \ 'coc-tsserver',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-python',
    \ 'coc-json',
    \ 'coc-omnisharp',
    \ 'coc-prettier',
    \ ]

""""""""" Coc settings from readme
" vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
" Short messages
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" <cr>: confirm completion, or insert <cr>
inoremap <expr> <cr> pumvisible() ? "\<C-Y>" : "\<cr>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<cr>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
