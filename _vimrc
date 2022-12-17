command! Config edit! $MYVIMRC
command! Reload so $MYVIMRC
command! Color execute "e C:\\Program Files (x86)\\Vim\\vimfiles\\colors\\shantyv2.vim"

" plugins
call plug#begin('$VIM/vimfiles/bundle')
Plug 'junegunn/vim-easy-align'
Plug 'triglav/vim-visual-increment'
Plug 'itchyny/lightline.vim'
Plug 'flazz/vim-colorschemes'
Plug 'vim-scripts/ScrollColors'
Plug 'scrooloose/nerdtree'
Plug 'justinmk/vim-sneak'
" -- the pain is eternal
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
call plug#end()

" this is a thing?
if (has("termguicolors"))
    set termguicolors
endif

" encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf8,latin1
set fileencoding=utf-8
scriptencoding utf-8

set fillchars=vert:\│

" editor settings
set nomousehide
set expandtab
set backspace=2
set tabstop=4
set shiftwidth=4
set iskeyword-=_
set iskeyword-=,
set hlsearch
set ignorecase
set smartcase
set nomagic


" default sizing
autocmd GUIEnter * winpos 160 22
autocmd GUIEnter * set lines=42 columns=148


" set shell and build shortcut
" set shell=powershell.exe
" set shellcmdflag=                   " comment these lines out
" set shellxquote=                    " for running vim-plug commands

function! RunScript(script)
    if !filereadable(a:script)
        echon '[Error] No file ' a:script . ' in ' getcwd()
        return
    endif

    echon '[' a:script . ']  Running ...  '
    let output = system(".\\" . a:script)
    if v:shell_error == 0
        echon 'Success                       ' getcwd()
    else
        echon 'Failed  :: '
        echon v:shell_error
        echo  '----------------------------------------------'
        echo  output
    endif
endfunction

nnoremap <silent> <C-b> :call RunScript("build.bat")<CR>


" next search - center
nnoremap <silent> n nzt10<C-y>
nnoremap <silent> <S-n> <S-n>zt10<C-y>

" undo highlighting
nnoremap <silent> <ESC> :noh<CR><ESC>

" ctrl-c is easier than esc
inoremap <silent> <C-c> <ESC>
nmap <silent> <C-c> <ESC>
vmap <silent> <C-c> <ESC>

" change no copy
vnoremap c "_c

" delete no copy
nnoremap <Del> v"_d
vnoremap <Del> "_d

" making paste easier
nnoremap y "+y
vnoremap y "+y

nnoremap <A-p> :pu<CR>
nnoremap <A-P> :pu!<CR>
vnoremap <A-p> "_dP
vnoremap <A-P> "_dP

" white space killa R.I.P
nmap <silent> <C-Enter> V"_d

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

" the thinkpad (tm) experience (tm^2)
nmap <silent> <S-PageUp> <Nop>
imap <silent> <S-PageUp> <Nop>
vmap <silent> <S-PageUp> <Nop>
nmap <silent> <S-PageDown> <Nop>
imap <silent> <S-PageDown> <Nop>
vmap <silent> <S-PageDown> <Nop>
nmap <silent> <PageUp> <Nop>
imap <silent> <PageUp> <Nop>
vmap <silent> <PageUp> <Nop>
nmap <silent> <PageDown> <Nop>
imap <silent> <PageDown> <Nop>
vmap <silent> <PageDown> <Nop>

" gv for pasted text
nnoremap gp `[v`]

" hold onto visual selection
vnoremap < <gv
vnoremap > >gv

" cd to file
nnoremap <leader>cd :cd %:p:h<CR>

" create new splits
nmap <silent> <F1> :vnew<CR> <C-W>r
nmap <silent> <F2> :vsp<CR>
nmap <silent> <F3> :tabnew<CR>:NERDTree<CR>

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

" move horizontal splits
nmap <silent> <S-Left> :wincmd h<CR><C-W>x
nmap <silent> <S-Right> <C-W>x:wincmd l<CR>

" easier insert navigation
inoremap <silent> <C-Right> <C-o>e<C-o>l

" easy align
xmap <silent> ga <Plug>(EasyAlign)
nmap <silent> ga <Plug>(EasyAlign)

" nerd-tree
let NERDTreeShowHidden=1
nmap <silent> <C-n> :NERDTree<CR>
autocmd StdinReadPre * let s:std_in=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" some formatting stuff
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" switch to header/implementation
function! SwitchFile()
    let file_path=@%

    let parent=fnamemodify(file_path, ':h')
    let file_search=fnamemodify(file_path, ':t:r') . ".*"
    let matches=split(globpath(parent, file_search),"\n")

    " remove abbrev for cwd
    if parent == "\."
        let matches=map(matches, "fnamemodify(v:val, ':t')")
    endif

    let target=""
    for match in matches
        " search for non-current file
        if file_path !=# match
            let target=match
            break
        endif
    endfor

    if empty(target)
        echo "No matching files."
        return
    endif

    execute ":e " . target

endfunction

nmap <C-h> :call SwitchFile()<CR>

" format shaders like c
augroup filetypedetect
    au! BufRead,BufNewFile *.geo  setfiletype c
    au! BufRead,BufNewFile *.vert setfiletype c
    au! BufRead,BufNewFile *.frag setfiletype c

    au! BufRead,BufNewFile *.gs  setfiletype c
    au! BufRead,BufNewFile *.vs  setfiletype c
    au! BufRead,BufNewFile *.fs  setfiletype c
augroup END

" disable weird macro indenting
set cinkeys=0{,0},0),:,!^F,o,O,e

" remember line last opened on
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\" zz" | endif

" getting rid of gvim bloat
set guioptions-=m  "menu bar
set guioptions-=T  "toolbar
set guioptions-=r  "scrollbar
set guioptions-=L  "window snapping
set guioptions+=k  "dodging the window unhinging
set guicursor+=a:blinkon0 "disable the damn cursor blink

" aesthetics
colorscheme shantyv2
set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'shantyline',
    \ }

function! PickFont()
    silent! execute "set guifont=*"
    echo "Chosen Font \n----------------------"
    execute "set guifont?"
    echo ""
endfunction

function! UpdateFont(val)
    let g:fontSize = get(g:, 'fontSize', '15')
    if a:val != 0
        let g:fontSize = g:fontSize + a:val
    endif
    silent! execute "set guifont=Consolas:h" . g:fontSize
endfunction

autocmd VimEnter * call UpdateFont(0)

nnoremap <C-x> :call UpdateFont(1)<CR>:echo 'Setting font size:' g:fontSize<CR>
nnoremap <C-z> :call UpdateFont(-1)<CR>:echo 'Setting font size:' g:fontSize<CR>


