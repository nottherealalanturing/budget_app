class TradeGroup < ApplicationRecord
  belongs_to :trade
  belongs_to :group
end
