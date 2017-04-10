" Command to reverse selected lines
command! -bar -range=% Reverse <line1>,<line2>g/^/m<line1>-1|nohl

" Break SQL to better look
command! -range SQLBreak call user#sql#break(<line1>, <line2>)

" Trim the file
command! Trim call buffer#trim()
