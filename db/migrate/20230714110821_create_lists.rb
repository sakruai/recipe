class CreateLists < ActiveRecord::Migration[6.1]
  
    def change
    create_table :lists do |t|
      t.integer :user_id,    null: false
      t.string :name,        null: false
      t.integer :price,      null: false
      t.text :explanation,   null: false
      t.timestamps
    end
  end
end
