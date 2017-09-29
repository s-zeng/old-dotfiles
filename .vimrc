filetype off                  " required

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
"Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
"Plugin 'Shougo/vimproc.vim'
"Plugin 'Shougo/vimshell.vim'
"Plugin 's-zeng/repl.vim'
"Plugin 'majutsushi/tagbar'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'scrooloose/nerdtree'
"Plugin 'Xuyuanp/nerdtree-git-plugin'

" All of your Plugins must be added before the following line
"call vundle#end()            " required

if &compatible
  set nocompatible
endif
set runtimepath+=/home/kronicmage/.vim/bundle/repos/github.com/Shougo/dein.vim

if dein#load_state(expand('~/.vim/bundle'))
  call dein#begin(expand('~/.vim/bundle'))

  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  call dein#add('Shougo/vimshell.vim')
  call dein#add('s-zeng/repl.vim')
  call dein#add('majutsushi/tagbar')
  call dein#add('scrooloose/nerdtree')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('w0rp/ale')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup

set number
set backspace=2

colorscheme monokai
"hi CursorLine ctermfg=NONE ctermbg=234 cterm=NONE guifg=NONE guibg=#3c3d37 gui=NONE
"hi LineNr ctermfg=102 ctermbg=234 cterm=NONE guifg=#90908a guibg=#3c3d37 gui=NONE

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

set hlsearch
set nowrap
set mouse=a

let g:NERDTreeWinSize=24
let g:vimshell_popup_height=10
let g:vimshell_popup_command=':split|:res 10|:wincmd r|:set nonumber'
let g:vimshell_prompt='vimshell > '
let g:vimshell_prompt_expr = 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '
let g:tagbar_width = 24

 " neocomplete {{{
if 1
  let g:neocomplete#data_directory = '~/.vim/tmp/neocomplete'
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_auto_select = 1
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplete#auto_completion_start_length = 2

  " increase limit for tag cache files
  let g:neocomplete#sources#tags#cache_limit_size = 16777216 " 16MB

  " fuzzy completion breaks dot-repeat more noticeably
  " https://github.com/Shougo/neocomplete.vim/issues/332
  let g:neocomplete#enable_fuzzy_completion = 0

  " always use completions from all buffers
  if !exists('g:neocomplete#same_filetypes')
    let g:neocomplete#same_filetypes = {}
  endif
  let g:neocomplete#same_filetypes._ = '_'

  " enable omni-completion for Ruby and PHP
  call neocomplete#util#set_default_dictionary(
        \'g:neocomplete#sources#omni#input_patterns', 'ruby',
        \'[^. *\t]\.\h\w*\|\h\w*::\w*')
  call neocomplete#util#set_default_dictionary(
        \'g:neocomplete#sources#omni#input_patterns',
        \'php',
        \'[^. \t]->\h\w*\|\h\w*::\w*')

  " enable for Python
  call neocomplete#util#set_default_dictionary(
        \'g:neocomplete#sources#omni#input_patterns',
        \'python',
        \'[^. \t]->\h\w*\|\h\w*::\w*')

  " from neocomplete.txt:
  " ---------------------

  " Plugin key-mappings.
  inoremap <expr> <C-g> neocomplete#undo_completion()
  inoremap <expr> <C-l> neocomplete#complete_common_string()

  " Recommended key-mappings.
  " <CR>: cancel popup and insert newline.
  inoremap <silent> <CR> <C-r>=neocomplete#smart_close_popup()<CR><CR>
  " <TAB>: completion.
  inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr> <C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr> <BS>  neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr> <C-y> neocomplete#close_popup()
  inoremap <expr> <C-e> neocomplete#cancel_popup()
endif
 " }}}

set pastetoggle=<F2>
nmap <F9> :TagbarToggle<CR>
inoremap <F9> <ESC>:TagbarToggle<CR>
nmap <F8> :NERDTreeToggle<CR>
inoremap <F8> <ESC>:NERDTreeToggle<CR>
inoremap <F10> <ESC>:VimShellPop<CR>
nmap <F10> :VimShellPop<CR>
"inoremap <F5> <ESC><C-p>YGpi<CR>
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <F5> <Plug>(ale_toggle)

set cursorline

let g:ale_completion_enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='ravenpower'
let g:airline#extensions#ale#enabled = 1
let g:ale_enabled = 0
let g:airline_detect_modified=1
let g:airline_detect_crypt=1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#tab_min_count = 2
set ttimeoutlen=10
set noshowmode
