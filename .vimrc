" Set terminal colors to 256
set t_Co=256

" Pathogen settings
" source ~/src/vim/vim-pathogen/autoload/pathogen.vim
call pathogen#helptags()
" call pathogen#infect('~/src/vim')
call pathogen#runtime_append_all_bundles()

" Defaults
syntax on
filetype plugin indent on
set nocompatible
filetype off
autocmd!
set showmatch
set ruler
set hlsearch
set shell=/bin/bash

" Default indentation
set tabstop=4
set shiftwidth=4
set autoindent
set expandtab

" Colors

set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized
call togglebg#map("<F5>")

let mapleader=","
nmap <leader>v :tabedit $MYVIMRC<CR>
syntax enable

" Javascript
au BufNewFile,BufRead *.bones set filetype=javascript
au BufNewFile,BufRead *.json set filetype=javascript
au BufNewFile,BufRead *._ set filetype=html
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.js set makeprg=fixjsstyle\ %
au BufNewFile,BufRead *.js set errorformat=%-P-----\ FILE\ \ :\ \ %f\ -----,Line\ %l\\,\ E:%n:\ %m,%-Q,%-GFound\ %s,%-GSome\ %s,%-Gfixjsstyle%s,%-Gscript\ can\ %s,%-G

autocmd BufRead,BufNewFile *.mss set syntax=carto
autocmd BufRead,BufNewFile *.css set tabstop=2 | set shiftwidth=2
autocmd BufRead,BufNewFile *.html set tabstop=2 | set shiftwidth=2
autocmd BufRead,BufNewFile *.hbs set tabstop=2 | set shiftwidth=2
au BufRead,BufNewFile *.scss set filetype=scss

augroup hbs
  autocmd BufRead *.hbs set filetype=html
augroup END

" SyntaxComplete options
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
  \ if &omnifunc == "" |
  \ setlocal omnifunc=syntaxcomplete#Complete |
  \ endif
endif

" VIM-Session
let g:session_autosave = 'no'
let g:session_autoload = 'no'

" PHP Syntax Checking mapped to Leader/s
set makeprg=php\ -l\ %
noremap <silent> <Leader>s :!php -ln %
noremap <silent> <Leader>rs :!php -f %

" File browser focus
map <leader>f :maca openFileBrowser:<CR>
" DrupalCS support
noremap <silent> <Leader>dcs :!phpcs --standard=DrupalCodingStandard %

" Taglist
let Tlist_Ctags_Cmd="/usr/local/Cellar/ctags/5.8/bin/ctags"

" Tagbar
let g:tagbar_ctags_bin='/usr/local/Cellar/ctags/5.8/bin/ctags'
let g:tagbar_width=40
" Display panel with \y (or ,y)
map <leader>y :execute 'TagbarToggle'<CR>

" Set PHP executable
let s:php_executable='/Applications/MAMP/bin/php/php5.2.17/bin/php'

" Highlight editing line
hi LineNr guifg=#3D3D3D guibg=black gui=NONE ctermfg=darkgray ctermbg=NONE cterm=NONE

" Syntastic
if has('statusline')
    set statusline+=%*
    set laststatus=2
    " Broken down into easily includeable segments
    "set statusline=%<%f\ " Filename
    "set statusline+=%w%h%m%r " Options
    set statusline+=%{fugitive#statusline()}
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=\ [%{&ff}/%Y] " filetype
    "set statusline+=\ [%{getcwd()}] " current dir
    set statusline+=%#warningmsg#
    let g:syntastic_enable_signs=1
    let g:syntastic_auto_jump=1
    set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info
endif

" Reload documents
set autoread

" Marked
nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>

" PHPCS and Syntastic
let g:syntastic_phpcs_conf="--standard=DrupalCodingStandard --extensions=php,module,inc,install,test,profile,theme"
let g:syntastic_phpcs_disable=1

" Drupal-specific
let g:Drupal_dirs = {6: '/Users/kosta/Sites/d6', 7: '/Users/kosta/Sites/d7'}

" Status bar
set laststatus=2

" Ctags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
map <C-\> :tnext<CR>

" Remember last location in file
if has("automcd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Show partial command in status line
set showcmd

"SECTION: NERDTree Customization
"" \d will hide/show
" \b will enter :NERDTreeFromBookmark and then
" " you can autocomplete the name of a bookmark
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
map <leader>b :NERDTreeFromBookmark
let NERDTreeIgnore=['\.pyc$', 'CVS', '\~$']

function! s:ToggleWhitespaceMatch(mode)
  let pattern = (a:mode == 'i') ? '\s\+\%#\@<!$' : '\s\+$'
  if exists('w:whitespace_match_number')
    call matchdelete(w:whitespace_match_number)
    call matchadd('ExtraWhitespace', pattern, 10, w:whitespace_match_number)
  else
    " Something went wrong, try to be graceful.
    let w:whitespace_match_number =  matchadd('ExtraWhitespace', pattern)
  endif
endfunction

" No temporary files
set nobackup
set nowritebackup
set noswapfile

" Hide right sidebar
set guioptions-=r
