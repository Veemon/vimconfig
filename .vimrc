scriptencoding

command! Config edit! $MYVIMRC
command! Reload so $MYVIMRC

if has('win32') || has('win64')
    command! Color execute "e C:\\Program Files (x86)\\Vim\\vimfiles\\colors\\shantyv2.vim"
endif

" see updateFontSize for more info
let g:lockFontSize=1
command! Lock let g:lockFontSize=1
command! Unlock let g:lockFontSize=0

" plugins
if has('win32') || has('win64')
    call plug#begin('$VIM/vimfiles/bundle')
else
    call plug#begin()
endif
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
Plug 'ap/vim-css-color'
Plug 'leafgarland/typescript-vim'
" -- and the suffering endless
Plug 'hdima/python-syntax'
Plug 'JuliaEditorSupport/julia-vim'
call plug#end()

" this is a thing?
if (has("termguicolors"))
    set termguicolors
endif

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
autocmd GUIEnter * winpos 120 60
autocmd GUIEnter * set lines=90 columns=170


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
    if has('win32') || has('win64')
        let output = system(".\\" . a:script)
    else
        let output = system("./" . a:script)
    endif
    if v:shell_error == 0
        echon 'Success                       ' getcwd()
    else
        echon 'Failed  :: '
        echon v:shell_error
        echo  '----------------------------------------------'
        echo  output
    endif
endfunction

if has('win32') || has('win64')
    nnoremap  <C-b> :call RunScript("build.bat")<CR>
else
    nnoremap  <C-b> :call RunScript("build.sh")<CR>
endif

" next search - center
nnoremap  n nzt10<C-y>
nnoremap  <S-n> <S-n>zt10<C-y>

" undo highlighting
nnoremap  <ESC> :noh<CR><ESC>

" ctrl-c is easier than esc
inoremap  <C-c> <ESC>
nmap  <C-c> <ESC>
vmap  <C-c> <ESC>

" change no copy
vnoremap c "_c

" delete no copy
nnoremap <Del> v"_d
vnoremap <Del> "_d

" making paste easier
nnoremap y "+y
vnoremap y "+y

if has('win32') || has('win64')
    nnoremap <A-p> :pu<CR>
    nnoremap <A-P> :pu!<CR>
    vnoremap <A-p> "_dP
    vnoremap <A-P> "_dP
else
    nnoremap <M-p> :pu<CR>
    nnoremap <M-P> :pu!<CR>
    vnoremap <M-p> "_dP
    vnoremap <M-P> "_dP
endif

" white space killa R.I.P
nmap  <C-Enter> V"_d

" I dont like this, and I dont mind using arrow keys
nmap  <S-Enter> <Nop>
vmap  <S-Enter> <Nop>

nmap  <S-Up> <Nop>
nmap  <S-Down> <Nop>
nmap  <S-Left> <Nop>
nmap  <S-Right> <Nop>

vmap  <S-Up> <Nop>
vmap  <S-Down> <Nop>
vmap  <S-Left> <Nop>
vmap  <S-Right> <Nop>

" the thinkpad (tm) experience (tm^2)
nmap  <S-PageUp> <Nop>
imap  <S-PageUp> <Nop>
vmap  <S-PageUp> <Nop>
nmap  <S-PageDown> <Nop>
imap  <S-PageDown> <Nop>
vmap  <S-PageDown> <Nop>
nmap  <PageUp> <Nop>
imap  <PageUp> <Nop>
vmap  <PageUp> <Nop>
nmap  <PageDown> <Nop>
imap  <PageDown> <Nop>
vmap  <PageDown> <Nop>

" gv for pasted text
nnoremap gp `[v`]

" hold onto visual selection
vnoremap < <gv
vnoremap > >gv

" cd to file
nnoremap <leader>cd :cd %:p:h<CR>

" create new splits
nmap  <F1> :vnew<CR> <C-W>r
nmap  <F2> :vsp<CR>
nmap  <F3> :tabnew<CR>:NERDTree<CR>

" use arrow keys for split navigation
if has('win32') || has('win64')
    nmap  <A-Up> :wincmd k<CR>
    nmap  <A-Down> :wincmd j<CR>
    nmap  <A-Left> :wincmd h<CR>
    nmap  <A-Right> :wincmd l<CR>
else
    nmap  <M-Up> :wincmd k<CR>
    nmap  <M-Down> :wincmd j<CR>
    nmap  <M-Left> :wincmd h<CR>
    nmap  <M-Right> :wincmd l<CR>
endif

" resize horzontal split window
nmap  <C-Up> <C-W>-
nmap  <C-Down> <C-W>+
nmap  <C-Left> <C-W><
nmap  <C-Right> <C-W>>

" move horizontal splits
nmap  <S-Left> :wincmd h<CR><C-W>x
nmap  <S-Right> <C-W>x:wincmd l<CR>

" easier insert navigation
inoremap  <C-Right> <C-o>e<C-o>l

" easy align
xmap  ga <Plug>(EasyAlign)
nmap  ga <Plug>(EasyAlign)

" nerd-tree
let NERDTreeShowHidden=1
nmap  <C-n> :NERDTree<CR>
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

" format tsx
augroup filetypedetect
    au! BufRead,BufNewFile *.tsx setfiletype typescript
augroup END

" disable weird macro indenting
set cinkeys=0{,0},0),:,!^F,o,O,e

" disable weird label indenting
set cinoptions+=L0
set cinoptions+=g0

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
set noshowmode

function! PickFont()
    silent! execute "set guifont=*"
    echo "Chosen Font \n----------------------"
    execute "set guifont?"
    echo ""
endfunction

function! InitFont()
    let g:fontSize = get(g:, 'fontSize', '15')
    if has('win32') || has('win64')
        silent! execute "set guifont=Consolas:h" . g:fontSize
    else
        silent! execute "set guifont=Menlo:h" . g:fontSize
    endif
endfunction

function! UpdateFont(val)
    if g:lockFontSize == 1
        return
    endif
    let g:fontSize = get(g:, 'fontSize', '15')
    if a:val != 0
        let g:fontSize = g:fontSize + a:val
    endif
    silent! execute "set guifont=Consolas:h" . g:fontSize
endfunction

function! LogFontSize()
    if g:lockFontSize == 1
        echo "Font Size Locked -- Try :Unlock"
        return
    endif
    echo 'Setting font size:' g:fontSize
endfunction


autocmd VimEnter * call InitFont()

nnoremap <C-x> :call UpdateFont(1)<CR>:call LogFontSize()<CR>
nnoremap <C-z> :call UpdateFont(-1)<CR>:call LogFontSize()<CR>


" encoding -- at end of config so that mac is less *likely* to complain
set encoding=utf-8
set fileencodings=ucs-bom,utf8,latin1
set fileencoding=utf-8
set fillchars=vert:\│

scriptencoding utf-8

