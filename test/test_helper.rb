require 'minitest/autorun'
require 'mocha/mini_test'
require 'simplecov'

SimpleCov.start do
  add_filter '/test/'
end

require 'minitest/perf'

##
# We disable the real plugin or stuff gets all confusing
# in the tests when mocking and creating expectations.
class FakeRun
  def start(*_pars); end

  def finish(*_pars); end
end

Minitest::Perf::Plugin.class_eval do
  def current_perf_run
    @current_perf_run ||= FakeRun.new
  end
end
