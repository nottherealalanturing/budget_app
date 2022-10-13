require 'rails_helper'

RSpec.describe Trade, type: :model do
  subject { described_class.new }

  describe 'Validations' do
    it 'is not valid without attributes' do
      expect(subject).to_not be_valid
    end

    it 'is not valid without if transaction is not an integer' do
      subject.name = 'Test Transaction'
      subject.amount = 'Test Transaction'
      expect(subject).to_not be_valid
    end

    it 'is valid with attributes' do
      subject.name = 'Test Transaction'
      subject.amount = 20
      subject.author = User.new(name: 'Test User')
      expect(subject).to be_valid
    end
  end
end
