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

  def query_hash
    index = 0
    query = Hash.new
    rank_flavours.each do |flavour, strength|
      method(flavour.to_s + "_query").call(index, query)
      index += 1
    end
    query
  end

  def query_array
    array = []
    query_hash.each do |key, value|
      array << key.to_s + ' >= ' + value[:lower].to_s + ' and ' + key.to_s + ' <= ' + value[:upper].to_s
    end
    array
  end

  def query_builder
    query_array.join(' and ')
  end

  private

  def sweet_query(index, hash)
    lower = (food_flavours[:sweet].to_f * 2) - FLAVOUR_RANGE[index]
    upper = (food_flavours[:sweet].to_f * 2) + FLAVOUR_RANGE[index]
    hash[:sweet] = {lower: lower, upper: upper}
  end

  def sour_query(index, hash)
    lower = (food_flavours[:sour].to_f * 2) - FLAVOUR_RANGE[index]
    upper = (food_flavours[:sour].to_f * 2) + FLAVOUR_RANGE[index]
    hash[:acid] = {lower: lower, upper: upper}
  end

  def bitter_query(index, hash)
    lower = ((1 / food_flavours[:bitter].to_f) * 10) - FLAVOUR_RANGE[index]
    upper = ((1 / food_flavours[:bitter].to_f) * 10) + FLAVOUR_RANGE[index]
    hash[:bitter] = {lower: lower, upper: upper}
    hash[:oaky] = {lower: lower, upper: upper}
  end

  def umami_query(index, hash)
    lower_fruity = (food_flavours[:umami].to_f * 2) - FLAVOUR_RANGE[index]
    upper_fruity = (food_flavours[:umami].to_f * 2) + FLAVOUR_RANGE[index]
    lower_oaky = (food_flavours[:umami].to_f * 1.5) - FLAVOUR_RANGE[index]
    upper_oaky = (food_flavours[:umami].to_f * 1.5) + FLAVOUR_RANGE[index]
    hash[:fruity] = {lower: lower_fruity, upper: upper_fruity}
    hash[:oaky] = {lower: lower_oaky, upper: upper_oaky}
  end

  def spicy_query(index, hash)
    lower_alcohol = ((1 / food_flavours[:spicy].to_f) * 10) - FLAVOUR_RANGE[index]
    upper_alcohol = ((1 / food_flavours[:spicy].to_f) * 10) + FLAVOUR_RANGE[index]
    lower_sweet = (5 - food_flavours[:spicy].to_f * 0.2)
    upper_sweet = (5 + food_flavours[:spicy].to_f * 0.2)
    hash[:alcohol] = {lower: lower_alcohol, upper: upper_alcohol}
    hash[:sweet] = {lower: lower_sweet, upper: upper_sweet}
  end

end
