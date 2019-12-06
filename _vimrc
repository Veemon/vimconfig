command! Config edit! $MYVIMRC
command! Reload so $MYVIMRC

" plugins
call plug#begin('$VIM/vimfiles/bundle')
Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
Plug 'triglav/vim-visual-increment'
Plug 'flazz/vim-colorschemes'
Plug 'vim-scripts/ScrollColors'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

" working directory
" -----------------------------------
cd ~/per/vulkan_explained
" -----------------------------------

" encoding
set encoding=utf-8
scriptencoding utf-8
setglobal fileencoding=utf-8
set fillchars=vert:\│

" editor settings
set nomousehide
set expandtab
set backspace=2
set tabstop=4
set shiftwidth=4
set pastetoggle=<F2>
set iskeyword-=_

" ctrl-c is easier than esc
inoremap <silent> <C-c> <ESC>
nmap <silent> <C-c> <ESC>
vmap <silent> <C-c> <ESC>

" paste is inconsistent in my opinion
xnoremap p "_dP

" white space killa R.I.P
nmap <silent> <C-Enter> dd

" I dont like this, and I dont mind using arrow keys
nmap <silent> <S-Enter> <Nop>
vmap <silent> <S-Enter> <Nop>

nmap <silent> <S-Up> <Nop>
nmap <silent> <S-Down> <Nop>
nmap <silent> <S-Left> <Nop>
nmap <silent> <S-Right> <Nop>

vmap <silent> <S-Up> <Nop>
vmap <silent> <S-Down> <Nop>
vmap <silent> <S-Left> <Nop>
vmap <silent> <S-Right> <Nop>

" gv for pasted text
nnoremap gp `[v`]

" cd to file
nnoremap <leader>cd :cd %:p:h<CR>

" create new split
nmap <silent> <F1> :vnew<CR> <C-W>r

" use arrow keys for split navigation
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" resize horzontal split window
nmap <silent> <C-Up> <C-W>-
nmap <silent> <C-Down> <C-W>+
nmap <silent> <C-Left> <C-W><
nmap <silent> <C-Right> <C-W>>

" easy align
xmap <silent> ga <Plug>(EasyAlign)
nmap <silent> ga <Plug>(EasyAlign)

" nerd-tree
nmap <silent> <C-n> :NERDTree<CR>
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" some formatting stuff
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" remember line last opened on
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" getting rid of gvim bloat
set guioptions-=m  "menu bar
set guioptions-=T  "toolbar
set guioptions-=r  "scrollbar
set guioptions-=L  "window snapping

" aesthetics
set guifont=Consolas:h14
colorscheme shanty
set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'one',
    \ }

