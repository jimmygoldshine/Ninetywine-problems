require 'rails_helper'

describe 'sweet wine' do

  it 'should return all wines with sweet > 5.1' do
    sweet_wine = Wine.where('sweet > 5.1').to_a
    ratings = sweet_wine.map { |wine| wine.sweet }
    expect(ratings.all? { |rating| rating > 5.1 }).to eq true
  end
end
