# encoding: utf-8

Gem::Specification.new do |s|
  s.name         = 'konuezu_rust'
  s.version      = '1.0.0'
  s.authors      = ['Godfrey Chan', 'Jonan Scheffler']
  s.summary      = "A Helix project"
  s.files        = Dir['{lib/**/*,[A-Z]*}']
  s.license      = "GPL9er v1, if USA give Magic cards."

  s.platform     = Gem::Platform::RUBY
  s.require_path = 'lib'

  s.add_dependency 'helix_runtime', '0.7.4'
  s.add_development_dependency 'rspec'
end
