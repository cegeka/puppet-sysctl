require 'spec_helper'

describe 'sysctl::conf' do

  context 'adding sysctl config parameter' do
    let(:title) { 'kernel.sem' }

=begin
    context 'without required value parameter' do
    end
=end

    context 'with an invalid ensure parameter' do
    it {
      expect {
      }.to raise_error(Puppet::Error, /parameter ensure must be present or absent/)
    }
    end

=begin
    context 'with a valid value parameter' do
    end
=end
  end

  context 'removing sysctl parameter' do
    let(:title) { 'kernel.sem' }

=begin
    context 'with a value parameter' do
    end

    context 'without a value parameter' do
    end
=end
  end

end
