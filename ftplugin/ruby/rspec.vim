command! LetToVariable call Preserve('%s/\vlet.?\(:(.{-})\)\s\{\s(\_.{-})\s\}/@\1\ =\ \2/ge')
