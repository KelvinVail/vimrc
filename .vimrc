set nocompatible	" required
filetype off		" required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
set splitbelow
set splitright

if has('statusline')
    set laststatus=2
    set statusline=%<%f\    "Filename
    set statusline+=%w%h%m%r    "options
    set statusline+=%{fugitive#statusline()}
    set statusline+=\ [%{&ff}/%y]   "filetype
    set statusline+=[%{getcwd()}]   "Current Dir
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_enable_signs=1
    set statusline+=%=%-14.(%l,%c%V%)\ %p%% "right aligned file nav info
endif

"split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

Plugin 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview=1

au BufNewFile,BufRead *.py
	set tabstop=4
	set softtabstop=4
	set shiftwidth=4
	set textwidth=79
	set expandtab
	set autoindent
	set fileformat=unix

au BufNewFile,BufRead *.sol
	set tabstop=2
	set softtabstop=2
	set shiftwidth=4
	set textwidth=79
	set expandtab
	set autoindent
	set fileformat=unix

Plugin 'vim-scripts/indentpython.vim'

"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8

Bundle 'Valloric/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g	:YcmCompleter GoToDefinitionElseDeclaration<CR>

Plugin 'scrooloose/syntastic'
Plugin 'tomlion/vim-solidity'
Plugin 'nvie/vim-flake8'
let python_highligh_all=1
"syntax on

hi statusline ctermfg=0 ctermbg=Green cterm=NONE

Plugin 'jnurmine/Zenburn'

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore file in NERDTree

Plugin 'kien/ctrlp.vim'

Plugin 'tpope/vim-fugitive'


set nu

nnoremap <buffer> <F5> :exec '!python' shellescape(@%, 1)<cr>

nnoremap <F2> :NERDTreeToggle<CR>

" All of your Plugins must be added before the following line
call vundle#end()	" required
filetype plugin indent on	" required