module Dockerfile
  class Configuration
    FILE_NAME = 'dockerfile.yaml'.freeze

    def file
      env_dir = ENV['DOCKERFILE']
      if env_dir && File.exist?("#{env_dir}/#{FILE_NAME}")
        return "#{env_dir}/#{FILE_NAME}"
      end

      current_dir = "#{Dir.pwd}/#{FILE_NAME}"
      File.exist?(current_dir) ? current_dir : "#{Dir.home}/#{FILE_NAME}"
    end
  end
end
