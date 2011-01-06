# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mcpp/version"

Gem::Specification.new do |s|
  s.name        = "mcpp"
  s.version     = Mcpp::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Michael Dungan"]
  s.email       = ["mpd@jesters-court.net"]
  s.homepage    = ""
  s.summary     = %q{Ruby wrapper for libmcpp C preprocessor}
  s.description = %q{A Ruby wrapper for a library build of the mcpp C preprocessor. http://mccp.sourceforge.net}

  s.rubyforge_project = "mcpp"

  s.files         = `git ls-files`.split("\n")
#  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
#  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_dependency 'ffi'
end
