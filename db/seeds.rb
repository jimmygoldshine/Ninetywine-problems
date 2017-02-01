require 'csv'

wines = CSV.table('./db/wines.csv')
wines.each do |wine|
  Wine.create! wine.to_hash
end
