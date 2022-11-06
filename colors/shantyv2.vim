" @Veemon
" Russel Demos
" russelhughdemos@gmail.com

hi clear
syntax reset
let g:colors_name = "shantyv2"

" ---------------------------
set background=dark

let s:background     = '#182930'

let s:white          = '#ffffff'
let s:light_grey     = '#e8e8e8'
let s:pale_white     = '#cccccc'
let s:black          = '#000000'

let s:pale_cyan      = '#aaf0db'
let s:cyan           = '#82bab0'

let s:dark_aqua      = '#405661'
let s:aqua           = '#8dc9af'

let s:mid_blue       = '#405661'
let s:dark_blue      = '#132b32'
let s:very_dark_blue = '#132831'

let s:green          = '#8aff87'
let s:mid_green      = '#a1c4ac'
let s:pale_green     = '#d1e8c7'
let s:lime_green     = '#d4ebbc'
let s:zest_green     = '#b4e87d'

let s:red            = '#ff6682'
let s:faint_red      = '#ffedda'

let s:dark_orange    = '#927b52'
let s:orange         = '#ffbb57'
let s:light_orange   = '#ffeec2'
let s:faint_orange   = '#ede2d5'

let s:debug          = '#ff0000'
let s:debug2         = '#ff00ff'

" ---------------------------

exe 'hi Normal                guifg=' .s:faint_orange. ' ctermbg=NONE guibg=' .s:background. ' gui=NONE'
exe 'hi EndOfBuffer           guifg=' .s:background.   ' guibg=NONE'

exe 'hi Type                  guifg=' .s:faint_orange. ' guibg=NONE'
exe 'hi Identifier            guifg=' .s:cyan.         ' guibg=NONE'
exe 'hi Keyword               guifg=' .s:faint_orange. ' guibg=NONE'
exe 'hi Function              guifg=' .s:faint_orange. ' guibg=NONE'
exe 'hi Macro                 guifg=' .s:light_orange. ' guibg=NONE'
exe 'hi String                guifg=' .s:green.        ' guibg=NONE'
exe 'hi Include               guifg=' .s:light_orange. ' guibg=NONE'
exe 'hi Statement             guifg=' .s:cyan.         ' guibg=NONE'
exe 'hi Operator              guifg=' .s:cyan.         ' guibg=NONE'
exe 'hi Define                guifg=' .s:light_orange. ' guibg=NONE'
exe 'hi Constant              guifg=' .s:zest_green.   ' guibg=NONE'
exe 'hi Label                 guifg=' .s:aqua.         ' guibg=NONE'
exe 'hi Delimiter             guifg=' .s:light_grey.   ' guibg=NONE'
exe 'hi Number                guifg=' .s:orange.       ' guibg=NONE'
exe 'hi Special               guifg=' .s:orange.       ' guibg=NONE'
exe 'hi Conditional           guifg=' .s:cyan.         ' guibg=NONE'

exe 'hi Title                 guifg=' .s:faint_orange
exe 'hi Tag                   guifg=' .s:pale_cyan.  ' guibg=NONE'
exe 'hi Directory             guifg=' .s:pale_green. ' guibg=NONE'
exe 'hi Comment               guifg=' .s:aqua.       ' gui=italic'
exe 'hi SpecialComment        guifg=' .s:mid_green.  ' gui=italic guibg=' .s:dark_blue

exe 'hi Todo                  guifg=' .s:red. ' guibg=NONE'
exe 'hi Debug                 guifg=' .s:red. ' guibg=NONE'
exe 'hi Fixme                 guifg=' .s:red. ' guibg=NONE'

exe 'hi Error                 guifg=' .s:cyan. ' guibg=NONE'
exe 'hi ErrorMsg              guifg=' .s:cyan. ' guibg=NONE'
exe 'hi WarningMsg            guifg=' .s:cyan. ' guibg=NONE'
exe 'hi Exception             guifg=' .s:cyan. ' guibg=NONE'

exe 'hi CursorLineNR          guifg=' .s:pale_cyan. ' guibg=NONE'

exe 'hi DiffText              guifg=' .s:cyan.       ' guibg=NONE'
exe 'hi DiffAdd               guifg=' .s:lime_green. ' guibg=NONE'
exe 'hi DiffChange            guifg=' .s:pale_cyan.  ' guibg=NONE'
exe 'hi DiffDelete            guifg=' .s:cyan.       ' guibg=NONE'

exe 'hi GitGutterAdd          guifg=' .s:lime_green. ' guibg=NONE'
exe 'hi GitGutterDelete       guifg=' .s:cyan.       ' guibg=NONE'
exe 'hi GitGutterChangeDelete guifg=' .s:cyan.       ' guibg=NONE'

exe 'hi Repeat                guifg=' .s:lime_green. ' guibg=NONE'
exe 'hi IncSearch             guifg=' .s:pale_cyan.  ' guibg=NONE'
exe 'hi Title                 guifg=' .s:pale_cyan.  ' guibg=NONE'
exe 'hi SpecialChar           guifg=' .s:pale_cyan.  ' guibg=NONE'
exe 'hi MoreMsg               guifg=' .s:pale_cyan.  ' guibg=NONE'
exe 'hi MatchParen            guifg=' .s:pale_cyan.  ' guibg=NONE'
exe 'hi Storage               guifg=' .s:pale_green. ' guibg=NONE'

exe 'hi markdownLinkText      guifg=' .s:pale_green. ' guibg=NONE'

exe 'hi cssIncludeKeyword     guifg=' .s:lime_green. ' guibg=NONE'
exe 'hi cssIdentifier         guifg=' .s:cyan.       ' guibg=NONE'
exe 'hi cssImportant          guifg=' .s:cyan.       ' guibg=NONE'

exe 'hi PreProc               guifg=' .s:light_orange. ' guibg=NONE'
exe 'hi PreCondit             guifg=' .s:light_orange. ' guibg=NONE'

exe 'hi Pmenu                 guifg=' .s:faint_orange. ' guibg=' .s:dark_aqua
exe 'hi PMenuSel              guifg=' .s:lime_green.   ' guibg=NONE'
exe 'hi SignColumn            guibg=' .s:dark_blue
exe 'hi LineNr                guifg=' .s:dark_orange.  ' guibg=' .s:dark_blue
exe 'hi NonText               guifg=' .s:mid_green.    ' guibg=' .s:dark_blue
exe 'hi CursorLine            guibg=' .s:mid_blue
exe 'hi TabLineFill           gui=NONE  guibg=' .s:dark_aqua
exe 'hi TabLine               guifg=' .s:dark_orange. ' guibg=' .s:dark_aqua. ' gui=NONE'
exe 'hi StatusLine            gui=bold guibg=' .s:dark_aqua. ' guifg=' .s:faint_orange
exe 'hi StatusLineNC          gui=NONE guibg=' .s:dark_blue. ' guifg=' .s:faint_orange
exe 'hi Search                guifg=' .s:black ' guibg=' .s:white
exe 'hi VertSplit             gui=NONE guifg=' .s:dark_aqua. ' guibg=NONE'
exe 'hi Visual                gui=NONE guibg=' .s:dark_aqua

" -----------------------------------------------------------------------------------------------

" TODO
" - For use with new versions of gVim to find what changed.
"   Yoinked from https://github.com/lourenci/github-colors/blob/main/colors/github-colors.vim

" exe "hi! @property guifg="              .s:debug. " guibg=NONE gui=NONE"
" exe "hi! @string guifg="                .s:debug. " guibg=NONE gui=NONE"
" exe "hi! @number guifg="                .s:debug. " guibg=NONE gui=NONE"
" exe "hi! @keyword guifg="               .s:debug. " guibg=NONE gui=NONE"
" exe "hi! @include guifg="               .s:debug. " guibg=NONE gui=NONE"
" exe "hi! @variable guifg="              .s:debug. " guibg=NONE gui=NONE"
" exe "hi! @keyword.function guifg="      .s:debug. " guibg=NONE gui=NONE"
" exe "hi! @keyword.operator guifg="      .s:debug. " guibg=NONE gui=NONE"
" exe "hi! @constant.builtin guifg="      .s:debug. " guibg=NONE gui=NONE"
" exe "hi! @tag guifg="                   .s:debug. " guibg=NONE gui=NONE"
" exe "hi! @tag.delimiter guifg="         .s:debug. " guibg=NONE gui=NONE"
" exe "hi! @label guifg="                 .s:debug. " guibg=NONE gui=NONE"
" exe "hi! @punctuation.bracket guifg="   .s:debug. " guibg=NONE gui=NONE"
" exe "hi! @function guifg="              .s:debug. " guibg=NONE gui=NONE"
" exe "hi! @method guifg="                .s:debug. " guibg=NONE gui=NONE"
" exe "hi! @punctuation.special guifg="   .s:debug. " guibg=NONE gui=NONE"
" exe "hi! @punctuation.delimiter guifg=" .s:debug. " guibg=NONE gui=NONE"
" exe "hi! @parameter guifg="             .s:debug. " guibg=NONE gui=NONE"
" exe "hi! Normal guifg="                 .s:debug. " guibg=" . s:background . " gui=NONE"
" exe "hi! @constructor guifg="           .s:debug. " guibg=NONE gui=NONE"
" exe "hi! @type guifg="                  .s:debug. " guibg=NONE gui=NONE"
" exe "hi! @type.builtin guifg="          .s:debug. " guibg=NONE gui=NONE"
" exe "hi! @operator guifg="              .s:debug. " guibg=NONE gui=NONE"
" exe "hi! @boolean guifg="               .s:debug. " guibg=NONE gui=NONE"
" exe "hi! StatusLine guifg="             .s:debug. " guibg=" . s:pale_white . " gui=NONE"
" exe "hi! StatusLineNC guifg="           .s:debug. " guibg=" . s:background . " gui=NONE"
"                                         
" exe "hi! CursorLineNr guifg="           .s:debug. " guibg=NONE gui=NONE"
" exe "hi! LineNr guifg="                 .s:debug. " guibg=NONE gui=NONE"
" exe "hi! LineNrAbove guifg="            .s:debug. " guibg=NONE gui=NONE"
" exe "hi! LineNrBelow guifg="            .s:debug. " guibg=NONE gui=NONE"
"                                         
" exe "hi! ColorColumn guifg=NONE guibg=" .s:debug. "  gui=NONE"
"                                         
" exe "hi! CursorLine guifg=NONE guibg="  .s:debug. "  gui=NONE"
" exe "hi! Folded guifg="                 .s:debug. " guibg=" . s:background . " gui=NONE"
" exe "hi! Search guifg=NONE guibg="      .s:debug. " gui=NONE"
" exe "hi! Pmenu guifg="                  .s:debug. " guibg=" . s:background . " gui=NONE"
" exe "hi! PmenuSel guifg="               .s:debug. " guibg=" . s:gray . " gui=NONE"
" exe "hi! @comment guifg="               .s:debug. " guibg=NONE gui=NONE"
" exe "hi! SignColumn guifg="             .s:debug. " guibg=" . s:background . " gui=NONE"
" exe "hi! @symbol guifg="                .s:debug. " guibg=NONE gui=NONE"
" exe "hi! @float guifg="                 .s:debug. " guibg=NONE gui=NONE"
" exe "hi! Label guifg="                  .s:debug. " guibg=NONE gui=NONE"
" exe "hi! @field guifg="                 .s:debug. " guibg=NONE gui=NONE"
" exe "hi! @namespace guifg="             .s:debug. " guibg=NONE gui=NONE"
" exe "hi! @variable.builtin guifg="      .s:debug. " guibg=NONE gui=NONE"
" exe "hi! @conditional guifg="           .s:debug. " guibg=NONE gui=NONE"
" exe "hi! TabLine guifg="                .s:debug. " guibg=" . s:background . " gui=NONE"
" exe "hi! TabLineFill guifg=NONE guibg=" .s:debug. " gui=NONE"
" exe "hi! TabLineSel guifg="             .s:debug. " guibg=" . s:background . " gui=NONE"
" exe "hi! Constant guifg="               .s:debug. " guibg=NONE gui=NONE"
" exe "hi! @todo guifg="                  .s:debug. " guibg=NONE gui=NONE"
" exe "hi! @repeat guifg="                .s:debug. " guibg=NONE gui=NONE"
" exe "hi! Special guifg="                .s:debug. " guibg=NONE gui=NONE"
" exe "hi! Exception guifg="              .s:debug. " guibg=NONE gui=NONE"
" exe "hi! Visual guifg="                 .s:debug. " guibg=" . s:white . " gui=NONE"
" exe "hi! MatchParen guifg=NONE guibg="  .s:debug. " gui=bold"
" exe "hi! NonText guifg="                .s:debug. " guibg=NONE gui=NONE"

" -----------------------------------------------------------------------------------------------

" also follows from above, but confirmed working in older gVim
" exe "hi! link @punctuation.special.markdown @text.title.markdown"
" exe "hi! link Statement @text.title.markdown"
exe "hi! link FoldColumn SignColumn"

exe "hi! EyelinerPrimary gui=bold"
exe "hi! EyelinerSecondary gui=italic"

exe "hi! link QuickScopePrimary EyelinerPrimary"
exe "hi! link QuickScopeSecondary EyelinerSecondary"

" exe "hi! @text.emphasis guifg=NONE guibg=NONE gui=italic"
" exe "hi! @text.strong guifg=NONE guibg=NONE gui=bold"
