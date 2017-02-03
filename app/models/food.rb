class Food < ApplicationRecord
  belongs_to :pairing

  validates :sweet, :umami, :name, presence: true
  validates_numericality_of :sweet, :umami, :greater_than_or_equal_to => 0
  validates_numericality_of :sweet, :umami, :less_than_or_equal_to => 5

  DOMINANT_FLAVOUR_CHECK = 3.4
  WEAK_FLAVOUR_CHECK = 3

  def is_sweet?
     self.sweet > DOMINANT_FLAVOUR_CHECK && all_others_weak?(self.sweet)
  end

  def is_umami?
    self.umami > DOMINANT_FLAVOUR_CHECK && all_others_weak?(self.umami)
  end

  def is_spicy?
    self.spicy > DOMINANT_FLAVOUR_CHECK && all_others_weak?(self.spicy)
  end

  def is_bitter?
    self.bitter > DOMINANT_FLAVOUR_CHECK && all_others_weak?(self.bitter)
  end

  def is_sour?
    self.sour > DOMINANT_FLAVOUR_CHECK && all_others_weak?(self.sour)
  end

  private

    def all_others_weak?(flavour)
      food_flavours = [self.spicy, self.sweet, self.umami, self.bitter, self.sour].compact
      food_flavours.slice!(food_flavours.index(flavour))
      food_flavours.all? {|rating| rating < WEAK_FLAVOUR_CHECK}
    end

end
