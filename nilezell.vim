" Vim color file
" Based on: zellner

set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "nilezell"

hi Comment term=bold ctermfg=6 guifg=Grey
hi Normal guifg=White guibg=Black
hi Constant term=underline ctermfg=DarkYellow guifg=#d79000
hi Special term=bold ctermfg=White guifg=Magenta
hi Identifier term=underline ctermfg=7 guifg=White
hi Statement term=bold ctermfg=5 gui=NONE guifg=#ce114c
hi PreProc term=underline ctermfg=5 guifg=#ce114c
hi Type term=underline ctermfg=6 gui=NONE guifg=#1793d1
hi Visual term=reverse ctermfg=Red ctermbg=white term=bold gui=NONE guifg=Yellow guibg=#f20e28
hi Search term=reverse ctermfg=Black ctermbg=Cyan gui=NONE guifg=Black guibg=#1793d1
hi Tag term=bold ctermfg=DarkGreen guifg=DarkGreen
hi Error term=reverse ctermfg=15 ctermbg=9 guibg=Red guifg=White
hi Todo term=standout ctermbg=Yellow ctermfg=Black guifg=Blue guibg=Yellow
hi StatusLine term=bold,reverse cterm=NONE ctermfg=Yellow ctermbg=DarkGray gui=NONE guifg=Yellow guibg=DarkGray
hi! link MoreMsg Comment
hi! link ErrorMsg Visual
hi! link WarningMsg ErrorMsg
hi! link Question Comment
hi link String Constant
hi link Character Constant
hi link Number Constant
hi link Boolean Constant
hi link Float Number
hi link Function Identifier
hi link Conditional Statement
hi link Repeat Statement
hi link Label Statement
hi link Operator Statement
hi link Keyword Statement
hi link Exception Statement
hi link Include PreProc
hi link Define PreProc
hi link Macro PreProc
hi link PreCondit PreProc
hi link StorageClass Statement
hi link Structure Type
hi link Typedef Type
hi link SpecialChar Special
hi link Delimiter Special
hi link SpecialComment Special
hi link Debug Special
