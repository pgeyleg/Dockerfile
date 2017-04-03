require 'spec_helper'

describe Dockerfile::Configuration do
  context '#config' do
    let(:configuration) { described_class.new }

    it 'looks for config file in current working directory' do
      expect(Dir).to receive(:pwd).and_return('/work')
      expect(File).to receive(:exist?).with('/work/dockerfile.yaml').and_return(true)

      expect(configuration.config[:config_file]).to eq('/work/dockerfile.yaml')
    end

    it 'looks for config file in home directory if unable to find in current directory' do
      expect(Dir).to receive(:pwd).and_return('/work')
      expect(File).to receive(:exist?).with('/work/dockerfile.yaml').and_return(false)
      expect(Dir).to receive(:home).and_return('/home/me')

      expect(configuration.config[:config_file]).to eq('/home/me/dockerfile.yaml')
    end

    it 'looks for config file specified by environment variable' do
      expect(ENV).to receive(:DOCKERFILE).and_return('/etc/config')
      expect(File).to receive(:exist?).with('/etc/config/dockerfile.yaml').and_return(true)

      expect(Dir).to_not receive(:pwd)
      expect(Dir).to_not receive(:home)

      expect(configuration.config[:config_file]).to eq('/etc/config/dockerfile.yaml')
    end

    it 'raises an error if file specified by environment variable does not exist' do
    end

    it 'raises an error if file does not exist in current directory or home directory' do
    end
  end
end
