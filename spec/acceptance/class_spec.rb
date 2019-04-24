require 'spec_helper_acceptance'

describe 'artifactory class' do
  context 'default parameters' do
    # Using puppet_apply as a helper
    it 'works idempotently with no errors' do
      pp = <<-ARTIFACTORY_TEST
      class { 'artifactory': }
      ARTIFACTORY_TEST

      # Run it twice and test for idempotency
      apply_manifest_and_idempotent(pp)
    end

    describe package('jfrog-artifactory-oss') do
      it { is_expected.to be_installed }
    end

    describe service('artifactory') do
      it { is_expected.to be_enabled }
      it { is_expected.to be_running }
    end
  end
end
