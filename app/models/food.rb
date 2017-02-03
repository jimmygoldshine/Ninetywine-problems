class Food < ApplicationRecord

  belongs_to :pairing

  validates :sweet, :name, presence: true
  validates_numericality_of :sweet, :greater_than_or_equal_to => 0
  validates_numericality_of :sweet, :less_than_or_equal_to => 5

  # def initialize(args, pairing_klass)
  #   pairing_klass.new(self)
  # end

end
