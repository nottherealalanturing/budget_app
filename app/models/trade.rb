class Trade < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :trade_groups
  has_many :groups, through: :trade_groups

  validates :name, :amount, presence: true
  validates :amount, numericality: { only_integer: true }
end
