require_relative '../lib/env_reader'
require_relative '../lib/version_validator'

namespace :EnvironmentVariables do
  desc 'validates specified environment variable value is specified'
  task :validate, [:name, :error_message, :validate_format] do |task, args|
    puts args.name
    puts args.error_message
  end

  task :must_have do
    begin
      Env.get('variables').split(',').each {|env| Env.get_or_error(env)} if Env.get('variables')
    rescue => e
      error_message = Env.get('error_message') || e
      fail error_message
    end
  end

  task :must_have_valid_version_format do
    begin
      if Env.get('variables')
        Env.get('variables').split(',').each do |env|
          value = Env.get_or_error(env)
          VersionValidator.validate_format(value)
        end
      end
    rescue => e
      error_message = Env.get('error_message') || e
      fail error_message
    end
  end
end