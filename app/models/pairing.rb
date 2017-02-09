class Pairing < ApplicationRecord

  attr_accessor :wine

  FLAVOUR_RANGE = [1, 2, 3, 4, 5]

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

  def rank_flavours
    eliminate_weak_flavours.sort_by { |key, value| value }.reverse.to_h
  end

  def query_array
    index = 0
    rank_flavours.collect do |flavour, strength|
      query = method(flavour.to_s + "_query").call(index)
      index += 1
      query
    end
  end

  def query_builder
    query_array.join(' and ')
  end

  private

  def sweet_query(index)
    lower = (food_flavours[:sweet].to_f * 2) - FLAVOUR_RANGE[index]
    upper = (food_flavours[:sweet].to_f * 2) + FLAVOUR_RANGE[index]
    "sweet >= #{lower} and sweet <= #{upper}"
  end

  def sour_query(index)
    lower = (food_flavours[:sour].to_f * 2) - FLAVOUR_RANGE[index]
    upper = (food_flavours[:sour].to_f * 2) + FLAVOUR_RANGE[index]
    "acid >= #{lower} and acid <= #{upper}"
  end

  def bitter_query(index)
    lower = ((1 / food_flavours[:bitter].to_f) * 10) - FLAVOUR_RANGE[index]
    upper = ((1 / food_flavours[:bitter].to_f) * 10) + FLAVOUR_RANGE[index]
    "bitter >= #{lower} and bitter <= #{upper} and oaky >= #{lower} and oaky <= #{upper}"
  end

  def umami_query(index)
    lower_fruity = (food_flavours[:umami].to_f * 2) - FLAVOUR_RANGE[index]
    upper_fruity = (food_flavours[:umami].to_f * 2) + FLAVOUR_RANGE[index]
    lower_oaky = (food_flavours[:umami].to_f * 1.5) - FLAVOUR_RANGE[index]
    upper_oaky = (food_flavours[:umami].to_f * 1.5) + FLAVOUR_RANGE[index]
    "fruity >= #{lower_fruity} and fruity <= #{upper_fruity} and oaky >= #{lower_oaky} and oaky <= #{upper_oaky}"
  end

  def spicy_query(index)
    lower_alcohol = ((1 / food_flavours[:spicy].to_f) * 10) - FLAVOUR_RANGE[index]
    upper_alcohol = ((1 / food_flavours[:spicy].to_f) * 10) + FLAVOUR_RANGE[index]
    lower_sweet = (5 - food_flavours[:spicy].to_f * 0.2)
    upper_sweet = (5 + food_flavours[:spicy].to_f * 0.2)
    "alcohol >= #{lower_alcohol} and alcohol <= #{upper_alcohol} and sweet >= #{lower_sweet} and sweet <= #{upper_sweet}"
  end

end
