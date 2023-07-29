class AddCategoryToLists < ActiveRecord::Migration[6.1]
  def change
    add_column :lists, :category, :string
  end
end
