Gem::Specification.new do |spec|
  spec.name          = 'calculator'
  spec.version       = '0.1.0'
  spec.authors       = ['Developer']
  spec.email         = ['dev@example.com']
  spec.summary       = 'Ruby Terminal Calculator'
  spec.files         = Dir['lib/**/*.rb', 'calculator.rb']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.12'
  spec.add_development_dependency 'rubocop', '~> 1.50'
end
