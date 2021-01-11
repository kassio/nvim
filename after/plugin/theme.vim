colorscheme onehalflight
set background=light

hi! MatchParen guifg=NONE guibg=NONE    gui=bold

hi! SpellBad   guifg=NONE guibg=NONE    gui=underline
hi! link SpellCap   SpellBad
hi! link SpellRare  SpellBad
hi! link SpellLocal SpellBad

hi! IncSearch guibg=#A22FA0

hi! StatusError   guifg=#CA1243 gui=bold
hi! StatusWarning guifg=#F7C154 gui=bold
hi! StatusInfo    guifg=#6699CC gui=bold
hi! StatusSuccess guifg=#50A14F gui=bold
hi! StatusIgnore  guifg=#CCCCCC gui=bold

hi! StatusErrorReverse   guifg=#CA1243 gui=bold,reverse
hi! StatusWarningReverse guifg=#F7C154 gui=bold,reverse
hi! StatusInfoReverse    guifg=#6699CC gui=bold,reverse
hi! StatusSuccessReverse guifg=#50A14F gui=bold,reverse
hi! StatusIgnoreReverse  guifg=#CCCCCC gui=bold,reverse

hi! LightStatusError       guifg=#F5A098 guibg=#383a42
hi! LightStatusWarning     guifg=#FCEDB6 guibg=#383a42
hi! LightStatusInformation guifg=#B1EEFA guibg=#383a42
hi! LightStatusHint        guifg=#AEF7AD guibg=#383a42
hi! LightStatusIgnore      guifg=#EEEEEE guibg=#383a42

hi! LightStatusErrorReverse       guifg=#F5A098 guibg=#383a42 gui=bold,reverse
hi! LightStatusWarningReverse     guifg=#FCEDB6 guibg=#383a42 gui=bold,reverse
hi! LightStatusInformationReverse guifg=#B1EEFA guibg=#383a42 gui=bold,reverse
hi! LightStatusHintReverse        guifg=#AEF7AD guibg=#383a42 gui=bold,reverse
hi! LightStatusIgnoreReverse      guifg=#EEEEEE guibg=#383a42 gui=bold,reverse

hi! NonText guifg=#383a42 guibg=NONE gui=NONE

hi! link VertSplit   NonText
hi! link Whitespace  NonText
hi! link SpecialKey  NonText
hi! link SpecialChar NonText
hi! link EndOfBuffer NonText

hi! StatusLine   guifg=#EEEEEE guibg=#383a42
hi! StatusLineNC guifg=#CCCCCC guibg=#555555

hi! SLUnsavedFile  gui=bold guifg=#EEEEEE guibg=#CA1243
hi! SLModeCommand  gui=bold guifg=#EEEEEE guibg=#6699CC
hi! SLModeVisual   gui=bold guifg=#EEEEEE guibg=#A22FA0
hi! SLModeInsert   gui=bold guifg=#EEEEEE guibg=#50A14F
hi! SLModeTerminal gui=bold guifg=#383a42 guibg=#EEEEEE

hi! link TabLine     StatusLineNC
hi! link TabLineFill StatusLineNC
hi! link TabLineSel  SLModeNormal

hi! link SignError   StatusError
hi! link SignWarning StatusWarning
hi! link SignInfo    StatusInfo
hi! link SignSuccess StatusSuccess

hi! link ErrorMsg   StatusError
hi! link WarningMsg StatusWarning

hi! LspDiagnosticsVirtualTextError       guifg=#F5A098
hi! LspDiagnosticsVirtualTextWarning     guifg=#FCEDB6
hi! LspDiagnosticsVirtualTextInformation guifg=#B1EEFA
hi! LspDiagnosticsVirtualTextHint        guifg=#AEF7AD

hi! link LspDiagnosticsFloatingError       StatusError
hi! link LspDiagnosticsFloatingWarning     StatusWarning
hi! link LspDiagnosticsFloatingInformation StatusInfo
hi! link LspDiagnosticsFloatingHint        StatusSuccess

hi! link LspDiagnosticsSignError       StatusError
hi! link LspDiagnosticsSignWarning     StatusWarning
hi! link LspDiagnosticsSignInformation StatusInfo
hi! link LspDiagnosticsSignHint        StatusSuccess

hi! link SignifySignDelete          StatusError
hi! link SignifySignDeleteFirstLine StatusError
hi! link SignifyLineDelete          StatusError
hi! link SignifyLineDeleteFirstLine StatusError

hi! link SignifySignChange       StatusWarning
hi! link SignifySignChangeDelete StatusWarning
hi! link SignifyLineChange       StatusWarning
hi! link SignifyLineChangeDelete StatusWarning

hi! link SignifySignAdd StatusSuccess
hi! link SignifyLineAdd StatusSuccess

hi! LuaTreeGitNew  guifg=#555555 gui=italic
hi! link LuaTreeGitDirty   StatusWarning
hi! link LuaTreeGitStaged  StatusSuccess
hi! link LuaTreeGitMerge   StatusWarning
hi! link LuaTreeGitRename  StatusWarning

hi! LuaTreeSymlink guifg=#A22FA0

hi! link LuaTreeFolderIcon Directory

call sign#define_error('LspDiagnosticsSignError', 'LspDiagnosticsSignError')
call sign#define_warning('LspDiagnosticsSignWarning', 'LspDiagnosticsSignWarning')
call sign#define_info('LspDiagnosticsSignInformation', 'LspDiagnosticsSignInformation')
call sign#define_hint('LspDiagnosticsSignHint', 'LspDiagnosticsSignHint')
