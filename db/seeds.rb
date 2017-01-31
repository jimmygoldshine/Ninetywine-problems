require 'csv'


wines = CSV.table('./db/wines.csv')
wines.each do |wine|
  Wine.create! wine.to_hash
end

foods = CSV.table('./db/food.csv')
foods.each do |food|
  Food.create! food.to_hash
end
