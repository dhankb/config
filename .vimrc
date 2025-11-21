"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General                                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set nocompatible                       " Get out of VI's compatible mode
set autoindent                         " Copy indent from current line when starting a new line
set autoread                           " Set to auto read when a file is changed from the outside
set enc=utf-8                          " Default encoding
set tenc=utf-8                         " Default term encoding
set fenc=utf-8                         " Default file encoding
set fencs=utf-8,cp950,big5,euc-jp      " File encodings guess list
set showcmd                            " See partial commands as you type
set showmatch                          " Cursor shows matching ) and }
set showmode                           " Show current mode
set number                             " Show line number
set backspace=2                        " Can use backspace
set history=500                        " Set how many lines of history VIM have to remember
set ruler                              " Show the cursor position all the time
set wildmenu                           " wild char completion menu
"set smartcase                          " ignore case if search pattern is all lowercase,case-sensitive otherwise
"set smarttab                           " insert tabs on the start of a line according to context
set showfulltag                        " Show full completion tags
set laststatus=2                       " The last window will always have a status line
set incsearch
set background=dark                    " Use {color} for the background
set t_Co=256                           " Set number of colors

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Users                                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noexpandtab
set expandtab
set tabstop=3
set shiftwidth=3
set sts=3
set hlsearch
set cursorline
set wrap
set fileformat=unix

set foldcolumn=1
set foldclose=
set foldmethod=manual
set foldnestmax=3
set foldlevel=0
set fillchars=vert:\|,fold:\
set foldminlines=1
set tags+=./tags,./TAGS,tags;~,TAGS;~
set termencoding=utf-8
"set grepprg=rg\ -tc\ -tmake\ -tsh\ -tpy\ -th\ --vimgrep\ $*
set grepprg=rg\ --vimgrep\ $*
set grepformat=%f:%l:%c:%m

set cscopetag
set cscopeprg='gtags-cscope'
let GtagsCscope_Auto_Load = 1
let GtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1

au BufWritePost *.c,*.cpp,*.h silent! !gtags -vq &

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mapping                                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Go to tab by number
let mapleader = "\<space>"
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

nmap <leader>g :tab cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>s :tab cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>t :tab cs find t <C-R>=expand("<cword>")<CR><CR>

nmap gd :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap gs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap gt :cs find t <C-R>=expand("<cword>")<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle                                                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'wincent/command-t'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mics                                                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'preservim/nerdtree'
nnoremap <F5> :exec 'NERDTreeToggle' <CR>

Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='papercolor'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=0
let g:airline#extensions#tabline#buffer_nr_format='%s: '
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' :'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = '☰ '
let g:airline_symbols.dirty='⚡'

Plugin 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = {
\ 'dir':  '\v[\/]\.(git|hg|svn)$',
\ 'binary file': '\v\.(exe|so|dll)$',
\ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

Plugin 'gnattishness/cscope_maps'

Plugin 'majutsushi/tagbar'
nmap <F6> :TagbarToggle<CR>
" set focus to TagBar when opening it
let g:tagbar_left = 0
let g:tagbar_sort = 0
let g:tagbar_width = 40

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color Scheme                                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="high"
colorscheme solarized

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax                                                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on                              " syntax highlight
set hlsearch                           " search highlighting
set list
set listchars=tab:>·,trail:-,extends:>,precedes:<
"set colorcolumn=80
"highlight ColorColumn ctermbg=236
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif
