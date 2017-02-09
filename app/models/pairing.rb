class Pairing < ApplicationRecord

  attr_accessor :wine

  FLAVOUR_RANGE = [2, 2.5, 3, 4, 5]

  has_one :food

  def get_wine(wine_klass)
    @wine = wine_klass.where(query_builder).limit(3)
  end

  def food_flavours
    self.food.flavour
  end

  def eliminate_weak_flavours
    food_flavours.keep_if { |key, value| value >= 1.0 }
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

  def conflict_resolver(hash, flavour, lower, upper)
    if hash.has_key?(flavour)
      average_lower = (lower + hash[flavour][:lower].to_f) / 2
      average_upper = (upper + hash[flavour][:upper].to_f) / 2
      {lower: average_lower, upper: average_upper}
    else
      {lower: lower, upper: upper}
    end
  end


  private

  def sweet_query(index, hash)
    lower = (food_flavours[:sweet].to_f * 2) - FLAVOUR_RANGE[index]
    upper = (food_flavours[:sweet].to_f * 2) + FLAVOUR_RANGE[index]
    hash[:sweet] = conflict_resolver(hash, :sweet, lower, upper)
  end

  def sour_query(index, hash)
    lower = (food_flavours[:sour].to_f * 2) - FLAVOUR_RANGE[index]
    upper = (food_flavours[:sour].to_f * 2) + FLAVOUR_RANGE[index]
    hash[:acid] = conflict_resolver(hash, :acid, lower, upper)
  end

  def bitter_query(index, hash)
    lower = ((1 / food_flavours[:bitter].to_f) * 10) - FLAVOUR_RANGE[index]
    upper = ((1 / food_flavours[:bitter].to_f) * 10) + FLAVOUR_RANGE[index]
    hash[:bitter] = conflict_resolver(hash, :bitter, lower, upper)
    hash[:oaky] = conflict_resolver(hash, :oaky, lower, upper)
  end

  def umami_query(index, hash)
    lower_fruity = (food_flavours[:umami].to_f * 2) - FLAVOUR_RANGE[index]
    upper_fruity = (food_flavours[:umami].to_f * 2) + FLAVOUR_RANGE[index]
    lower_oaky = (food_flavours[:umami].to_f * 1.5) - FLAVOUR_RANGE[index]
    upper_oaky = (food_flavours[:umami].to_f * 1.5) + FLAVOUR_RANGE[index]
    hash[:fruity] = conflict_resolver(hash, :fruity, lower_fruity, upper_fruity)
    hash[:oaky] = conflict_resolver(hash, :oaky, lower_oaky, upper_oaky)
  end

  def spicy_query(index, hash)
    lower_alcohol = ((1 / food_flavours[:spicy].to_f) * 10) - FLAVOUR_RANGE[index]
    upper_alcohol = ((1 / food_flavours[:spicy].to_f) * 10) + FLAVOUR_RANGE[index]
    lower_sweet = (5 - food_flavours[:spicy].to_f * 0.2)
    upper_sweet = (5 + food_flavours[:spicy].to_f * 0.2)
    hash[:alcohol] = conflict_resolver(hash, :alcohol, lower_alcohol, upper_alcohol)
    hash[:sweet] = conflict_resolver(hash, :sweet, lower_sweet, upper_sweet)
  end

end
