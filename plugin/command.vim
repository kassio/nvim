" Command to reverse selected lines
command! -bar -range=% Reverse <line1>,<line2>g/^/m<line1>-1|nohl

" Break SQL to better look
command! -range SQLBreak call personal#sql#break(<line1>, <line2>)

" Trim the file
command! Trim call buffer#trim()

" Fugitive/Git custom commands
cabbrev Git G
cabbrev Gwrite Gw
cabbrev Gd Gdiff
command! -nargs=* Gco call git#checkout(<q-args>)
command! Ghome call system('git home')
command! Gwork call system('git work')

" Grep commands
command! -complete=dir -nargs=+ Grep call grep#search(<q-args>, 0)

if has('nvim')
  command! Pupgrade PlugClean! | PlugUpgrade | PlugUpdate | UpdateRemotePlugins
else
  command! PlugUpgrade | PlugUpdate
end
