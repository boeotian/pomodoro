require_relative 'lib/pomodoro/version'

Gem::Specification.new do |spec|
  spec.name     = 'pomodoro'
  spec.version  = Pomodoro::VERSION
  spec.authors  = ['boeotian']
  spec.email    = ['eapol.m3@gmail.com']

  spec.summary   = 'Pomodoro timer'
  spec.homepage  = 'https://github.com/boeotian/pomodoro'
  spec.license   = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.7.1')

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir         = 'exe'
  spec.executables    = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths  = ['lib']
end