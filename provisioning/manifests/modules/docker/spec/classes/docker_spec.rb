require 'spec_helper'

describe 'docker', :type => :class do
  let(:facts) { {
    :osfamily        => 'Debian',
    :lsbdistcodename => 'maverick',
    :kernelrelease   => '3.8.0-29-generic'
  } }

  it { should include_class('docker::install') }
  it { should include_class('docker::service') }
  it { should include_class('docker::config') }
  it { should contain_service('docker').with_provider('upstart') }

  context 'with no parameters' do
    it { should include_class('apt') }
    it { should contain_package('lxc-docker').with_ensure('present') }
    it { should contain_package('lxc-docker').with_require('Apt::Source[docker]') }
    it { should contain_package('linux-image-extra-3.8.0-29-generic') }
  end

  context 'with a custom version' do
    let(:params) { {'version' => 'absent' } }
    it { should contain_package('lxc-docker').with_ensure('absent') }
  end

  context 'with an invalid distro name' do
    let(:facts) { {:osfamily => 'RedHat'} }
    it do
      expect {
        should contain_package('lxc-docker')
      }.to raise_error(Puppet::Error, /^This module uses the docker apt repo/)
    end
  end

  context 'when not managing the kernel' do
    let(:params) { {'manage_kernel' => false} }
    it { should_not contain_package('linux-image-extra-3.8.0-29-generic') }
  end

  context 'for precise' do
    let(:facts) { {
      :osfamily        => 'Debian',
      :lsbdistcodename => 'precise',
      :operatingsystemrelease => '12.04',
      :kernelrelease   => '3.8.0-29-generic'
    } }
    it { should contain_package('linux-image-generic-lts-raring') }
    it { should contain_package('linux-headers-generic-lts-raring') }
  end

end
