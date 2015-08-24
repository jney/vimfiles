" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Automatically removing all trailing whitespace on save
  autocmd BufWritePre * :%s/\s\+$//e

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " automatically reload vimrc when it's saved
  autocmd BufWritePost .vimrc so ~/.vimrc

  " go
  autocmd BufWritePre,FileWritePre *.go :Fmt
  autocmd FileType go setlocal noexpandtab

  " html
  autocmd BufRead,BufNewFile *.html iabbrev </ </<C-X><C-O>

  " javascript
  "autocmd BufWritePre,FileWritePre *.js :JSBeautify
  autocmd FileType javascript setl fen
  autocmd FileType javascript setl nocindent
  autocmd FileType javascript inoremap <buffer> $r return

  " JSON
  autocmd BufNewFile,BufRead *.json set ft=javascript

  " Makefile
  autocmd FileType make setlocal noexpandtab

  " ruby
  autocmd FileType ruby setlocal tabstop=2|set shiftwidth=2|set expandtab|set omnifunc=rubycomplete#Complete
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
else
  set autoindent " always set autoindenting on
endif
