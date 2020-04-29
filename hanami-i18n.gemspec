
# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hanami/i18n/version'

Gem::Specification.new do |spec|
  spec.name          = 'hanami-i18n'
  spec.version       = Hanami::I18n::VERSION
  spec.authors       = ['ippachi']
  spec.email         = ['ivalice1218@gmail.com']

  spec.summary       = 'i18n for hanami'
  # spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = "https://github.com/ippachi/hanami-i18n"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org/"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'i18n', '~> 1.8'
  spec.add_dependency 'hanami-helpers', '~> 1.3'
  spec.add_dependency 'hanami-validations', '~> 1.3'
  spec.add_dependency 'dry-inflector', '~> 0.2'

  spec.add_development_dependency 'bundler', '~> 2.1'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.9'
  spec.add_development_dependency 'rubocop', '~> 0.82'
  spec.add_development_dependency "appraisal", '~> 2.2'
  spec.add_development_dependency "pry", '~> 0.13'
  spec.add_development_dependency "byebug", '~> 11.1'
end
