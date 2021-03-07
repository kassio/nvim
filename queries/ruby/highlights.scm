; (
;  (call
;   method: (identifier) @my.include)
;
;  (#vim-match? @my.include "^(include|extend|prepend)$")
;  )


(
 (call
    receiver: (constant)? @type
    method: [
             (identifier)
             (constant)
             ] @my.include
    )
  (#vim-match? @my.include "^(include|extend|prepend)$"))

; Function definitions

(
(method name: [
               (identifier) @my.include
               (constant) @type
               ])
  (#vim-match? @my.include "^(include|extend|prepend)$"))

(
(singleton_method name: [
                         (identifier) @my.include
                         (constant) @type
                         ])
  (#vim-match? @my.include "^(include|extend|prepend)$"))
