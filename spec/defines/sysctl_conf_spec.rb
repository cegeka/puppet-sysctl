require 'spec_helper'

describe 'sysctl::conf' do

  context 'adding sysctl config parameter' do
    let(:title) { 'kernel.sem' }

    context 'with an invalid ensure parameter' do
      let(:params) { { :ensure => 'stopped' }  }
      it {
        expect { subject
        }.to raise_error(Puppet::Error, /parameter ensure must be present or absent/)
      }
    end

    context 'without required value parameter' do
      it {
        expect { subject
        }.to raise_error(Puppet::Error, /parameter value must be defined/)
      }
    end

    context 'with a valid value parameter' do
      let(:params) { { :value => '10240 512000 64 9005' } }

      it {
        should contain_augeas('sysctl.conf/kernel.sem/add').with(
          :context => "/files/etc/sysctl.conf",
          :changes => [
            "set kernel.sem '10240 512000 64 9005'",
          ]
        )
      }

      it {
        should contain_exec('sysctl/reload')
      }
    end
  end

  context 'removing sysctl parameter' do
    let(:title) { 'kernel.sem' }

    context 'with a value parameter' do
      let(:params) { { :ensure => 'absent', :value => '10240 512000 64 9005' } }

      it {
        should contain_augeas('sysctl.conf/kernel.sem/rm').with(
          :context => "/files/etc/sysctl.conf",
          :changes => [
            "rm kernel.sem",
          ]
        )
      }
    end

    context 'without a value parameter' do
      let(:params) { { :ensure => 'absent' } }

      it { should contain_augeas('sysctl.conf/kernel.sem/rm').with(
          :context => "/files/etc/sysctl.conf",
          :changes => [
            "rm kernel.sem",
          ]
        )
      }
    end
  end

end
