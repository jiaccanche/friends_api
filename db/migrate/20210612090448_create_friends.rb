class CreateFriends < ActiveRecord::Migration[6.1]
  def change
    create_table :friends do |t|
      t.string :name
      t.string :lastName
      t.integer :age
      t.boolean :active
      t.timestamps
    end
  end
end
