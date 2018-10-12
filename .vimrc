set encoding=utf-8
syntax on
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tomasiser/vim-code-dark'
Plugin 'vim-airline/vim-airline'
Plugin 'slashmili/alchemist.vim'
Plugin 'fatih/vim-go'
Plugin 'elmcast/elm-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'universal-ctags/ctags'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'majutsushi/tagbar'
Plugin 'elixir-editors/vim-elixir'
Plugin 'tpope/vim-sensible'
Plugin 'vim-syntastic/syntastic'
Plugin 'fsharp/vim-fsharp'
Plugin 'w0rp/ale'
Plugin 'gabrielelana/vim-markdown'
Plugin 'godlygeek/tabular'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'fishcakez/vim-dialyzer'

call vundle#end()            " required
filetype plugin indent on    " required

" Turn on mouse support
set mouse=a

" Set options for correct terminal colors
set t_Co=256
set t_ut=
colorscheme codedark
let g:airline_theme = 'codedark'

:set term=screen-256color
:set number
:set tabstop=4
:set shiftwidth=4
:set expandtab
:set colorcolumn=150
:set clipboard=unnamed " Turns off vim clipboard
:set splitright
:set splitbelow
:set ttymouse=xterm2
:set hlsearch
:set cursorline
:let g:easytags_on_cursorhold=0
:let g:easytags_auto_update=0
:let g:ale_fix_on_save = 1
:let g:ale_completion_enabled = 1
:let g:ale_sign_column_always = 1
:let g:airline#extensions#ale#enabled = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Syntastic Language Toggles
let g:syntastic_enable_elixir_checker = 1
let g:elm_syntastic_show_warnings = 1

" Elixir LSP
augroup elixir_lsp
      au!
        au User lsp_setup call lsp#register_server({
            \ 'name': 'elixir-ls',
            \ 'cmd': {server_info->[&shell, &shellcmdflag, '~/Sandbox/elixir-ls/lsp/language_server.sh']},
            \ 'whitelist': ['elixir', 'eelixir'],
            \ })
augroup END

let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \ 'elixir': ['mix_format'],
            \}

let g:ale_linters = {
            \ 'elixir': [],
            \}

" Async Complete Keymaps
inoremap <Nul> <C-n>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
let g:asyncomplete_remove_duplicates = 1
let g:asyncomplete_smart_completion = 0
let g:asyncomplete_auto_popup = 1

" Set navigating through splits like cursor
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set list " Display unprintable characters f12 - switches
set listchars=tab:•\ ,trail:•,extends:»,precedes:« " Unprintable chars mapping

" Open tag bar with F8
nmap <F8> :TagbarToggle<CR>

" NERDTree
"autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
"autocmd vimenter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
:let g:NERDTreeWinSize=50

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = " "
let g:airline_symbols.whitespace = " "


" Vim-Alchemist Mappings
autocmd FileType elixir nnoremap <buffer> <leader>h :call alchemist#exdoc()<CR>
autocmd FileType elixir nnoremap <buffer> <leader>d :call alchemist#exdef()<CR>

" Elm tagbar config
let g:tagbar_type_elm = {
          \   'ctagstype':'elm'
          \ , 'kinds':['h:header', 'i:import', 't:type', 'f:function', 'e:exposing']
          \ , 'sro':'&&&'
          \ , 'kind2scope':{ 'h':'header', 'i':'import'}
          \ , 'sort':0
          \ , 'ctagsbin':'~/.bin/elmtags.py'
          \ , 'ctagsargs': ''
          \ }

" Elixir tagbar config
let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records',
        \ 't:tests'
    \ ]
    \ }