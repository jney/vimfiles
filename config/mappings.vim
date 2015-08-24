" ',' is the leader character
let mapleader=","
let g:mapleader = ","

" fix arrows in console
map  <Esc>Oa <C-Top>
map! <Esc>Oa <C-Top>
map  <Esc>Ob <C-Down>
map! <Esc>Ob <C-Down>
map  <Esc>Oc <C-Right>
map! <Esc>Oc <C-Right>
map  <Esc>Od <C-Left>
map! <Esc>Od <C-Left>

map <Esc><Esc>[C <M-Right>
map!<Esc><Esc>[C <M-Right>
map <Esc><Esc>[D <M-Left>
map!<Esc><Esc>[D <M-Left>

" duplicate line
map <D-d> <Esc>mzyyp`z

" jk as escape
inoremap jj <Esc>

" indentation
vnoremap > >gv
vnoremap < <gv
vmap <S-Tab> <
vmap <Tab> >

" Enter turns off any highlighted matches, then acts as normal
nnoremap <CR> :noh<CR><CR>

" make vim's regex interpretation friendlier (see :h pattern)
nnoremap / /\v
vnoremap / /\v

" Onens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Move lines up and down
map <Leader>> :m +1 <CR>
map <Leader>< :m -2 <CR>

" arrows behave as soft wrap
noremap <Down> gj
noremap <Up> gk

" http//stackoverflow.com/questions/95072/what-are-your-favorite-vim-tricks/96492#96492
cmap w!! %!sudo tee > /dev/null %

" emacs like
imap <C-a> <Esc>0i
imap <C-e> <Esc>A
imap <C-k> <Esc>c0

" move lines
nnoremap <C-Down> :m .+1<CR>==
nnoremap <C-Top> :m .-2<CR>==
inoremap <C-Down> <Esc>:m .+1<CR>==gi
inoremap <C-Top> <Esc>:m .-2<CR>==gi
vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <C-Top> :m '<-2<CR>gv=gv

" Better command-line editing
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Use jk as <Esc> alternative
inoremap jk <Esc>

" Duplicate a selection
" Visual mode: D
vmap D y'>p
nmap D mayyp`a

" Press Shift+P while in visual mode to replace the selection without
" overwriting the default register
vmap P p :call setreg('"', getreg('0')) <CR>
" in visual mode run a replace with selected text
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" highlight selected
"vmap * y:let @/ = @"<CR>

" switching
nnoremap - :Switch<cr>

" no smartcase for searcg forward
nnoremap * /\<<C-R>=expand('<cword>')<CR>\><CR>
" backward search with shift-*
nnoremap µ ?\<<C-R>=expand('<cword>')<CR>\><CR>

" Escape special characters in a string for exact matching.
" This is useful to copying strings from the file to the search tool
" Based on this - http://peterodding.com/code/vim/profile/autoload/xolox/escape.vim
function! EscapeString (string)
  let string=a:string
  " Escape regex characters
  let string = escape(string, '^$.*\/~[]')
  " Escape the line endings
  let string = substitute(string, '\n', '\\n', 'g')
  return string
endfunction

" Get the current visual block for search and replaces
" This function passed the visual block through a string escape function
" Based on this - http://stackoverflow.com/questions/676600/vim-replace-selected-text/677918#677918
function! GetVisual() range
  " Save the current register and clipboard
  let reg_save = getreg('"')
  let regtype_save = getregtype('"')
  let cb_save = &clipboard
  set clipboard&

  " Put the current visual selection in the " register
  normal! ""gvy
  let selection = getreg('"')

  " Put the saved registers and clipboards back
  call setreg('"', reg_save, regtype_save)
  let &clipboard = cb_save

  "Escape any special characters in the selection
  let escaped_selection = EscapeString(selection)

  return escaped_selection
endfunction

" replace all occurences of the word under the cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
" Start the find and replace command across the entire file
vmap <leader>s <Esc>:%s/<c-r>=GetVisual()<cr>/

" reselect the pasted text
nnoremap <leader>v V`]`

" remap the p command in visual mode so that it first deletes to the black
" hole register
xnoremap p "_dP
