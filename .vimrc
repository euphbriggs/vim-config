set encoding=utf-8
set nocompatible
syntax on
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'elixir-editors/vim-elixir'
Plugin 'elmcast/elm-vim'
Plugin 'fatih/vim-go'
Plugin 'fishcakez/vim-dialyzer'
Plugin 'fsharp/vim-fsharp'
Plugin 'gabrielelana/vim-markdown'
Plugin 'godlygeek/tabular'
Plugin 'kburdett/vim-nuuid'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'prettier/vim-prettier'
Plugin 'scrooloose/nerdtree'
Plugin 'slashmili/alchemist.vim'
Plugin 'tomasiser/vim-code-dark'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'universal-ctags/ctags'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-syntastic/syntastic'
Plugin 'w0rp/ale'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'yami-beta/asyncomplete-omni.vim'
Plugin 'OmniSharp/omnisharp-vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'

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
:set nowrap
:set nofoldenable " Disable folding when opening files
:let g:easytags_on_cursorhold=0
:let g:easytags_auto_update=0
:let g:ale_fix_on_save = 1
:let g:ale_lint_on_save = 1
:let g:ale_completion_enabled = 1
:let g:ale_sign_column_always = 1
:let g:airline#extensions#ale#enabled = 1
:let g:OmniSharp_server_type = 'roslyn'
:let g:OmniSharp_prefer_global_sln = 1
:let g:OmniSharp_selector_ui = 'ctrlp'
:let g:ale_javascript_eslint_options = "--no-eslintrc"
:let g:ale_javascript_eslint_suppress_missing_config = 1
:let g:go_metalinter_autosave = 1

let g:ale_sign_error = "◉"
let g:ale_sign_warning = "◉"
highlight ALEErrorSign ctermfg=9 ctermbg=Black
highlight ALEWarningSign ctermfg=11 ctermbg=Black
nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>

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

let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \ 'cs': ['uncrustify'],
            \ 'css': ['prettier'],
            \ 'elixir': ['mix_format'],
            \ 'go': ['gofmt', 'goimports'],
            \ 'javascript': ['prettier', 'eslint']
            \}

let g:ale_linters = {'cs': ['OmniSharp'], 'elixir': ['elixir', 'elixir-ls', 'dialyxir']}

augroup omnisharp_commands
    autocmd!
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
augroup END

nnoremap <Leader>cf :OmniSharpCodeFormat<CR>
nnoremap <Leader>th :OmniSharpHighlightTypes<CR>

:command! FormatHTML !tidy -m -q --output-xhtml y --indent "yes" --indent-attributes n --indent-spaces "4" --wrap "200" --tidy-mark no --escape-cdata yes %

" Async Complete Keymaps
inoremap <Nul> <C-n>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-x><C-o>
let g:asyncomplete_remove_duplicates = 1
let g:asyncomplete_smart_completion = 1
let g:asyncomplete_auto_popup = 0
call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
            \ 'name': 'omni',
            \ 'whitelist': ['*'],
            \ 'blacklist': ['c', 'cpp', 'html'],
            \ 'completor': function('asyncomplete#sources#omni#completor')
            \  }))

" Set navigating through splits like cursor
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Set CTRL-S to split lines in normal mode
nnoremap <C-S> i<CR><ESC>

set list " Display unprintable characters f12 - switches
set listchars=tab:\ \ ,trail:•,extends:»,precedes:« " Unprintable chars mapping

" Configure function keys
nnoremap <F2> :OmniSharpRename
nmap <F6> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
:let g:NERDTreeWinSize=50

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#close_symbol = '×'
let g:airline#extensions#tabline#show_close_button = 0
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = " "
let g:airline_symbols.whitespace = " "

" OmniSharp Code Actions
set updatetime=500

sign define OmniSharpCodeActions text=💡

augroup OSCountCodeActions
    autocmd!
    autocmd FileType cs set signcolumn=yes
    autocmd CursorHold *.cs call OSCountCodeActions()
augroup END

function! OSCountCodeActions() abort
    if OmniSharp#CountCodeActions({-> execute('sign unplace 99')})
        let l = getpos('.')[1]
        let f = expand('%:p')
        execute ':sign place 99 line='.l.' name=OmniSharpCodeActions file='.f
    endif
endfunction

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
