class Food < ApplicationRecord

  belongs_to :pairing

  validates :sweet, :umami, :name, presence: true
  validates_numericality_of :sweet, :umami, :greater_than_or_equal_to => 0
  validates_numericality_of :sweet, :umami, :less_than_or_equal_to => 5

end
