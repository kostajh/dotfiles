set nocompatible               " be iMproved
filetype off
set runtimepath+=~/.vim/bundle/neobundle.vim/
set rtp+=~/.fzf
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#local("~/src/drupal", {}, ['drupal.vim'])
call neobundle#end()
NeoBundleCheck
" Bundles
NeoBundleLocal '~/src/drupal/drupal.vim'
NeoBundle 'reedes/vim-pencil'
NeoBundle 'reedes/vim-colors-pencil'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tommcdo/vim-exchange'
NeoBundle 'reedes/vim-lexical'
NeoBundle 'elzr/vim-json'
NeoBundle 'jaxbot/github-issues.vim'
NeoBundle 'gcmt/wildfire.vim'
NeoBundle 'vimwiki/vimwiki'
NeoBundle 'bling/vim-bufferline'
NeoBundle 'alfredodeza/khuno.vim'
NeoBundle "xolox/vim-notes"
" NeoBundle 'vim-php/vim-php-refactoring'
NeoBundle 'evidens/vim-twig'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'dsawardekar/ember.vim'
NeoBundle 'ervandew/supertab'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'myusuf3/numbers.vim'
NeoBundle 'ap/vim-css-color'
NeoBundle "guyzmo/notmuch-abook"
NeoBundle "christoomey/vim-tmux-navigator"
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'osyo-manga/unite-quickfix'
" NeoBundle 'amix/vim-zenroom2'
NeoBundle 'junegunn/goyo.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'Rykka/riv.vim'
" NeoBundle 'shawncplus/phpcomplete.vim'
NeoBundle 'tpope/vim-dispatch'
NeoBundle "tobyS/skeletons.vim"
NeoBundle 'sickill/vim-pasta'
NeoBundle 'tobyS/vmustache'
NeoBundle 'mklabs/grunt.vim'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'jamessan/vim-gnupg'
NeoBundle 'bling/vim-airline'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-liquid'
NeoBundle 'xolox/vim-misc'
" NeoBundle 'xolox/vim-easytags'
NeoBundle 'Raimondi/delimitMate'
" NeoBundle 'StanAngeloff/php.vim'
NeoBundle 'othree/html5.vim'
" NeoBundle 'arnaud-lb/vim-php-namespace'
NeoBundle 'tpope/vim-sensible'
"NeoBundle 'scrooloose/syntastic'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'honza/vim-snippets'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tpope/vim-surround'
NeoBundle 'rking/ag.vim'
NeoBundle 'Yggdroot/LeaderF'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'tpope/vim-git'
NeoBundle 'fs111/pydoc.vim'
NeoBundle 'rstacruz/sparkup'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'plasticboy/vim-markdown'
" NeoBundle 'tpope/vim-markdown'
NeoBundle 'chrisbra/csv.vim'
NeoBundle 'scratch'
" NeoBundle 'joonty/vdebug'
NeoBundle 'ntpeters/vim-better-whitespace'

filetype plugin indent on
syntax on

" Spell check
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.wiki setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.md set complete+=kspell
autocmd BufRead,BufNewFile *.wiki set complete+=kspell

let g:mustache_abbreviations = 1

" Github/Vim
let g:github_access_token = "8ea993b3c99372cfb55c4e4e1ce65046375bb62c"

" Supertab
let g:SuperTabDefaultCompletionType = 'context'

" Vim filer
let g:vimfiler_as_default_explorer = 1

" Quick edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Notes
let g:notes_suffix = '.txt'
let g:notes_directories = ['/mnt/data/Dropbox/vim-notes']

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
" let PHP_removeCRwhenUnix = 1

" Shortcut syntax enable
map <leader>se :syntax enable<CR>

" Easytags
let g:easytags_python_enabled = 1
let g:easytags_php_enabled = 0
set tags=./tags;
let g:easytags_dynamic_files = 1
let g:easytags_auto_update = 0
let g:easytags_auto_highlight = 1
let g:easytags_always_enabled = 0

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
" let g:Drupal_dirs = {6: '~/.drush/drupal-versions/drupal-6.x-dev', 7: '~/.drush/drupal-versions/drupal-7.x-dev', 8: '~/src/drupal/drupal'}

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
set fillchars+=vert:\
set background=dark
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_termcolors=256
if (!has('gui_running'))
  set term=screen-256color
  set t_Co=256
endif
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
" let g:syntastic_php_phpcs_args="--report=csv --standard=PSR-2"
" let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
" let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes' : ['php']}
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
" autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4

" Keep function prototype in scratch buffer
set completeopt+=preview
