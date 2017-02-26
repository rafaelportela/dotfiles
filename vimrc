set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle')

" Let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" My Plugins
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'nanotech/jellybeans.vim'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'vim-syntastic/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'slim-template/vim-slim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
Plugin 'junegunn/vim-easy-align'
Plugin 'rust-lang/rust.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'lambdatoast/elm.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'pangloss/vim-javascript'
Plugin 'helino/vim-json'
Plugin 'bitc/vim-hdevtools'
Plugin 'fatih/vim-go'

let mapleader="\\"

colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1

set cursorline
set expandtab
set modelines=0
set shiftwidth=2
set clipboard=unnamed
set synmaxcol=128
set ttyscroll=10
set encoding=utf-8
set tabstop=4
set nowrap
set number
set expandtab
set nowritebackup
set noswapfile
set nobackup
set hlsearch
set ignorecase
set smartcase

" disable beep
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" use old regex engine (new engine causing slow syntax highlighting)
set re=1

" Automatic formatting
autocmd BufWritePre *.rb :%s/\s\+$//e
autocmd BufWritePre *.haml :%s/\s\+$//e
autocmd BufWritePre *.html :%s/\s\+$//e
autocmd BufWritePre *.scss :%s/\s\+$//e
autocmd BufWritePre *.slim :%s/\s\+$//e

" Language specific indentation style
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype perl setlocal ts=4 sw=4 expandtab
autocmd Filetype go   setlocal ts=4 sw=4 sts=0 noexpandtab

au BufNewFile * set noeol
au BufRead,BufNewFile *.go set filetype=go

" No show command
autocmd VimEnter * set nosc

" Jump to the next row on long lines
map <Down> gj
map <Up>   gk
nnoremap j gj
nnoremap k gk

" format the entire file
nmap <leader>fef ggVG=

" Open new buffers
nmap <leader>s<left>   :leftabove  vnew<cr>
nmap <leader>s<right>  :rightbelow vnew<cr>
nmap <leader>s<up>     :leftabove  new<cr>
nmap <leader>s<down>   :rightbelow new<cr>

" Tab between buffers
noremap <tab> <c-w><c-w>

" Switch between last two buffers
nnoremap <leader><leader> <C-^>

" Resize buffers
if bufwinnr(1)
	nmap Ä <C-W><<C-W><
	nmap Ö <C-W>><C-W>>
	nmap ö <C-W>-<C-W>-
	nmap ä <C-W>+<C-W>+
endif

" NERDTree
nmap <leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']
autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>

" Syntastic
let g:syntastic_mode_map = { 'mode': 'passive' }
" let g:syntastic_ruby_exec = '~/.rvm/rubies/ruby-2.0.0-p0/bin/ruby'

" CtrlP
nnoremap <silent> t :CtrlP<cr>
let g:ctrlp_working_path_mode = 2
let g:ctrlp_by_filename = 1
let g:ctrlp_max_files = 600
let g:ctrlp_max_depth = 5

command -nargs=0 Quit :qa!

" vim-spec
let g:rspec_command = "!bundle exec rspec -fd {spec}"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" elm.vim
nnoremap <leader>el :ElmEvalLine<CR>
vnoremap <leader>es :<C-u>ElmEvalSelection<CR>
nnoremap <leader>em :ElmMakeCurrentFile<CR>

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Specific indentation by filetype
autocmd FileType perl setlocal shiftwidth=4 tabstop=4
nnoremap <silent> tt :!perltidy -q<Enter>
vnoremap <silent> tt :!perltidy -q<Enter>

" vim-hdevtools
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>

" vim-go
au FileType go nmap <leader>r  <Plug>(go-run)
au FileType go nmap <leader>b  <Plug>(go-build)
au FileType go nmap <leader>t  <Plug>(go-test)
au FileType go nmap <leader>c  <Plug>(go-coverage)
au FileType go nmap <leader>cc <Plug>(go-coverage-clear)
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
