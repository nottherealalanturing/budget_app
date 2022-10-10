require 'rails_helper'

RSpec.describe TradeGroup, type: :model do
  subject { described_class.new }

  describe 'Validations' do
    it "is not valid without name attributes" do
      expect(subject).to_not be_valid
    end

    it "is valid attributes" do
      subject.trade = Trade.new(author: User.new(name: "Test User"), name: "Test Trade", amount: 200)
      subject.group = Group.new(author: User.new(name: "Test User"), name: "Test Group")
      expect(subject).to be_valid
    end
  end
end
