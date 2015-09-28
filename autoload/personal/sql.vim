function! personal#sql#break(line1, line2)
  let regexp = 's/\v(FROM|WHERE|INNER|ON|AND|ORDER)/\r\1/ge'
  let cmd = printf("silent %d,%d%s", a:line1, a:line2, regexp)
  call preserve#preserve(cmd)
endfunction
