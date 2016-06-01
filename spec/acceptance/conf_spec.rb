require 'spec_helper_acceptance'

describe 'sysctl::conf' do

  describe 'running puppet code' do
    it 'should work with no errors' do
      pp = <<-EOS
        sysctl::conf { 'net.ipv4.ip_local_port_range':
          value => '9000 65535'
        }
      EOS

      # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end

    describe file '/etc/sysctl.conf' do
      it { is_expected.to be_file }
      its(:content) { should contain /9000 65535/ }
    end

  end
end

