syntax on
"syntax off

let mapleader=' '

filetype plugin on
filetype indent on
" filetype off

"set guifont=Mononoki_Nerd_Font:h15
"set guifont=FiraCode_NF:h17
"set guifont=Hack:h13
"set guifont=Consolas:h12"
"set guifont=Iosevka:h13
"set guifont=Monaspace_Radon:h12
"set guifont=Liberation_Mono
set guifont=DejaVu_Sans_Mono:h9
"set guifont=8514oem:h22
"set guifont=MS_Gothic:h22
"set guifont=DinaRemasterII
"set background=dark
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
set guioptions=

map <C-j> :bnext<CR>
map <C-k> :bprev<CR>

call plug#begin()

"	Vim Easy Align
Plug 'junegunn/vim-easy-align'  

"	NERDTree
Plug 'scrooloose/nerdtree' 

" 	Vaxe
Plug 'jdonaldson/vaxe'

"	Neoclide-COC
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Addition Language Support
Plug 'ziglang/zig.vim'

"	Theme
Plug 'morhetz/gruvbox'
Plug 'nordtheme/vim'
Plug 'tomasiser/vim-code-dark'
Plug 'blazkowolf/gruber-darker.nvim'
Plug 'CreaturePhil/vim-handmade-hero'

"	VimCloseTag
Plug 'docunext/closetag.vim'

" 	AutoCloseBrackets
Plug 'chun-yang/auto-pairs'

"	CTRLPVim - FuzzyFinder
Plug 'ctrlpvim/ctrlp.vim'

"   FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

"   Vim Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" 	Set ColorScheme
"colorscheme codedark
"colorscheme gruvbox
"colorscheme industry
"colorscheme nord
colorscheme handmade-hero

"	Easy Align Configuration
xmap ga <Plug>(EasyAlign)

"	NERDTree Configuration
nnoremap <leader>n :NERDTreeFocus<CR> 
nnoremap <C-n> :NERDTree<CR> 
nnoremap <C-t> :NERDTreeToggle<CR>

"	COC-Configuration
"Run command to install code-completion
":CocInstall coc-clangd - c/c++
":CocInstall coc-python
":CocInstall coc-json
":CocInstall coc-tsserver - js/ts
":CocInstall coc-html
":CocInstall coc-css

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

"let g:coc_start_at_startup = v:false
let g:zig_fmt_autosave = 0

let g:fzf_action = {
	\ 'ctrl-t': 'tab split',
	\ 'ctrl-x': 'split',
	\ 'ctrl-v': 'vsplit' }

if has("unix")
function! FontSizePlus ()
  let l:gf_size_whole = matchstr(&guifont, '\( \)\@<=\d\+$')
  let l:gf_size_whole = l:gf_size_whole + 1
  let l:new_font_size = ' '.l:gf_size_whole
  let &guifont = substitute(&guifont, ' \d\+$', l:new_font_size, '')
endfunction

function! FontSizeMinus ()
  let l:gf_size_whole = matchstr(&guifont, '\( \)\@<=\d\+$')
  let l:gf_size_whole = l:gf_size_whole - 1
  let l:new_font_size = ' '.l:gf_size_whole
  let &guifont = substitute(&guifont, ' \d\+$', l:new_font_size, '')
endfunction
else
function! FontSizePlus ()
  let l:gf_size_whole = matchstr(&guifont, '\(:h\)\@<=\d\+$')
  let l:gf_size_whole = l:gf_size_whole + 1
  let l:new_font_size = ':h'.l:gf_size_whole
  let &guifont = substitute(&guifont, ':h\d\+$', l:new_font_size, '')
endfunction

function! FontSizeMinus ()
  let l:gf_size_whole = matchstr(&guifont, '\(:h\)\@<=\d\+$')
  let l:gf_size_whole = l:gf_size_whole - 1
  let l:new_font_size = ':h'.l:gf_size_whole
  let &guifont = substitute(&guifont, ':h\d\+$', l:new_font_size, '')
endfunction
endif


if has("gui_running")
nmap <C--> :call FontSizeMinus()<CR>
nmap <C-S-+> :call FontSizePlus()<CR>
endif

" User Defined Shortcut
nnoremap <F1> :!make<CR>
nnoremap <F2> :!build.bat<CR>
nnoremap <C-e> :FZF<CR>

nnoremap gr gd[{V%::s///gc<left><left><left>
nnoremap gR gD:%s///gc<left><left><left>
