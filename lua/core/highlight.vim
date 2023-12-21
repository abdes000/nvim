hi link AerialClass Type
hi link AerialClassIcon Special
hi link AerialFunction Special
hi AerialFunctionIcon guifg=#cb4b16 guibg=NONE guisp=NONE gui=NONE cterm=NONE

" There's also this group for the fallback of the text if a specific
" class highlight isn't defined
hi link AerialNormal Normal
" There's also this group for the cursor position
hi link AerialLine QuickFixLine
" If highlight_mode="split_width", you can set a separate color for the
" non-current location highlight
hi AerialLineNC guibg=Gray

" You can customize the guides (if show_guide=true)
hi link AerialGuide Comment
" You can set a different guide color for each level
hi AerialGuide1 guifg=Red
hi AerialGuide2 guifg=Blue





highlight NotifyERRORBorder guifg=#8A1F1F
highlight NotifyWARNBorder guifg=#79491D
highlight NotifyINFOBorder guifg=#4F6752
highlight NotifyDEBUGBorder guifg=#8B8B8B
highlight NotifyTRACEBorder guifg=#4F3552
highlight NotifyERRORIcon guifg=#F70067
highlight NotifyWARNIcon guifg=#F79000
highlight NotifyINFOIcon guifg=#A9FF68
highlight NotifyDEBUGIcon guifg=#8B8B8B
highlight NotifyTRACEIcon guifg=#D484FF
highlight NotifyERRORTitle  guifg=#F70067
highlight NotifyWARNTitle guifg=#F79000
highlight NotifyINFOTitle guifg=#A9FF68
highlight NotifyDEBUGTitle  guifg=#8B8B8B
highlight NotifyTRACETitle  guifg=#D484FF
highlight link NotifyERRORBody Normal
highlight link NotifyWARNBody Normal
highlight link NotifyINFOBody Normal
highlight link NotifyDEBUGBody Normal
highlight link NotifyTRACEBody Normal


hi default link BqfPreviewFloat Normal
hi default link BqfPreviewBorder FloatBorder
hi default link BqfPreviewTitle Title
hi default link BqfPreviewThumb PmenuThumb
hi default link BqfPreviewSbar PmenuSbar
hi default link BqfPreviewCursor Cursor
hi default link BqfPreviewCursorLine CursorLine
hi default link BqfPreviewRange IncSearch
hi default link BqfPreviewBufLabel BqfPreviewRange
hi default BqfSign ctermfg=14 guifg=Cyan

if exists('b:current_syntax')
    finish
endif

syn match qfFileName /^[^│]*/ nextgroup=qfSeparatorLeft
syn match qfSeparatorLeft /│/ contained nextgroup=qfLineNr
syn match qfLineNr /[^│]*/ contained nextgroup=qfSeparatorRight
syn match qfSeparatorRight '│' contained nextgroup=qfError,qfWarning,qfInfo,qfNote
syn match qfError / E .*$/ contained
syn match qfWarning / W .*$/ contained
syn match qfInfo / I .*$/ contained
syn match qfNote / [NH] .*$/ contained

hi def link qfFileName Directory
hi def link qfSeparatorLeft Delimiter
hi def link qfSeparatorRight Delimiter
hi def link qfLineNr LineNr
hi def link qfError DiagnosticError
hi def link qfWarning DiagnosticWarn
hi def link qfInfo DiagnosticInfo
hi def link qfNote DiagnosticHint

let b:current_syntax = 'qf'