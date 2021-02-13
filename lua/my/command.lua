local cmd = vim.cmd

cmd [[command! Upgrade lua require('my/plugins').sync()]]

-- Command to reverse selected lines
cmd [[command! -bar -range=% Reverse <line1>,<line2>g/^/m<line1>-1|nohl]]

-- Break SQL to better look
cmd [[command! -range=% SQLBreak call user#sql#break(<line1>, <line2>)]]

-- Trim the file
cmd [[command! Trim call buffer#trim()]]

-- Highlight the given text without moving the cursor
cmd [[command! -nargs=+ H call text#highlight(<q-args>)]]

-- Preserve position while executing the command
cmd [[command! -nargs=+ P call preserve#preserve(<q-args>)]]

-- Fold all buffer comments
cmd [[command! FoldComments call fold#comments()]]

-- Remove comments and multiple empty lines
cmd [[command! -range=% RemoveComments silent call text#remove_comments(<line1>, <line2>)]]

cmd [[command! -nargs=? -bang CopyFilePath call util#copy_filename(<bang>0, <q-args>)]]

cmd [[command! LongestLine call buffer#longest_line()]]

cmd [[command! MkdirPath call util#mkdir_path()]]

cmd [[command! RSpec call user#ruby#rspec()]]

cmd [[command! W call util#write_with_path()]]
