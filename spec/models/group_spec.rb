require 'rails_helper'

RSpec.describe Group, type: :model do
  subject { described_class.new }

  describe 'Validations' do
    it 'is not valid without name attributes' do
      expect(subject).to_not be_valid
    end

    it 'is valid attributes' do
      subject.name = 'Test Group'
      subject.author = User.new(name: 'Test User')
      expect(subject).to be_valid
    end
  end
end
