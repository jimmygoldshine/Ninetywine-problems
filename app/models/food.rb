class Food < ApplicationRecord

  validates :sweet, :name, presence: true
  validates :sweet, inclusion: [0..5]

end
