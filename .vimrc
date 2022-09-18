syntax on

let mapleader=','

filetype plugin on
filetype indent on

set guifont=FiraCode_NF:h17
set background=dark
set clipboard+=unnamed

set paste
set go+=a
set nobackup
set nowritebackup
set number
set relativenumber
set autoindent
set smartindent
set backspace=indent,eol,start
set tabstop=4
set softtabstop=4
set shiftwidth=4
set guioptions-=m
set guioptions-=T

call plug#begin()

"	Vim Easy Align
Plug 'junegunn/vim-easy-align'  

"	NERDTree
Plug 'scrooloose/nerdtree' 

"	Neoclide-COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"	Theme
Plug 'morhetz/gruvbox'

"	VimCloseTag
Plug 'docunext/closetag.vim'

" 	AutoCloseBrackets
Plug 'chun-yang/auto-pairs'

call plug#end()

" 	Set ColorScheme
colorscheme gruvbox

"	Easy Align Configuration
xmap ga <Plug>(EasyAlign)

"	NERDTree Configuration
nnoremap <leader>n :NERDTreeFocus<CR> 
nnoremap <C-n> :NERDTree<CR> 
nnoremap <C-t> :NERDTreeToggle<CR>

"	COC-Configuration
" Run command to install code-completion
" :CocInstall coc-clangd - c/c++
" :CocInstall coc-python
" :CocInstall coc-json
" :CocInstall coc-tsserver - js/ts
" :CocInstall coc-html
" :CocInstall coc-css

set updatetime=300
set signcolumn=yes

function! CheckBackspace() abort   
	let col = col('.') - 1   
	return !col || getline('.')[col - 1]  =~# '\s' 
endfunction

inoremap <silent><expr> <TAB>
	  \ coc#pum#visible() ? coc#pum#next(1) :       
	  \ CheckBackspace() ? "\<Tab>" :       
	  \ coc#refresh() 
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
							 \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

