class Food < ApplicationRecord

  validates :sweet, :name, presence: true
  validates :sweet, inclusion: [0..5]

  # def initialize(args, pairing_klass)
  #   pairing_klass.new(self)
  # end

end
