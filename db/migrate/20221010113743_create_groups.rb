class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name

      t.timestamps
    end

    add_reference :groups, :author, foreign_key: { to_table: :users}
  end
end
