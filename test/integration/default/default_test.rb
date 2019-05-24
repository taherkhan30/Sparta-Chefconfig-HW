# # encoding: utf-8

# Inspec test for recipe mongodb::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/


# This is an example test, replace it with your own test.
describe package ('monogodb') do
  it { should be_installed }
end

describe service "monogodb" do
  it { should be_running }
  it { should be_enabled }
end

describe port(27017) do
  it { should be_listening }
  its('addresses'){ should include '0.0.0.0' }
end

describe http('http://localhost', enable_remote_worker: true) do
  its('status') { should cmp 502 }
end

describe package "mongodb-org" do
  it { should be_installed }
  its('version') { should match /3\./ }
end
