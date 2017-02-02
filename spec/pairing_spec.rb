require 'rails_helper'

describe Pairing do


  let!(:wine_klass)  {spy('wine_klass')}
  let!(:pairing)  {described_class.new(double('cake', sweet: 5), wine_klass)}

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

end
