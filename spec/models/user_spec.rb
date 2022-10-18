require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new }

  describe 'Validations' do
    it 'is not valid without name attributes' do
      expect(subject).to_not be_valid
    end

    it 'is not valid without email attributes' do
      subject.name = 'Test User'
      expect(subject).to_not be_valid
    end

    it 'is valid with attributes' do
      subject.name = 'Test User'
      subject.email = "test@email.com"
      subject.password = "testpassword"
      expect(subject).to be_valid
    end
  end
end
