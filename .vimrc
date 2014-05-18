set nocompatible               " be iMproved
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle Bundles
Bundle 'gmarik/vundle'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'file:///home/kosta/src/drupal/drupal.vim'
Bundle 'jaxbot/github-issues.vim'
Bundle 'gcmt/wildfire.vim'
Bundle 'vimwiki/vimwiki'
Bundle 'bling/vim-bufferline'
Bundle 'jmcantrell/vim-virtualenv'
Bundle 'lambdalisue/nose.vim'
Bundle 'ervandew/supertab'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'
Bundle 'SirVer/ultisnips'
Bundle 'myusuf3/numbers.vim'
Bundle "guyzmo/notmuch-abook"
Bundle 'Shougo/vimproc'
Bundle 'Shougo/unite.vim'
Bundle 'amix/vim-zenroom2'
Bundle 'junegunn/goyo.vim'
Bundle 'm2mdas/phpcomplete-extended'
Bundle 'Shougo/vimshell.vim'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Rykka/riv.vim'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'scratch.vim'
Bundle 'tpope/vim-dispatch'
Bundle 'stephpy/vim-phpdoc'
Bundle 'nginx.vim'
Bundle 'mklabs/grunt.vim'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'jamessan/vim-gnupg'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-liquid'
Bundle 'xolox/vim-misc'
Bundle 'Raimondi/delimitMate'
Bundle 'StanAngeloff/php.vim'
Bundle 'othree/html5.vim'
Bundle 'arnaud-lb/vim-php-namespace'
Bundle 'tpope/vim-sensible'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/syntastic'
Bundle 'tomtom/tlib_vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'garbas/vim-snipmate'
Bundle 'Shougo/vimfiler.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'honza/vim-snippets'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-surround'
Bundle 'rking/ag.vim'
Bundle 'Yggdroot/LeaderF'
"Bundle 'kien/ctrlp.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-git'
Bundle 'sjl/gundo.vim'
Bundle 'fs111/pydoc.vim'
Bundle 'vim-scripts/TaskList.vim'
Bundle 'rstacruz/sparkup'
Bundle 'mhinz/vim-signify'
Bundle 'techlivezheng/vim-plugin-tagbar-phpctags'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'chrisbra/csv.vim'
Bundle 'scratch'
Bundle 'joonty/vdebug'
Bundle 'ntpeters/vim-better-whitespace'

filetype plugin indent on
syntax on

" Eclim
let g:EclimCompletionMethod = 'omnifunc'
let g:EclimPhpValidate = 0
let g:EclimFileTypeValidate = 0
let g:EclimPhpDrupalValidate = 0
let g:EclimShowCurrentError = 0
let g:airline#extensions#eclim#enabled = 1
" Hide signs
let g:EclimShowQuickfixSigns = 0
let g:EclimShowLoclistSigns = 0
let g:EclimQuickfixSignText = 0
let g:EclimLoclistSignText = 0
let g:EclimUserSignText = 0
let g:EclimUserSignHighlight = 0
let g:EclimSignLevel = 0

" Goyo
let g:numbers_exclude = ['unite', 'tagbar', 'startify', 'gundo', 'vimshell', 'w3m', 'goyo', 'vim-zenroom2']

" Supertab
let g:SuperTabDefaultCompletionType = 'context'

" Vim filer
let g:vimfiler_as_default_explorer = 1

" Quick edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

"PHPComplete
let g:phpcomplete_parse_docblock_comments = 1

"Utilsnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Vimwiki
let g:vimwiki_list = [{'path': '/run/media/kosta/data/Dropbox/vimwiki'}]

" Fullscreen mode
map <silent> <F11>
\    :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>

" DelimitMate
let g:delimitMate_expand_cr = 1

" Markdown
autocmd Filetype markdown setlocal wrap
autocmd Filetype markdown setlocal linebreak
autocmd Filetype markdown setlocal nolist
autocmd Filetype markdown setlocal columns=80
autocmd Filetype markdown setlocal textwidth=0

"HTML
:iabbrev </ </<C-X><C-O>

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd Filetype php setlocal omnifunc=phpcomplete#CompletePHP

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" CSV
let g:csv_autocmd_arrange = 1
aug CSV_Editing
  au!
  au BufRead,BufWritePost *.csv :%ArrangeColumn
  au BufWritePre *.csv :%UnArrangeColumn
aug end

" XML formatting
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

" RST
command! RstPreview :!rst2html.py % > /tmp/rstprev.html && open /tmp/rstprev.html
nnoremap <C-p><C-r> :RstPreview<CR>

" CtrlPBuffer
nnoremap <C-p><C-y> :CtrlPBufTag<CR>
nnoremap <C-p><C-p> :CtrlPTag<CR>

" Always edit in utf-8:
set encoding=utf-8

" Enforce consistent line endings: if 'ff' is set to "unix" and there are any
" stray '\r' characters at ends of lines, then automatically remove them. See
" $VIMRUNTIME/indent/php.vim .
let PHP_removeCRwhenUnix = 1

" Shortcut syntax enable
map <leader>se :syntax enable<CR>

" Easytags
let g:easytags_python_enabled = 1
let g:easytags_php_enabled = 1

" No vim backups
set noundofile
set nobackup
set nowritebackup
set noswapfile

" Tagbar
let g:tagbar_phpctags_bin='/usr/local/bin/phpctags'
let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:tagbar_width=40
map <leader>y :TagbarToggle<CR>

" Set PHP executable
let s:php_executable='/usr/bin/php'

" Highlight editing line
hi LineNr guifg=#3D3D3D guibg=black gui=NONE ctermfg=darkgray ctermbg=black cterm=NONE

" Behat
let feature_filetype='behat'

" Drupal plugin
let g:Drupal_dirs = {6: '~/.drush/drupal-versions/drupal-6.x-dev', 7: '~/.drush/drupal-versions/drupal-7.x-dev', 8: '~/src/drupal/drupal'}

" Standards
set number
set wildmode=longest,list
set fileformats=unix
set history=300
set ruler
set showmode
set showmatch
set nowrap
set hlsearch
set backspace=2
set linebreak
set formatoptions=1
set tabstop=2
set shiftwidth=2
set autoindent
set expandtab

" Indents
set smartindent

" Save on lose focus
au FocusLost * :wa

" Gutters
set numberwidth=4

" Git gutter
let g:gitgutter_eager = 0
let g:gitgutter_sign_column_always = 1

" Map leader to ","
let mapleader=","

" Theme.
syntax enable
" Whitespace intentional on this line!
set fillchars+=vert:\
set background=dark
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_termcolors=256
set term=screen-256color
"set t_Co=256
colorscheme solarized

" Paste mode
set pastetoggle=<F2>

" Code folding
set foldmethod=indent
set foldlevel=99
au BufRead * normal zR

" Search
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <leader>a :Ag

" Gundo toggle
map <leader>g :GundoToggle<CR>

" Remember last location in file
if has("automcd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" PHPCS and Syntastic. Drupal checkers are added by the Drupal plugin.
let g:syntastic_php_phpcs_args="--report=csv --standard=PSR-2"
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
let g:syntastic_javascript_checkers = ['jslint', 'jshint', 'jsl']
"let g:syntastic_mode_map = { "mode": "passive" }
highlight SyntasticErrorSign guifg=white guibg=red
highlight SyntasticErrorLine guibg=#2f0000
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_auto_loc_list=1
let g:syntastic_always_populate_loc_list=1

" Hide tildes
hi NonText guifg=bg

" Strip whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Reselect pasted text
nnoremap <leader>v V`]

" Automatically change window's cwd to file's dir
set autochdir

" Window splits
nnoremap <leader>w <C-w>v<C-w>l

" Bind Ctrl+movement keys to navigate splits
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Highlight long lines
set wrap
set textwidth=80
set formatoptions=qrn1
set colorcolumn=85

" Misc shortcuts
nnoremap ; :

" Python specific
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4

" Keep function prototype in scratch buffer
set completeopt=menuone,preview
