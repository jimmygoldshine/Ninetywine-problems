class Food < ApplicationRecord

  validates :sweet, :name, presence: true

end
