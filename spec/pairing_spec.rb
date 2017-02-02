require 'rails_helper'

describe Pairing do


  let!(:wine_klass)  {spy('wine_klass')}
  let!(:cake) { double('cake', sweet:5) }
  let!(:pairing)  {described_class.new(cake)}

  it 'instantiates with a food object' do
    expect(pairing).to be_an_instance_of Pairing
  end

  describe 'sweet food & wine' do
    it 'checks the level of food sweetness' do
      expect(pairing.is_sweet_food?).to eq true
    end

    it 'gets sweet wine from the database' do
      pairing.get_sweet_wine(wine_klass)
      expect(wine_klass).to have_received(:where).with('sweet > 5.1')
    end
  end


end
