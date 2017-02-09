class Food < ApplicationRecord
  belongs_to :pairing

  validates :sweet, :umami, :spicy, :sour, :bitter, :name, presence: true
  validates_numericality_of :sweet, :umami, :spicy, :sour, :bitter, :greater_than_or_equal_to => 0
  validates_numericality_of :sweet, :umami, :spicy, :sour, :bitter, :less_than_or_equal_to => 5

  def flavour
    {sweet: self.sweet, umami: self.umami, spicy: self.spicy, bitter: self.bitter, sour: self.sour}
  end

end
