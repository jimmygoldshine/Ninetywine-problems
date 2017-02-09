class Pairing < ApplicationRecord

  attr_accessor :wine

  FIRST_FLAVOUR_RANGE = 1
  SECOND_FLAVOUR_RANGE = 2
  THIRD_FLAVOUR_RANGE = 3
  FOURTH_FLAVOUR_RANGE = 4
  FIFTH_FLAVOUR_RANGE = 5

  has_one :food

  def get_wine(wine_klass)
    @wine = wine_klass.where(sweet_query) if strongest_flavour == :sweet
    @wine = wine_klass.where(sour_query) if strongest_flavour == :sour
    @wine = wine_klass.where(bitter_query) if strongest_flavour == :bitter
    @wine = wine_klass.where(umami_query) if strongest_flavour == :umami
    @wine = wine_klass.where(spicy_query) if strongest_flavour == :spicy
  end

  def strongest_flavour
    food_flavours.key(food_flavours.values.max)
  end

  def food_flavours
    self.food.flavour
  end

  def strongest_flavour_value
    food_flavours[strongest_flavour]
  end

  def eliminate_weak_flavours
    food_flavours.keep_if { |key, value| value >= 0.5 }
  end

  private

  def sweet_query
    lower = (food_flavours[:sweet].to_f * 2) - FIRST_FLAVOUR_RANGE
    upper = (food_flavours[:sweet].to_f * 2) + FIRST_FLAVOUR_RANGE
    "sweet >= #{lower} and sweet <= #{upper}"
  end

  def sour_query
    lower = (food_flavours[:sour].to_f * 2) - FIRST_FLAVOUR_RANGE
    upper = (food_flavours[:sour].to_f * 2) + FIRST_FLAVOUR_RANGE
    "acid >= #{lower} and acid <= #{upper}"
  end

  def bitter_query
    lower = ((1 / food_flavours[:bitter].to_f) * 10) - FIRST_FLAVOUR_RANGE
    upper = ((1 / food_flavours[:bitter].to_f) * 10) + FIRST_FLAVOUR_RANGE
    "bitter >= #{lower} and bitter <= #{upper} and oaky >= #{lower} and oaky <= #{upper}"
  end

  def umami_query
    lower_fruity = (food_flavours[:umami].to_f * 2) - FIRST_FLAVOUR_RANGE
    upper_fruity = (food_flavours[:umami].to_f * 2) + FIRST_FLAVOUR_RANGE
    lower_oaky = (food_flavours[:umami].to_f * 1.5) - FIRST_FLAVOUR_RANGE
    upper_oaky = (food_flavours[:umami].to_f * 1.5) + FIRST_FLAVOUR_RANGE
    "fruity >= #{lower_fruity} and fruity <= #{upper_fruity} and oaky >= #{lower_oaky} and oaky <= #{upper_oaky}"
  end

  def spicy_query
    lower_alcohol = ((1 / food_flavours[:spicy].to_f) * 10) - FIRST_FLAVOUR_RANGE
    upper_alcohol = ((1 / food_flavours[:spicy].to_f) * 10) + FIRST_FLAVOUR_RANGE
    lower_sweet = (5 - food_flavours[:spicy].to_f * 0.2)
    upper_sweet = (5 + food_flavours[:spicy].to_f * 0.2)
    "alcohol >= #{lower_alcohol} and alcohol <= #{upper_alcohol} and sweet >= #{lower_sweet} and sweet <= #{upper_sweet}"
  end

end
