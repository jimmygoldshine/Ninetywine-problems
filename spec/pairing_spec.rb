require 'rails_helper'

describe Pairing do

  let!(:wine_klass)  {spy('wine_klass')}
  let!(:pairing)  {described_class.create}

    it 'gets sweet wine from the database' do
      pairing.get_sweet_wine(wine_klass)
      expect(wine_klass).to have_received(:where).with('sweet > 5.1')
    end
    
end
