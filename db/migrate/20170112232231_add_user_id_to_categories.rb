class AddUserIdToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :User_id, :integer
  end
end
