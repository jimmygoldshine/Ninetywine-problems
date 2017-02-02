require 'rails_helper'

describe Pairing do

  let!(:wine_klass)  {spy('wine_klass')}
  let!(:pairing)  {described_class.new(double('cake', sweet: 5, umami: 0, spicy:0), wine_klass)}

  it 'instantiates with a food object' do
    expect(pairing).to be_an_instance_of Pairing
  end

  describe 'sweet food & wine' do
    it 'checks the level of food sweetness' do
      expect(pairing.is_sweet_food?).to eq true
    end

    it 'gets sweet wine from the database' do
      expect(wine_klass).to have_received(:where).with('sweet > 5.1')
    end
  end

  describe 'umami food & wine' do

    let!(:bacon_pairing)  {described_class.new(double('bacon', umami: 5, sweet: 0, spicy:0), wine_klass)}

    it 'checks the level of food umami level' do
      expect(bacon_pairing.is_umami_food?).to eq true
    end

    it 'gets umami wine from the database' do
      expect(wine_klass).to have_received(:where).with('sweet > 5.1 and bitter < 2.5 and fruity > 5.1')
    end
  end

  describe 'spicy food & wine' do

    let!(:spicy_pairing)  {described_class.new(double('spicy', umami: 0, sweet: 0, spicy:4), wine_klass)}

    it 'checks the level of food spicy level' do
      expect(spicy_pairing.is_spicy_food?).to eq true
    end

    it 'gets spicy wine from the database' do
      expect(wine_klass).to have_received(:where).with('2.6 < sweet < 5 and fruity > 5.1 and acid > 5.1')
    end
  end
end
