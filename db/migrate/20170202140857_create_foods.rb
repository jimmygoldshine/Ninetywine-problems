class CreateFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.float :umami
      t.float :sweet
      t.float :spicy
      t.float :sour
      t.float :bitter
      t.float :fat

      t.timestamps
    end
  end
end
