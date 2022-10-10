class Group < ApplicationRecord
    belongs_to :author, class_name: "User" , foreign_key: "author_id", dependent: :destroy
    has_many :trade_groups
    has_many :trade, through: :trade_groups
end
