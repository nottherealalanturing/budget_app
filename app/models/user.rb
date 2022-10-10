class User < ApplicationRecord
    has_many :trades, foreign_key: "author_id", dependent: :destroy
    has_many :groups, dependent: :destroy
end
