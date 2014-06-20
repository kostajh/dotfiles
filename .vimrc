set nocompatible               " be iMproved
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle Bundles
Bundle 'gmarik/vundle'
Bundle 'file:///home/kosta/src/drupal/drupal.vim'
Bundle 'elzr/vim-json'
Bundle 'jaxbot/github-issues.vim'
Bundle 'gcmt/wildfire.vim'
Bundle 'vimwiki/vimwiki'
Bundle 'bling/vim-bufferline'
Bundle 'vim-php/vim-php-refactoring'
Bundle 'evidens/vim-twig'
Bundle 'jiangmiao/auto-pairs'
Bundle 'dsawardekar/ember.vim'
Bundle 'ervandew/supertab'
Bundle 'SirVer/ultisnips'
Bundle 'myusuf3/numbers.vim'
Bundle 'ap/vim-css-color'
Bundle "guyzmo/notmuch-abook"
Bundle 'Shougo/vimproc'
Bundle 'Shougo/unite.vim'
Bundle 'tsukkee/unite-tag'
Bundle 'Shougo/unite-outline'
Bundle 'osyo-manga/unite-quickfix'
Bundle 'amix/vim-zenroom2'
Bundle 'junegunn/goyo.vim'
Bundle 'Shougo/vimshell.vim'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Rykka/riv.vim'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'tpope/vim-dispatch'
Bundle "tobyS/skeletons.vim"
Bundle 'sickill/vim-pasta'
Bundle 'tobyS/vmustache'
Bundle 'mklabs/grunt.vim'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'jamessan/vim-gnupg'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-liquid'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-easytags'
Bundle 'Raimondi/delimitMate'
Bundle 'StanAngeloff/php.vim'
Bundle 'othree/html5.vim'
Bundle 'arnaud-lb/vim-php-namespace'
Bundle 'tpope/vim-sensible'
Bundle 'scrooloose/syntastic'
Bundle 'tomtom/tlib_vim'
Bundle 'Shougo/vimfiler.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'honza/vim-snippets'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-surround'
Bundle 'rking/ag.vim'
Bundle 'Yggdroot/LeaderF'
Bundle 'pangloss/vim-javascript'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-git'
Bundle 'fs111/pydoc.vim'
Bundle 'rstacruz/sparkup'
Bundle 'mhinz/vim-signify'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'chrisbra/csv.vim'
Bundle 'scratch'
Bundle 'joonty/vdebug'
Bundle 'ntpeters/vim-better-whitespace'

filetype plugin indent on
syntax on

" Spell check
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.wiki setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.md set complete+=kspell
autocmd BufRead,BufNewFile *.wiki set complete+=kspell

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

let g:php_refactor_command='php /home/kosta/bin/refactor.phar'
let g:mustache_abbreviations = 1

" Github/Vim
let g:github_access_token = "8ea993b3c99372cfb55c4e4e1ce65046375bb62c"

" Supertab
let g:SuperTabDefaultCompletionType = 'context'

" Vim filer
let g:vimfiler_as_default_explorer = 1

" Quick edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

"Utilsnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Vimwiki
let g:vimwiki_list = [{'path': '/mnt/data/Dropbox/vimwiki'}]

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

" Unite
nnoremap <C-p> :Unite file_rec/async<cr>
nnoremap <C-y> :Unite outline<cr>
noremap <space>/ :Unite grep:.<cr>
let g:unite_source_history_yank_enable = 1
nnoremap <space>y :Unite history/yank<cr>
nnoremap <space>s :Unite -quick-match buffer -auto-preview<cr>

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
set tags=./tags;
let g:easytags_dynamic_files = 1
let g:easytags_auto_update = 1
let g:easytags_auto_highlight = 1
let g:easytags_always_enabled = 1

" No vim backups
set noundofile
set nobackup
set nowritebackup
set noswapfile

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
set t_Co=256
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

" Remember last location in file
if has("automcd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" PHPCS and Syntastic. Drupal checkers are added by the Drupal plugin.
let g:syntastic_php_phpcs_args="--report=csv --standard=PSR-2"
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
let g:syntastic_javascript_checkers = ['jslint', 'jshint', 'jsl']
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

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4

" Keep function prototype in scratch buffer
set completeopt+=preview
