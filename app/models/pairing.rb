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
    elsif strongest_flavour == :bitter
      @wine = wine_klass.where(bitter_query)
    elsif strongest_flavour == :umami
      @wine = wine_klass.where(umami_query)
    elsif strongest_flavour == :spicy
      @wine = wine_klass.where(spicy_query)
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
