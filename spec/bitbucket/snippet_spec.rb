require 'spec_helper'
module ConfigFilesRemotely
  describe Bitbucket::Snippet do
    subject { described_class.new('arturictus', 'z95G4', 'path_application.production.yml') }
    it { expect(subject.data).to include 'path_application.production.yml' }
    it { expect(subject.last_version).to include('hello') }
  end
end
