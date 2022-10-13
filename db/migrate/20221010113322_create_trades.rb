class CreateTrades < ActiveRecord::Migration[7.0]
  def change
    create_table :trades do |t|
      t.string :name
      t.integer :amount

      t.timestamps
    end

    add_reference :trades, :author, foreign_key: { to_table: :users}
  end
end
