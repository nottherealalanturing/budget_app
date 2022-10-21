class TradeGroup < ApplicationRecord
  belongs_to :trade, dependent: :destroy
  belongs_to :group, dependent: :destroy
end
