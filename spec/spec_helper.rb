require 'puppetlabs_spec_helper/module_spec_helper'

dir = File.expand_path(File.dirname(__FILE__))
Dir["#{dir}/support/*.rb"].sort.each {|f| require f}

begin
  require 'simplecov'
  require 'coveralls'
  SimpleCov.formatter = Coveralls::SimpleCov::Formatter
  SimpleCov.start do
    add_filter '/spec/'
  end
rescue Exception => e
  warn "Coveralls disabled"
end

shared_context :defaults do
  let :default_facts do
    {
      :osfamily                   => 'RedHat',
      :operatingsystem            => 'CentOS',
      :operatingsystemrelease     => '6.5',
      :operatingsystemmajrelease  => '6',
      :architecture               => 'x86_64',
    }
  end
end

at_exit { RSpec::Puppet::Coverage.report! }
