class AddFoodToPairings < ActiveRecord::Migration[5.0]
  def change
    add_reference :pairings, :food, foreign_key: true
  end
end
