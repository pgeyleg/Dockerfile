require 'spec_helper'

describe 'version' do
  it 'needs to be documented on CHANGELOG' do
    gem_spec = Gem::Specification.find_by_name('dockerfile')
    gem_root = gem_spec.gem_dir
    changelog_file = gem_root + '/CHANGELOG.md'
    expect(system('grep', "#{Dockerfile::VERSION}", "#{changelog_file}")).to be_truthy
  end
end
