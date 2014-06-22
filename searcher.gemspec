# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "version"

Gem::Specification.new do |s|
  s.name        = "searcher"
  s.version     = Searcher::VERSION
  s.authors     = ["Ju Gonçalves"]
  s.email       = ["github@jugoncalv.es"]
  s.homepage    = "http://jugoncalv.es/searcher"
  s.summary     = %q{Get queries from Google, by scraping it}
  s.description = %q{You have some queries terms, it give you back query's results from the first page}
  s.license     = "MIT"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

end
