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

if has('unix')
    call plug#begin('~/.vim/plugged')
elseif has('win32')
    call plug#begin('~\vimfiles\plugins')
endif

" colors
Plug 'dracula/vim', { 'as': 'dracula' }

" source control
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'

" 
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'

" autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" file finding
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" file structure
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'

" other cool unorganized stuff
Plug 'junegunn/goyo.vim'

call plug#end()

" gvim stuff
if has('gui_running')
   " Remove menubar and toolbar
   " set guioptions -=m guioptions -=T 

   " Remove right and left scrollbars
   set guioptions -=r guioptions -=L

   " Sets font+font size
   set guifont=Hack\ Nerd\ Font\ 11
   " Turn off italics because they look weird in gvim
   let g:dracula_italic=0
endif


"	COLORS
"  .-.-.   .-.-.   .-.-.   .-.-.   .-.-.   .-.-.   .-.-.   .-.-
" / / \ \ / / \ \ / / \ \ / / \ \ / / \ \ / / \ \ / / \ \ / / \
"`-'   `-`-'   `-`-'   `-`-'   `-`-'   `-`-'   `-`-'   `-`-'

" Set color theme
let g:dracula_colorterm = 0
colorscheme dracula

" Set dark scheme
set background=dark

" Enable syntax highlighting
syntax enable

"	STATUS LINE
"  .-.-.   .-.-.   .-.-.   .-.-.   .-.-.   .-.-.   .-.-.   .-.-
" / / \ \ / / \ \ / / \ \ / / \ \ / / \ \ / / \ \ / / \ \ / / \
"`-'   `-`-'   `-`-'   `-`-'   `-`-'   `-`-'   `-`-'   `-`-'

" Always show statusline
" set laststatus=2

" Set colors for active statusbar
hi StatusLine ctermbg=2 ctermfg=0 guibg='#50FA7B' guifg=background

" Set colors for nonactive statusbar
hi StatusLineNC ctermbg=NONE ctermfg=2 guibg=background guifg='#50FA7B' 

" custom statusline
"set statusline=
"set statusline+=%f\ %M
"set statusline+=%=
"set statusline+=line\ %l
"set statusline+=\ %p%%

"	COC - Congquer Of Completion
"  .-.-.   .-.-.   .-.-.   .-.-.   .-.-.   .-.-.   .-.-.   .-.-
" / / \ \ / / \ \ / / \ \ / / \ \ / / \ \ / / \ \ / / \ \ / / \
"`-'   `-`-'   `-`-'   `-`-'   `-`-'   `-`-'   `-`-'   `-`-'

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

"	NERDTREE
"  .-.-.   .-.-.   .-.-.   .-.-.   .-.-.   .-.-.   .-.-.   .-.-
" / / \ \ / / \ \ / / \ \ / / \ \ / / \ \ / / \ \ / / \ \ / / \
"`-'   `-`-'   `-`-'   `-`-'   `-`-'   `-`-'   `-`-'   `-`-'
" Open nerdtree when opening folder
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

" git
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "M",
    \ "Staged"    : "S",
    \ "Untracked" : "U",
    \ "Renamed"   : "R",
    \ "Unmerged"  : "u",
    \ "Deleted"   : "D",
    \ "Dirty"     : "d",
    \ "Clean"     : "c",
    \ 'Ignored'   : 'I',
    \ "Unknown"   : "?"
    \ }
"	UNCATEGORIZED
"  .-.-.   .-.-.   .-.-.   .-.-.   .-.-.   .-.-.   .-.-.   .-.-
" / / \ \ / / \ \ / / \ \ / / \ \ / / \ \ / / \ \ / / \ \ / / \
"`-'   `-`-'   `-`-'   `-`-'   `-`-'   `-`-'   `-`-'   `-`-'

set nobackup
set nowritebackup
set noswapfile

" Unload abandoned buffers
set hidden

" jump between < and > with %
set matchpairs+=<:>

" Cursor is minimum 3 lines from edge
set scrolloff=3

" Show commands and mode
set showmode showcmd

" Show line number and relative line numbers
set number relativenumber

" Splits open at bottom and right
set splitbelow splitright

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Turn on the Wild menu
set wildmenu
set wildmode=longest,list,full

"Always show current position
set ruler

" Configure backspace so it acts as it should act
set backspace=indent,eol,start

" When searching try to be smart about cases 
set smartcase

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

 " Show matching brackets when text indicator is over them
set showmatch 

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Set tab length
set softtabstop=4
set shiftwidth=4

" Enable auto indent
set autoindent

" Wrap lines, dont split words
set wrap
set linebreak

" Disable automatic comment when moving to a new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Make syntastic check python3
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_checkers = ['python']

"	BINDINGS
"  .-.-.   .-.-.   .-.-.   .-.-.   .-.-.   .-.-.   .-.-.   .-.-
" / / \ \ / / \ \ / / \ \ / / \ \ / / \ \ / / \ \ / / \ \ / / \
"`-'   `-`-'   `-`-'   `-`-'   `-`-'   `-`-'   `-`-'   `-`-'

" Set leader to space
let mapleader=' '

" Move between buffers
nnoremap <leader>l :bnext<cr>
nnoremap <leader>h :bprevious<cr>

" Move between tabs
nnoremap <leader><tab> :tabnext<cr>
nnoremap <leader><S-tab> :tabprevious<cr>

" Move between windows
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Toggle zen mode (Goyo plugin)
" NOTE ! This enables dark mode for some reason
nnoremap <leader>g :Goyo<cr>

" Toggle search highlight
nnoremap <leader>s :set hlsearch!<cr>
 
" Run current python script with f5
noremap <F5> :!clear;python3 %<cr>

" Run python module in this dir with f6
noremap <F6> :!clear;python3 .<cr>

" Maps Control+c to escape in visual mode
""No wait for input when exiting visual mode
vnoremap <ESC> <C-c>

" Open fzf
nnoremap <silent> <leader>o :Files<cr>
" Search everywhere
nnoremap <silent> <leader>O :Files /<cr>

" Toggle nerdtree with leader  + n
nnoremap <leader>n :NERDTreeToggle<CR>


""""""""" Coc settings from readme

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
" Short messages
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

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

" <CR>: confirm completion, or insert <CR>
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

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
