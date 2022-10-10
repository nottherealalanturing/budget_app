class CreateTradeGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :trade_groups do |t|
      t.belongs_to :trade
      t.belongs_to :group
      t.timestamps
    end
  end
end
