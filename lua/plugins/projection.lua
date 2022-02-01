vim.g.projectionist_heuristics = {
  ['*'] = {
    ['doc/*.txt'] = { type = 'doc' },
    ['doc/*.md'] = { type = 'doc' },
    -- Go
    ['*.go'] = {
      alternate = '{}_test.go',
      type = 'source',
    },
    ['*_test.go'] = {
      alternate = '{}.go',
      type = 'test',
    },
    -- Ruby
    ['config/initializers/*.rb'] = {
      alternate = 'spec/initializers/{}_spec.rb',
      type = 'source',
    },
    ['spec/initializers/*_spec.rb'] = {
      alternate = 'config/initializers/{}.rb',
      type = 'test',
    },
    ['app/*.rb'] = {
      alternate = 'spec/{}_spec.rb',
      type = 'source',
    },
    ['spec/*_spec.rb'] = {
      alternate = 'app/{}.rb',
      type = 'test',
    },
    ['lib/*.rb'] = {
      alternate = 'spec/lib/{}_spec.rb',
      type = 'source',
    },
    ['spec/lib/*_spec.rb'] = {
      alternate = 'lib/{}.rb',
      type = 'test',
    },
    ['rubocop/cop/*.rb'] = {
      alternate = 'spec/rubocop/cop/{}_spec.rb',
      type = 'source',
    },
    ['spec/rubocop/cop/*_spec.rb'] = {
      alternate = 'rubocop/cop/{}.rb',
      type = 'test',
    },
  },
}
