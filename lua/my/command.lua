local command = require'my/utils'.command

command [[Upgrade lua require('my/utils').upgrade()]]

-- Command to reverse selected lines
command [[-bar -range=% Reverse <line1>,<line2>g/^/m<line1>-1|nohl]]

-- Break SQL to better look
command [[-range=% SQLBreak call user#sql#break(<line1>, <line2>)]]

-- Trim the file
command [[Trim call buffer#trim()]]

-- Highlight the given text without moving the cursor
command [[-nargs=+ H call text#highlight(<q-args>)]]

-- Preserve position while executing the command
command [[-nargs=+ P call preserve#preserve(<q-args>)]]

-- Fold all buffer comments
command [[FoldComments call fold#comments()]]

-- Remove comments and multiple empty lines
command [[-range=% RemoveComments silent call text#remove_comments(<line1>, <line2>)]]

command [[-nargs=? -bang CopyFilePath call util#copy_filename(<bang>0, <q-args>)]]

command [[LongestLine call buffer#longest_line()]]

command [[MkdirPath call util#mkdir_path()]]

command [[RSpec call user#ruby#rspec()]]

command [[W call util#write_with_path()]]

command [[LspInstallAll lua require('my/plugin/lspinstall').LspInstallAll()]]
