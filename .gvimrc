source ~/.vimrc
set visualbell

if has("gui_running")
  hi LineNr guifg=#646464 guibg=#002b36 gui=NONE ctermfg=darkgray ctermbg=black cterm=NONE
  set lines=999 columns=999
  map <D-r> :CtrlPBufTag<CR>
  colorscheme solarized
  set guioptions-=T
endif
