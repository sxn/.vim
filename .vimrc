call plug#begin('~/.vim/plugged')
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'

    Plug 'mbbill/undotree'

    Plug 'vim-ctrlspace/vim-ctrlspace'

    Plug 'jeetsukumaran/vim-buffergator'

    Plug 'tpope/vim-fugitive'

    Plug 'jiangmiao/auto-pairs'

    Plug 'tpope/vim-markdown'

    Plug 'fatih/vim-go'

    Plug 'othree/html5.vim'

    Plug 'pangloss/vim-javascript'
    Plug 'jelera/vim-javascript-syntax'
    Plug 'othree/javascript-libraries-syntax.vim'
    Plug 'mxw/vim-jsx'
    Plug 'elzr/vim-json'
    Plug 'moll/vim-node'

    Plug 'ap/vim-css-color'
    Plug 'hail2u/vim-css3-syntax'
    Plug 'groenewege/vim-less'

    Plug 'ekalinin/dockerfile.vim'

    Plug 'rizzatti/dash.vim'
call plug#end()



"Shortcuts
"Set CHW to the current dir
map <Leader>chd :chdir<CR>
"Edit vimrc
nnoremap <leader>ev :e $MYVIMRC<CR>
"Source vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>



"Automatically reload vimrc
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | AirlineRefresh
augroup END



"Interface
set guioptions-=m "Hide menu bar
set guioptions-=T "Hide toolbar
set guioptions-=r "Hide right scroll bar
set guioptions-=L "Hide left scroll bar

set foldcolumn=1 "Left margin

colo Tomorrow-Night-Eighties
set guifont=Fira\ Code:h16



"Behaviour
set autoread "Automatically re-read a file when it's been changed outside of VIM
set shell=sh

set nowrap "Turn off wrapping

syntax on "Enable syntax highlighting

set ignorecase "Make search case insensitive
set smartcase "Make search case sensitive when search terms are mixed case

set encoding=utf8

set ffs=unix,dos,mac "Line endings
set tabstop=5 "TAB character width
set shiftwidth=4 "Indent width
set softtabstop=4 "Soft tab size
set expandtab "Expand TABs to spaces

set backupdir=~/.vim/backup/ "Store backups here

set directory=~/.vim/backup/ "Store .swp files here
set undofile                 "Save undos even after closing a file
set undodir=~/.vim/undo/     "Store undos here



"Airline
set laststatus=2
if exists(':AirlineRefresh')
    let g:airline_powerline_fonts = 1
    let g:airline_theme='tomorrow'
    let g:Powerline_symbols='unicode'
    let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])
    let g:airline#extensions#tabline#enabled=1
endif



"NERDTree
map <C-n> :NERDTreeToggle<CR>
map <C-g> :NERDTreeFind<CR>
map <C-k> :NERDTree 
let NERDTreeWinSize=25



"vim-fugitive
map <Leader>gs :Gstatus<CR>
map <Leader>gb :Gblame<CR>
map <Leader>gbr :Gbrowse<CR>
map <Leader>ghd :Gdiff<CR>
map <Leader>gvd :Gvdiff<CR>
map <Leader>gl :Glog<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gp :Gpull origin master
map <Leader>gps :Gpush origin master
map <Leader>gg :Ggrep




"CSS
autocmd Filetype css setlocal foldmethod=syntax "Use syntax folding in CSS files
autocmd Filetype css normal zR



"Markdown
autocmd Filetype markdown setlocal wrap "Enable wrapping in Markdown files
autocmd Filetype markdown setlocal linebreak



"JavaScript
autocmd Filetype javascript setlocal shiftwidth=2 "Indent width should be 2
autocmd Filetype javascript setlocal softtabstop=2 "Soft TAB should be 2

let g:used_javascript_libs = 'lo-dash,react,flux,backbone'

let g:jsx_ext_required=0

let g:javascript_plugin_jsdoc=1
let g:javascript_plugin_flow=1

let g:javascript_conceal_function       = "ƒ"
let g:javascript_conceal_null           = "ø"
let g:javascript_conceal_this           = "@"
let g:javascript_conceal_return         = "⇚"
let g:javascript_conceal_undefined      = "¿"
let g:javascript_conceal_NaN            = "ℕ"
let g:javascript_conceal_prototype      = "¶"
let g:javascript_conceal_static         = "•"
let g:javascript_conceal_super          = "Ω"
let g:javascript_conceal_arrow_function = "⇒"



"Go
autocmd Filetype go setlocal foldmethod=indent
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1



"Dash
nmap <silent> <leader>d <Plug>DashSearch



"Buffergator
let g:buffergator_autoexpand_on_split=0
let g:buffergator_viewport_split_policy='n'
let g:buffergator_hsplit_size=10
let g:buffergator_vsplit_size=20
let g:buffergator_sort_regime='extension'
let g:buffergator_autodismiss_on_select=0
let g:buffergator_suppress_keymaps=1
map <Leader>bo :BuffergatorOpen<CR>
map <Leader>bc :BuffergatorClose<CR>
map <Leader>to :BuffergatorTabsOpen<CR>
map <Leader>tc :BuffergatorTabsClose<CR>



"Undotree
nnoremap <F5> :UndotreeToggle<cr>



"Ctrlspace
nnoremap <silent><C-p> :CtrlSpace<CR>
set nocompatible
set hidden
set showtabline=1
let g:CtrlSpaceUseTabline=1
let g:airline_exclude_preview=1
let g:CtrlSpaceSetDefaultMapping=0
let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1

if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

if has("gui_running")
    let g:CtrlSpaceSymbols = { "File": "◯", "CTab": "▣", "Tabs": "▢" }
endif
