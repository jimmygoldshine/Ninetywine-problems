class AddFatToFoods < ActiveRecord::Migration[5.0]
  def change
    add_column :foods, :fat, :float
  end
end
