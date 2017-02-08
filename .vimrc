set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'bufexplorer.zip'
Plugin 'fatih/vim-go'
Plugin 'nsf/gocode'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jimenezrick/vimerl'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'Raimondi/delimitMate'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-surround'
Plugin 'SirVer/ultisnips'
Plugin 'scrooloose/syntastic'

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
"

if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0"
endif

nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

syntax on
set ai
set shiftwidth=2
set tabstop=2
set expandtab
set ruler
set number
set scrolloff=5                 " keep at least 5 lines above/below
set ttyfast                     " we have a fast terminal
set noerrorbells                " no beeps please
set visualbell
set nobackup
set shell=bash
set ff=unix
set t_Co=256
set completeopt-=preview
set clipboard=exclude:.*
set backspace=2
set laststatus=2
set background=dark
set dir=/tmp
colorscheme lucius
LuciusDarkHighContrast
:imap kj <Esc>
nmap <Leader>n :NERDTreeToggle<cr>

let g:rbpt_max = 16

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" vim-go
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
autocmd BufWritePost *.go silent :GoImports
autocmd BufWritePre * %s/\s\+$//e

let NERDTreeShowHidden=1
