if readfile($ITERM_PROFILE_FILE) !=# ['dark']
  call theme#light#load()
  call writefile(["light"], $ITERM_PROFILE_FILE)
else
  call theme#dark#load()
  call writefile(["dark"], $ITERM_PROFILE_FILE)
end

command! Dark call theme#dark#load()
command! Light call theme#light#load()
