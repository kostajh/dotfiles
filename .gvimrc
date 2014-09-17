source ~/.vimrc

if has("gui_running")
  set visualbell
  " hi LineNr guifg=#646464 guibg=#002b36 gui=NONE ctermfg=darkgray ctermbg=black cterm=NONE
  " set lines=999 columns=999
  "  map <D-r> :CtrlPBufTag<CR>
   colorscheme pencil
   set background=light
  set guioptions-=r "kill right scrollbar
  set guioptions-=l "kill left scrollbar
  set guioptions-=L "kill left scrollbar with multiple buffers
  set guioptions-=T "kill toolbar 
  set guioptions-=T
endif
