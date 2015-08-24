require 'simplecov'
SimpleCov.start { add_filter '/spec' }

require 'bundler/setup'
Bundler.require

require 'lotc_helper'

is_debugging_enabled = ENV['LOTC_DEBUG']
RSpec.configure do |config|
  config.profile_examples = 2
  config.order = :random
  config.tty = true
  Kernel.srand config.seed

  include LotcHelper

  config.before do
    @stdout, $stdout = $stdout, StringIO.new unless is_debugging_enabled
    @stderr, $stderr = $stderr, StringIO.new unless is_debugging_enabled
  end

  config.around do |example|
    @gem_dir = Dir.pwd
    Dir.mktmpdir %w(lotc_ _test) do |dir|
      @dir = dir
      Dir.chdir(dir) { example.run }
    end
  end

  config.after do
    $stdout, @stdout = @stdout, nil unless is_debugging_enabled
    $stderr, @stderr = @stderr, nil unless is_debugging_enabled
  end
end
