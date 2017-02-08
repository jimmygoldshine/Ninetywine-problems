class Pairing < ApplicationRecord

  attr_accessor :wine

  FIRST_FLAVOUR_RANGE = 0.5
  SECOND_FLAVOUR_RANGE = 0.75
  THIRD_FLAVOUR_RANGE = 1
  FOURTH_FLAVOUR_RANGE = 2.5
  FIFTH_FLAVOUR_RANGE = 4

  has_one :food

  def get_wine(wine_klass)
    if strongest_flavour == :sweet
      @wine = wine_klass.where(sweet_query)
    elsif strongest_flavour == :sour
      @wine = wine_klass.where(sour_query)
    else
      @wine = wine_klass.where(MATCHES[food.flavour]).limit(3)
    end
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

  private

  def sweet_query
    lower = (food_flavours[:sweet] * 2) - FIRST_FLAVOUR_RANGE
    upper = (food_flavours[:sweet] * 2) + FIRST_FLAVOUR_RANGE
    "sweet >= #{lower} and sweet <= #{upper}"
  end

  def sour_query
    lower = (food_flavours[:sour] * 2) - FIRST_FLAVOUR_RANGE
    upper = (food_flavours[:sour] * 2) + FIRST_FLAVOUR_RANGE
    "acid >= #{lower} and acid <= #{upper}"
  end

  MATCHES = {
    sweet: 'sweet >= 5',
    spicy: 'sweet >= 2.6 and sweet <= 5 and fruity >= 5.1 and acid >= 5.1 and alcohol <= 5',
    sour: 'sweet >= 5 and bitter <= 2.5 and oaky <= 2.5',
    umami: 'sweet >= 5 and bitter <= 2.5 and fruity >= 5',
    bitter: 'bitter <= 2.5 and oaky <= 2.5',
    umami_x_sweet: 'fruity >= 5 and acid >= 2.6 and acid <= 5',
    umami_x_sour: 'oaky <= 5 and acid >= 7.5',
    umami_x_bitter: 'bitter <= 2.5 and oaky <= 2.5',
    sweet_x_sour: 'sweet >= 5 and acid >= 7.5',
    sweet_x_bitter: 'sweet >= 5 and bitter <= 2.5 and fruity >= 4 and acid >= 7.5',
    sweet_x_spicy: 'sweet >= 5 and herby <= 2.5 and fruity >= 4.5 and acid >= 7.5',
    sour_x_bitter: 'oaky <= 2.5 and bitter <= 2.5 and acid >= 5',
    sour_x_spicy: 'sweet >= 5 and bitter <= 2.5 and alcohol <= 5',
  }

end
