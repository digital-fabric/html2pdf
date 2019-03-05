require_relative './lib/h2p/version'

Gem::Specification.new do |s|
  s.name        = 'h2p'
  s.version     = H2P::VERSION
  s.licenses    = ['MIT']
  s.summary     = 'H2P: HTML in, PDF out'
  s.author      = 'Sharon Rosner'
  s.email       = 'ciconia@gmail.com'
  s.files       = `git ls-files`.split
  s.homepage    = 'http://github.com/digital-fabric/h2p'
  s.metadata    = {
    "source_code_uri" => "https://github.com/digital-fabric/h2p"
  }
  s.rdoc_options = ["--title", "h2p", "--main", "README.md"]
  s.extra_rdoc_files = ["README.md"]
  s.require_paths = ["lib"]

  s.add_runtime_dependency      'modulation', '~> 0.21'
end
