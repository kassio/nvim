if exists('b:rspec_setup_loaded')
  finish
endif
let b:rspec_setup_loaded=1

aug rspec_syntax_for_features
  au!
  autocmd BufReadPost,BufNewFile *_feature.rb set syntax=rspec
aug END
