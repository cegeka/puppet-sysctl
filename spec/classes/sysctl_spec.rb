#!/usr/bin/env rspec

require 'spec_helper'

describe 'sysctl' do
  it { should contain_class 'sysctl' }
end
