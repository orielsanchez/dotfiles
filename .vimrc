inoremap kj <ESC>

let mapleader = ","
let maplocalleader = "\\"

set nocompatible

syntax on			" Enable syntax highlighting
filetype plugin indent on	" Load plugins according to detected filetype
set encoding=utf-8

set clipboard=unnamed
set autoindent			" Indent according to previous line
set number			" Show line number
set norelativenumber		" Disable relative line number
set expandtab			" Use spaces instead of tabs
set tabstop=4
set softtabstop=4		" Tab key indents by 4 spaces
set shiftwidth=4		" >> indents by 4 spaces
set shiftround			" >> indents to next multiple of 'shiftwidth'

set backspace=indent,eol,start 
set hidden			" Switch between buffers without having to save first
set laststatus=2    		" Always show statusline
set display=lastline		" Show as much as possible of the last line

set showmode			" Show current mode in command-line
set showcmd			" Show already typed keys when more are expected
set nowrap
set incsearch			" Highlight while searching
set hlsearch			" Keep matches highlighed

set ttyfast			" Faster redrawing
set lazyredraw			" Only redraw when necessary

set splitbelow			" Open new windows below the current window
set splitright			" Open new windows right of the current window

set cursorline			" Find the current line quickly
set wrapscan			" Searches wrap around end-of-file
set report=0			" Always report changed lines
set synmaxcol=200		" Only highlight the first 200 columns

" Put all temporary files under the same directory.
set backup
set backupdir       =$HOME/.vim/files/backup/
set backupext       =-vimbackup
set backupskip      =
set directory       =$HOME/.vim/files/swap//
set updatecount     =100
set undofile
set undodir         =$HOME/.vim/files/undo/
set viminfo         ='100,n$HOME/.vim/files/info/viminfo

set updatetime      =100    " Show git updates quicker

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'dracula/vim', {'as': 'dracula'}
call plug#end()

"colorscheme gruvbox
colorscheme dracula
let g:dracula_italic = 0

set bg=dark

" Opening and sourcing VIMRC
map <leader><leader>v :vsplit $MYVIMRC<cr>
map <leader><leader>s :source $MYVIMRC<cr>
" Automatically source vimrc after save
" autocmd bufwritepost .vimrc source $MYVIMRC

" Easy save when in insert mode
map <leader><leader>w kj:w<cr>

" Moving the current line up or down
nnoremap - ddp
nnoremap _ ddkp 

" Easier Navigation
nnoremap H 0
nnoremap L A<esc>l 

" Convert the current word to uppercase in different modes
inoremap <c-u> <ESC>viwUea
nnoremap <c-u> viwU

" Wrap current word in double quotes or single quotes
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

nnoremap <leader>nh :nohl<cr>

" Copy the entire buffer to the clipboard
nnoremap <leader><leader><c-c> gg"*yG``

" Name abbreviation
iabbrev @@ orielbenitosanchez@gmail.com

" CPP specifics
augroup filetype_cpp
	autocmd!
	autocmd FileType cpp :inoremap <buffer> <localleader>s std::
    autocmd FileType cpp :inoremap <buffer> cstr std::string
augroup END

" Markdown specifics
augroup filetype_markdown
	autocmd FileType markdown :onoremap ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
	autocmd FileType markdown :onoremap ah :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<cr>
augroup END

onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>

" Quitting bad habits :)
inoremap <esc> <nop>
inoremap <down> <nop>
inoremap <up> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap <down> <nop>
nnoremap <up> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" ## added by OPAM user-setup for vim / ocp-indent ## 87582f7aba83d446ce1702b8a4e638fd ## you can edit, but keep this line
if count(s:opam_available_tools,"ocp-indent") == 0
  source "/Users/oriel/.opam/default/share/ocp-indent/vim/indent/ocaml.vim"
endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line
