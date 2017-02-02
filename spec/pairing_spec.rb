require 'rails_helper'

describe Pairing do

  subject(:pairing)  {described_class.new(double('cake', sweet: 5))}

  it 'instantiates with a food object' do
    expect(pairing).to be_an_instance_of Pairing
  end

  describe 'sweet food & wine' do
    it 'checks the level of food sweetness' do
      expect(pairing.sweet_food?).to eq true
    end
  end

end
