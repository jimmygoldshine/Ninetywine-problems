class CreateFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.float :umami
      t.float :spice
      t.float :bitter
      t.float :sour
      t.float :sweet

      t.timestamps
    end
  end
end
