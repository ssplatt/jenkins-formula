require 'serverspec'

# Required by serverspec
set :backend, :exec

describe package('jenkins') do
  it { should be_installed }
end

describe package('openjdk-8-jre-headless') do
  it { should be_installed }
end

describe package('git') do
  it { should be_installed }
end

describe service('jenkins') do
  it { should be_running }
  it { should be_enabled }
end

describe file('/var/lib/jenkins/jobs') do
  it { should exist }
  it { should be_directory }
  it { should be_owned_by 'jenkins' }
  it { should be_grouped_into 'jenkins' }
  it { should be_mode 755 }
end

describe file('/var/lib/jenkins/plugins') do
  it { should exist }
  it { should be_directory }
  it { should be_owned_by 'jenkins' }
  it { should be_grouped_into 'jenkins' }
  it { should be_mode 755 }
end

describe file('/etc/default/jenkins') do
  it { should exist }
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 644 }
end

describe file('/var/lib/jenkins/jobs/TempJob') do
  it { should exist }
  it { should be_directory }
  it { should be_owned_by 'jenkins' }
  it { should be_grouped_into 'jenkins' }
  it { should be_mode 755 }
end

describe file('/var/lib/jenkins/jobs/TempJob/config.xml') do
  it { should exist }
  it { should be_file }
  it { should be_owned_by 'jenkins' }
  it { should be_grouped_into 'jenkins' }
  it { should be_mode 644 }
end

describe file('/var/lib/jenkins/plugins/warnings.hpi') do
  it { should exist }
  it { should be_file }
  it { should be_owned_by 'jenkins' }
  it { should be_grouped_into 'jenkins' }
  it { should be_mode 644 }
end

describe file('/var/lib/jenkins/plugins/ansicolor.hpi') do
  it { should exist }
  it { should be_file }
  it { should be_owned_by 'jenkins' }
  it { should be_grouped_into 'jenkins' }
  it { should be_mode 644 }
end
