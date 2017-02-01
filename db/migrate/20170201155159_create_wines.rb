class CreateWines < ActiveRecord::Migration[5.0]
  def change
    create_table :wines do |t|
      t.string :name
      t.float :sweet
      t.float :herby
      t.float :bitter
      t.float :fruity
      t.float :oaky
      t.float :alcohol
      t.float :acid

      t.timestamps
    end
  end
end
