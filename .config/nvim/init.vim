set nocompatible
syntax on
filetype plugin indent on
scriptencoding utf-8
set encoding=UTF-8

call plug#begin()
Plug 'kevinoid/vim-jsonc'
Plug 'puremourning/vimspector'
Plug 'jbgutierrez/vim-better-comments'
" Plug 'burner/vim-svelte'
Plug 'prettier/vim-prettier', { 'do': 'yarn install'  }
Plug 'pangloss/vim-javascript'
Plug 'preservim/nerdtree'
Plug 'ludovicchabant/vim-gutentags'
Plug 'junegunn/gv.vim'
Plug 'axelf4/vim-strip-trailing-whitespace'
Plug 'romainl/vim-cool'
Plug 'chr4/nginx.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'itchyny/vim-gitbranch'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'sebdah/vim-delve'
Plug 'wakatime/vim-wakatime'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'chengzeyi/fzf-preview.vim'
Plug 'sheerun/vim-polyglot'
call plug#end()

set clipboard=unnamed
set clipboard+=unnamedplus
set path+=**
set diffopt+=vertical
set mouse=a
set noshowmode
set confirm
set wildmenu
set ts=4 sw=4
set ttyfast
" set ttyscroll=3
set autoread
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set backspace=indent,eol,start
set incsearch
set hls is
set noerrorbells
set novisualbell
set number relativenumber
set noswapfile
set showcmd
set nobackup
set nowritebackup
set splitbelow
set splitright
set autowrite
set hidden
set ignorecase
" set completeopt=menu,menuone
set pumheight=10
set nocursorcolumn
set cursorline
set lazyredraw
set laststatus=2
set t_Co=256
set wildignore+=.DS_Store
set wildignore+=*.pyc
set wildignore+=.git
set cmdheight=2
set previewheight=30

if has("patch-8.1.1904")
set completeopt+=popup
set completepopup=align:menu,border:off,highlight:Pmenu
endif

let mapleader=" "
let g:ackprg = 'ag --vimgrep'

nnoremap <leader><leader> <c-^>

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
map <C-b> :Buffers<CR>
nnoremap  <C-q> :q<CR>

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

nmap <leader>l <C-w>l
nmap <leader>h <C-w>h
nmap <leader>j <C-w>j
nmap <leader>k <C-w>k

vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>a :Ag<cr>
nnoremap <leader>r :Rg<cr>
nnoremap <leader>c :cclose<CR>
nnoremap <Leader>d :bd<CR>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>p :bp<CR>
nnoremap <Leader>f :FZF<CR>
autocmd FileType go nmap gb <Plug>(go-build)
autocmd FileType go nmap gr <Plug>(coc-references)
" autocmd FileType go nmap gr  <Plug>(go-run)
autocmd FileType go nmap gl :! golint %<CR>
autocmd FileType go nmap gs :! gosec .<CR>
au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>
nnoremap <silent> <Leader><Space> :Files<CR>

nnoremap <silent> <Esc><Up>A <Nop>
nnoremap <silent> <Esc><Down>B <Nop>
nnoremap <silent> <Esc><Right>C <Nop>
nnoremap <silent> <Esc><Left>D <Nop>

nnoremap <C-Tab> :bNext<cr>

" Buffer close menu
nnoremap <silent> <C-q> :CloseBuffersMenu<CR>

" Save
inoremap <C-s> <esc>:w<cr>
nnoremap <C-s> :w<cr>

" jump over buffers
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>

" resizing horizontlay
map + <C-W>+
map - <C-W>-

nnoremap <silent><leader>q :q!<CR>
nnoremap <silent><leader>x :x<CR>

highlight cursorlinenr cterm=NONE
" vim-go
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_auto_type_info = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
"let g:go_highlight_generate_tags = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_structs = 1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
set updatetime=100
" let g:go_auto_sameids = 1
" set signcolumn=number
set signcolumn=yes
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_template_autocreate = 0

" let g:gitgutter_sign_added = '+'
" let g:gitgutter_sign_modified = '>'
" let g:gitgutter_sign_removed = '-'
" let g:gitgutter_sign_removed_first_line = '^'
" let g:gitgutter_sign_modified_removed = '<'
" let g:gitgutter_enabled = 0
let g:gitgutter_max_signs = 500
let g:gitgutter_override_sign_column_highlight = 1
highlight SignColumn guibg=bg
" highlight SignColumn ctermbg=bg

" if (has("termguicolors"))
"   set termguicolors
" endif

if has('mac')
let g:gruvbox_italic=1
endif
let g:gruvbox_contrast_dark = "hard"
" let g:gruvbox_invert_selection = '0'
colorscheme gruvbox
set background=dark
let g:gruvbox_italicize_comments = 1
let g:airline_theme = "gruvbox"

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_skip_empty_sections = 1
let g:airline_section_c = '%F'

let g:delve_backend = "native"
let g:delve_enable_syntax_highlighting = 1

let g:highlightedyank_highlight_duration = 100
" highlight HighlightedyankRegion cterm=reverse gui=reverse

let g:prettier#autoformat = 0
autocmd BufWritePre *.ts,*.js,*.json,*.css,*.scss,*.less,*.graphql PrettierAsync
let g:prettier#exec_cmd_async = 1
let g:prettier#autoformat_require_pragma = 0

let g:fzf_nvim_statusline = 0
" let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.9, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }
" let g:fzf_layout = {'up':'50%'}

let $FZF_DEFAULT_OPTS='--reverse'
let g:startify_custom_header = []
set statusline+=%F

set fillchars=vert:\│

let g:go_def_mapping_enabled = 0

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> <space>e  :<C-u>CocList diagnostics<cr>

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Don’t pass messages to |ins-completion-menu|.
set shortmess+=c
inoremap jk <Esc>
set nohlsearch

let g:NERDTreeWinSize=40

au! BufNewFile,BufRead *.svelte set ft=html
" set grepprg=ag\ --vimgrep\ --smart-case\ --follow

let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic

let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

let g:vimspector_enable_mappings = 'HUMAN'
" nmap <leader>dd :call vimspector#Launch()<CR>
" nmap <leader>dx :VimspectorReset<CR>
" nmap <leader>de :VimspectorEval
" nmap <leader>dw :VimspectorWatch
" nmap <leader>do :VimspectorShowOutput

let g:python3_host_prog = "/usr/local/bin/python3"
let g:python_host_prog = "/usr/bin/python"

let g:gitgutter_override_sign_column_highlight = 0
highlight clear SignColumn
highlight GitGutterAdd ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1
highlight GitGutterChangeDelete ctermfg=4

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

autocmd FileType json syntax match Comment +\/\/.\+$+
