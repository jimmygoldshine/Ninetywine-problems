class AddPairingToFoods < ActiveRecord::Migration[5.0]
  def change
    add_reference :foods, :pairing, foreign_key: true
  end
end
