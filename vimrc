set shell=bash

filetype off
set rtp+=~/.vim/bundle/vundle/
set rtp+=$GOROOT/misc/vim
call vundle#rc()
Plugin 'gmarik/vundle'

Plugin 'benmills/vimux'
Plugin 'bilalq/lite-dfm'
Plugin 'bruno-/vim-vertical-move'
Plugin 'dahu/SearchParty'
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'gregsexton/MatchTag'
Plugin 'justincampbell/vim-eighties'
Plugin 'kana/vim-fakeclip'
Plugin 'kana/vim-smartinput'
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-line'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'Lokaltog/vim-powerline'
Plugin 'majutsushi/tagbar'
Plugin 'mileszs/ack.vim'
Plugin 'mxw/vim-jsx'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'othree/yajs.vim'
Plugin 'rhysd/wombat256.vim'
Plugin 'rhysd/clever-f.vim'
Plugin 'rhysd/vim-textobj-lastinserted'
Plugin 'rhysd/vim-textobj-ruby'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'SirVer/ultisnips'
Plugin 'skammer/vim-css-color'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/eruby.vim'
Plugin 'Yggdroot/indentLine'

" go
set rtp+=$GOROOT/misc/vim
Plugin 'nsf/gocode', {'rtp': 'vim/'}

" load everything else in its own config file
runtime! config/**/*

set autoindent
set autoread                                      " watch for file changes
set backspace=indent,eol,start                    " allow backspacing over everything in insert mode
set clipboard+=unnamed
set cursorline                                    " show the cursor line
set dictionary=/usr/share/dict/words              " more words!
set encoding=utf-8                                " force UTF-8 as default
set fileformat=unix                               " file mode is unix
set guifont=fixed
set guioptions=aAce
set history=100                                   " how many commands to remember
set hlsearch
set incsearch                                     " do incremental searching
set iskeyword+=_,$,@,%,#,-                        " these shouldn't divide words.
set laststatus=2                                  " Always display the status line
set list                                          " display invisible characters
set listchars=tab:▸\ ,eol:¬,trail:•               " Display extra whitespace
set magic                                         " special characters that can be used in search patterns
set matchpairs+=<:>                               " add < and > to match pairs
set matchtime=3
set more                                          " use more prompt
set nobackup
set nofoldenable                                  " no folding
set nowritebackup
set noconfirm                                     " Gives you a confirm-dialog instead of a flat refusal
set noerrorbells                                  " no error bells please
set hidden                                        " don't close the buffer when I close a tab
set noswapfile                                    " turn off backups and files
set nowrap                                        " don't wrap lines
set number                                        " display line number
set numberwidth=5                                 " line number width
set path=.,,**                                    " tabfind will look every where in the current directory
set ruler                                         " show the cursor position all the time
set scrolloff=8                                   " lines above/below cursor when scrolling
set selection=exclusive                           " do not copy the the last character
set sessionoptions-=options                       " do not store global and local values in a session
set sessionoptions-=folds                         " do not store folds
set showcmd                                       " display incomplete commands
set showmatch
set showmode                                      " show the mode all the time
set splitbelow
set splitright
set termencoding=utf-8                            " Also for terminals.
set ts=2 sts=2 sw=2 expandtab                     " Softtabs, 2 spaces
set visualbell
set whichwrap+=<,>,h,l,[,]                        " allow arrow do wrap arround
set wildignore+=*.db                              " Databases
set wildignore+=.hg,.git,.svn                     " Version control
set wildignore+=*.aux,*.out,*.toc                 " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg    " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest  " compiled object files
set wildignore+=*.spl                             " compiled spelling word lists
set wildignore+=*.sw?                             " Vim swap files
set wildignore+=*.DS_Store                        " OSX bullshit
set wildignore+=*.luac                            " Lua byte code
set wildignore+=*.pyc                             " Python byte code
set wildmenu
set wildmode=longest,list
set complete=.,b,u,]
set completeopt=menu,preview
set noignorecase

if has("gui_running")
  colorscheme base16-default
else
  set t_Co=256
  let base16colorspace=256  " Access colors present in 256 colorspace
  set background=dark
  colorscheme delek
  hi CursorLine cterm=NONE ctermbg=Black
end

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has('gui_running')) && !exists('syntax_on')
  syntax on
  set hlsearch
endif

if has('mouse')
  set mouse=a
endif

" NERD commenter
map <D-/>:call NERDComment(0,"toggle")<C-m>

" ultisnips
let g:UltiSnipsEditSplit = 'vertical'

" syntastic
let g:syntastic_enable_signs = 1
let g:syntastic_auto_jump = 1
let g:syntastic_check_on_open = 1
"let g:syntastic_ruby_checkers = ['rubocop', 'rubylint', 'mri']

" neocomplete.
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_fuzzy_completion = 1
let g:neocomplete_enable_fuzzy_completion_start_length = 2
let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#max_list = 12
noremap <expr><Tab>  neocomplete#start_manual_complete()

let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

" unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <C-f> :Unite grep:.<cr>
nnoremap <C-p> :<C-u>Unite -no-split -buffer-name=files -start-insert file_rec/async:!<cr>
nnoremap <C-s> :Unite buffer file<cr>

if executable('pt')
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_encoding = 'utf-8'
endif


