if readfile($ITERM_PROFILE_FILE) ==# ['dark']
  call theme#dark#load()
else
  call theme#light#load()
end

command! Dark call theme#dark#load()
command! Light call theme#light#load()
