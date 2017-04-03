require 'spec_helper'

describe 'version' do
  it 'needs to be documented on CHANGELOG' do
    gem_root = Gem::Specification.find_by_name('dockerfile').gem_dir
    changelog_file = gem_root + '/CHANGELOG.md'
    version = Dockerfile::VERSION
    expect(system('grep', version, changelog_file)).to be_truthy
  end
end
