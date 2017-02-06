class Food < ApplicationRecord
  belongs_to :pairing

  validates :sweet, :umami, :spicy, :sour, :bitter, :name, presence: true
  validates_numericality_of :sweet, :umami, :spicy, :sour, :bitter, :greater_than_or_equal_to => 0
  validates_numericality_of :sweet, :umami, :spicy, :sour, :bitter, :less_than_or_equal_to => 5

  DOMINANT_FLAVOUR_CHECK = 3.5
  SECONDARY_FLAVOUR_CHECK = 3
  WEAK_FLAVOUR_CHECK = 3

  def flavour
    if is_single_flavour?
      return :sweet if is_sweet?
      return :umami if is_umami?
      return :spicy if is_spicy?
      return :bitter if is_bitter?
      return :sour if is_sour?
    elsif is_combined_flavour?
      return :umami_x_sweet if is_umami_x_sweet?
      return :umami_x_sour if is_umami_x_sour?
      return :umami_x_bitter if is_umami_x_bitter?
      return :sweet_x_sour if is_sweet_x_sour?
      return :sweet_x_bitter if is_sweet_x_bitter?
      return :sweet_x_spicy if is_sweet_x_spicy?
      return :sour_x_bitter if is_sour_x_bitter?
      return :sour_x_spicy if is_sour_x_spicy?

    else
      return :variety
    end
  end

  def is_single_flavour?
    strong_flavours.length < 2
  end

  def is_combined_flavour?
    strong_flavours.length > 1
  end

  private

  def is_umami_x_sweet?
    self.umami >= SECONDARY_FLAVOUR_CHECK && self.sweet >= SECONDARY_FLAVOUR_CHECK
  end

  def is_umami_x_sour?
    self.umami >= SECONDARY_FLAVOUR_CHECK && self.sour >= SECONDARY_FLAVOUR_CHECK
  end

  def is_umami_x_bitter?
    self.umami >= SECONDARY_FLAVOUR_CHECK && self.bitter >= SECONDARY_FLAVOUR_CHECK
  end

  def is_sweet_x_sour?
    self.sweet >= SECONDARY_FLAVOUR_CHECK && self.sour >= SECONDARY_FLAVOUR_CHECK
  end

  def is_sweet_x_bitter?
    self.sweet >= SECONDARY_FLAVOUR_CHECK && self.bitter >= SECONDARY_FLAVOUR_CHECK
  end

  def is_sweet_x_spicy?
    self.sweet >= SECONDARY_FLAVOUR_CHECK && self.spicy >= SECONDARY_FLAVOUR_CHECK
  end

  def is_sour_x_bitter?
    self.sour >= SECONDARY_FLAVOUR_CHECK && self.bitter >= SECONDARY_FLAVOUR_CHECK
  end

  def is_sour_x_spicy?
    self.sour >= SECONDARY_FLAVOUR_CHECK && self.spicy >= SECONDARY_FLAVOUR_CHECK
  end

  def is_sweet?
    self.sweet >= DOMINANT_FLAVOUR_CHECK
  end

  def is_umami?
    self.umami >= DOMINANT_FLAVOUR_CHECK
  end

  def is_spicy?
    self.spicy >= DOMINANT_FLAVOUR_CHECK
  end

  def is_bitter?
    self.bitter >= DOMINANT_FLAVOUR_CHECK
  end

  def is_sour?
    self.sour >= DOMINANT_FLAVOUR_CHECK
  end

  def food_flavour_ratings
    [self.spicy, self.sweet, self.umami, self.bitter, self.sour].compact
  end

  def strong_flavours
    food_flavour_ratings.select { |flavour| flavour >= 3.5 }
  end

end
