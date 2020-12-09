colorscheme onehalflight
set background=light

hi! MatchParen guifg=NONE guibg=NONE gui=bold

hi! SpellBad guifg=NONE gui=underline
hi! SpellCap guifg=NONE
hi! SpellRare guifg=NONE
hi! SpellLocal guifg=NONE

hi! VertSplit guifg=#383a42 guibg=NONE gui=NONE

hi! NonText guifg=#383a42
hi! link Whitespace NonText
hi! link SpecialKey NonText
hi! link SpecialChar NonText
hi! link EndOfBuffer NonText

hi! SLModeNormal gui=bold guifg=#383a42
hi! link TabLineSel SLModeNormal

hi! StatusError   guifg=#CA1243 gui=bold
hi! StatusWarning guifg=#F7C154 gui=bold
hi! StatusInfo    guifg=#6699CC gui=bold
hi! StatusSuccess guifg=#50A14F gui=bold

hi! link SignError StatusError
hi! link SignWarning StatusWarning
hi! link SignInfo StatusInfo
hi! link SignSuccess StatusSuccess

hi! link ErrorMsg StatusError
hi! link WarningMsg StatusWarning

hi! LspDiagnosticsVirtualTextError guifg=#F5A098
hi! LspDiagnosticsVirtualTextWarning guifg=#FCEDB6
hi! LspDiagnosticsVirtualTextInformation guifg=#B1EEFA
hi! LspDiagnosticsVirtualTextHint guifg=#AEF7AD

hi! link LspDiagnosticsSignError StatusError
hi! link LspDiagnosticsSignWarning StatusWarning
hi! link LspDiagnosticsSignInformation StatusInfo
hi! link LspDiagnosticsSignHint StatusSuccess

hi! link SignifySignDelete StatusError
hi! link SignifySignDeleteFirstLine StatusError
hi! link SignifyLineDelete StatusError
hi! link SignifyLineDeleteFirstLine StatusError

hi! link SignifySignChange StatusWarning
hi! link SignifySignChangeDelete StatusWarning
hi! link SignifyLineChange StatusWarning
hi! link SignifyLineChangeDelete StatusWarning

hi! link SignifySignAdd StatusSuccess
hi! link SignifyLineAdd StatusSuccess
