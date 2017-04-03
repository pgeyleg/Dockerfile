require 'spec_helper'

describe Dockerfile::Configuration do
  context '#file' do
    let(:configuration) { described_class.new }

    it 'returns file from current working directory' do
      expect(Dir).to receive(:pwd).and_return('/work')
      expect(File).to receive(:exist?).with('/work/dockerfile.yaml')
        .and_return(true)

      expect(configuration.file).to eq('/work/dockerfile.yaml')
    end

    it 'returns file from home directory if not found in current directory' do
      expect(Dir).to receive(:pwd).and_return('/work')
      expect(File).to receive(:exist?).with('/work/dockerfile.yaml')
        .and_return(false)
      expect(Dir).to receive(:home).and_return('/home/me')

      expect(configuration.file).to eq('/home/me/dockerfile.yaml')
    end

    it 'looks for file specified by environment variable' do
      expect(ENV).to receive(:[]).with('DOCKERFILE').at_least(:once)
        .and_return('/etc/config')
      expect(File).to receive(:exist?).with('/etc/config/dockerfile.yaml')
        .and_return(true)

      expect(Dir).to_not receive(:pwd)
      expect(Dir).to_not receive(:home)

      expect(configuration.file).to eq('/etc/config/dockerfile.yaml')
    end

    it 'warns user if file specified by environment variable does not exist' do
    end

    it 'warns user if file does not exist' do
    end
  end
end
