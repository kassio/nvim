colorscheme onehalflight
set background=light

hi! StatusError   guifg=#CA1243 gui=bold
hi! StatusWarning guifg=#F7C154 gui=bold
hi! StatusInfo    guifg=#6699CC gui=bold
hi! StatusSuccess guifg=#50A14F gui=bold
hi! StatusIgnore  guifg=#CCCCCC gui=bold

hi! StatusErrorInverse   guifg=#CA1243 gui=bold gui=reverse
hi! StatusWarningInverse guifg=#F7C154 gui=bold gui=reverse
hi! StatusInfoInverse    guifg=#6699CC gui=bold gui=reverse
hi! StatusSuccessInverse guifg=#50A14F gui=bold gui=reverse
hi! StatusSuccessInverse guifg=#CCCCCC gui=bold gui=reverse

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

hi! StatusLine guifg=#CCCCCC guibg=#383a42
hi! StatusLineNC guifg=#CCCCCC guibg=#888888

hi! SLUnsavedFile gui=bold guifg=#CCCCCC guibg=#CC4A21
hi! SLModeNormal gui=bold guifg=#CCCCCC guibg=#343D46
hi! SLModeCommand gui=bold guifg=#CCCCCC guibg=#6699CC
hi! SLModeVisual gui=bold guifg=#CCCCCC guibg=#CD9CCE
hi! SLModeInsert gui=bold guifg=#383a42 guibg=#BADB51
hi! SLModeTerminal gui=bold guifg=#383a42 guibg=#CCCCCC

hi! link TabLine StatusLineNC
hi! link TabLineFill StatusLineNC
hi! link TabLineSel SLModeNormal

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

hi! link LuaTreeGitDirty StatusWarning
hi! link LuaTreeGitStaged StatusSuccess
hi! link LuaTreeGitMerge StatusWarning
hi! link LuaTreeGitRename StatusWarning
hi! link LuaTreeGitNew StatusInfo
