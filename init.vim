" General configurations
set termguicolors " use 256 colors
set title " set window name to 'titlestring' or default
set titlestring="~ vim ~" " ... this is the title string
set ruler " show the cursor position all the time
set cursorline " Show cursor line
set showcmd " display incomplete commands
set number "Show line numbers
set numberwidth=4       " Width of line number field
set encoding=utf-8 " Define default encoding for the files
set ttyfast " imporove redrawing smoothness
set laststatus=2 " Always show the statusline"
set history=1000 " keep 1000 lines of command line history
set splitright " vertically split windows onto the right side
set matchtime=3 " highlight parentheses for 30 1/10s of a secon
set noerrorbells " remove annoying sounds

" Text formatting
set backspace=indent,eol,start " allow backspacing over indent, eol, sol
set copyindent
set preserveindent
set smarttab " insert 'shiftwidth' spaces and remove 'shiftwidth' spaces
set shiftround " Indent to nearest tabstop
set softtabstop=0
set shiftwidth=4
set tabstop=4 " distinguishable from spaces in files that use tabs
set noexpandtab sts=0 sw=4 ts=4

" Better looking splits
set fillchars+=vert:\
highlight VertSplit ctermfg=0 ctermbg=0

" Searching
set ignorecase " Ignore the case of letters in searches
set smartcase " Become case-sensitive if capital letters are used in search
set hlsearch " Highlight all search matches
set incsearch " Place cursor at current search match
set gdefault " Substitute all matches in a line by default
set showmatch " Set show matching parenthesis

" Mouse configuratios
if has('mouse')
    set mouse=a
endif

" Mappings
nnoremap <C-e> :NERDTreeToggle<CR>
map  <C-n> :tabn<CR>
map  <C-p> :tabp<CR>
map  <C-t> :tabnew<CR>
let g:multi_cursor_start_key='<C-m>'
vnoremap // y/\V<C-R>"<CR>

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

"
" Plugins
"

" Load Plug and plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'kien/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'plasticboy/vim-markdown'
Plug 'godlygeek/tabular'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lifepillar/vim-solarized8'
" syntax check
Plug 'w0rp/ale'
" Autocomplete
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'
" Formater
Plug 'Chiel92/vim-autoformat'
call plug#end()


"
" Theme Settings
"
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Set colorsceme to solarized
set background=dark
colorscheme solarized8

" Activate solarized airline theme
let g:airline_theme='solarized'
" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" vim-autoformat
noremap <F3> :Autoformat<CR>
" NCM2
augroup NCM2
  	autocmd!
  	" enable ncm2 for all buffers
  	autocmd BufEnter * call ncm2#enable_for_buffer()
  	" :help Ncm2PopupOpen for more information
  	set completeopt=noinsert,menuone,noselect
  	" When the <Enter> key is pressed while the popup menu is visible, it only
  	" hides the menu. Use this mapping to close the menu and also start a new line.
  	inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
  	" uncomment this block if you use vimtex for LaTex
  	" autocmd Filetype tex call ncm2#register_source({
  	"           \ 'name': 'vimtex',
  	"           \ 'priority': 8,
  	"           \ 'scope': ['tex'],
  	"           \ 'mark': 'tex',
  	"           \ 'word_pattern': '\w+',
  	"           \ 'complete_pattern': g:vimtex#re#ncm2,
  	"           \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
  	"           \ })
augroup END
" Ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}
" Airline
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'
