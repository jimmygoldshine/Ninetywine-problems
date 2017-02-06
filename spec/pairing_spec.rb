require 'pairing'

describe Pairing do

  let!(:wine_klass) { spy("Wine Klass") }
  let!(:sweet_food) { double("Sweet Food", flavour: :sweet) }
  let!(:spicy_food) { double("Spicy Food", flavour: :spicy) }
  let!(:sour_food) { double("Sour Food", flavour: :sour) }
  let!(:bitter_food) { double("Bitter Food", flavour: :bitter) }
  let!(:umami_food) { double("Umami Food", flavour: :umami) }
  let!(:umami_x_sweet_food) { double("Umami & Sweet Food", flavour: :umami_x_sweet) }

  subject(:pairing) { described_class.new }

  describe "#get_wine" do

    it 'should get sweet wine from the db if the food is sweet' do
      allow(pairing).to receive(:food).and_return(sweet_food)
      pairing.get_wine(wine_klass)
      criterion = 'sweet >= 5'
      expect(wine_klass).to have_received(:where).with('sweet >= 5')
    end

    it 'should get spicy wine from the db if the food is spicy' do
      allow(pairing).to receive(:food).and_return(spicy_food)
      pairing.get_wine(wine_klass)
      criteria = 'sweet >= 2.6 and sweet <= 5 and fruity >= 5.1 and acid >= 5.1 and alcohol <= 5'
      expect(wine_klass).to have_received(:where).with(criteria)
    end

    it 'should get sour wine from the db if the food is sour' do
      allow(pairing).to receive(:food).and_return(sour_food)
      pairing.get_wine(wine_klass)
      criteria = 'sweet >= 5 and bitter <= 2.5 and oaky <= 2.5'
      expect(wine_klass).to have_received(:where).with(criteria)
    end

    it 'should get umami wine from the db if the food is umami' do
      allow(pairing).to receive(:food).and_return(umami_food)
      pairing.get_wine(wine_klass)
      criteria = 'sweet >= 5 and bitter <= 2.5 and fruity >= 5'
      expect(wine_klass).to have_received(:where).with(criteria)
    end

    it 'should get bitter wine from the db if the food is bitter' do
      allow(pairing).to receive(:food).and_return(bitter_food)
      pairing.get_wine(wine_klass)
      criteria = 'bitter <= 2.5 and oaky <= 2.5'
      expect(wine_klass).to have_received(:where).with(criteria)
    end

    it 'should be able to get wine appropriate for umami and sweet food' do
      allow(pairing).to receive(:food).and_return(umami_x_sweet_food)
      pairing.get_wine(wine_klass)
      criteria = 'fruity >= 5 and acid >= 2.6 and acid <= 5'
      expect(wine_klass).to have_received(:where).with(criteria)
    end

  end

end
