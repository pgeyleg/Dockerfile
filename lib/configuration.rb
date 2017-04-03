module Dockerfile
  class Configuration
    FILE_NAME = 'dockerfile.yaml'
    def config
      current_dir = "#{Dir.pwd}/#{FILE_NAME}"
      home_dir = "#{Dir.home}/#{FILE_NAME}"

      file = File.exist?(current_dir) ? current_dir : home_dir
      { config_file: file }
    end
  end
end
