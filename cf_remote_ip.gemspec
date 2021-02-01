# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cf_remote_ip/version'

Gem::Specification.new do |spec|
  spec.name          = 'cf_remote_ip'
  spec.version       = CfRemoteIp::VERSION
  spec.authors       = ['Allyson Maciel Guimarães']
  spec.email         = ['bsinet@hotmail.com']

  spec.summary       = "Gem that facilitates the recovery of the client's real ip through Cloudflare."
  spec.description   = "Gem that facilitates the recovery of the client's real ip through the conventional subscription of the request class."
  spec.homepage      = "https://github.com/Guepardo/cf_remote_ip"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = "https://github.com/Guepardo/cf_remote_ip"
  spec.metadata['changelog_uri'] = "https://github.com/Guepardo/cf_remote_ip"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'actionpack', '~> 6.0.2'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'pry', '~> 0.13.1'
end
