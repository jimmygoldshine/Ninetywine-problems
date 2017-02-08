require 'pairing'

describe Pairing do

  let!(:wine_klass) { spy("Wine Klass") }
  let!(:sweet_food) { double("Sweet Food", flavour: :sweet) }
  let!(:spicy_food) { double("Spicy Food", flavour: :spicy) }
  let!(:sour_food) { double("Sour Food", flavour: :sour) }
  let!(:bitter_food) { double("Bitter Food", flavour: :bitter) }
  let!(:umami_food) { double("Umami Food", flavour: :umami) }

  let!(:umami_x_sweet_food) { double("Umami & Sweet Food", flavour: :umami_x_sweet) }
  let!(:umami_x_sour_food) { double("Umami & Sour Food", flavour: :umami_x_sour) }
  let!(:umami_x_bitter_food) { double("Umami & Bitter Food", flavour: :umami_x_bitter) }

  let!(:sweet_x_sour_food) { double("Sweet & Sour Food", flavour: :sweet_x_sour) }
  let!(:sweet_x_bitter_food) { double("Sweet & Bitter Food", flavour: :sweet_x_bitter) }
  let!(:sweet_x_spicy_food) { double("Sweet & Spicy Food", flavour: :sweet_x_spicy) }

  let!(:sour_x_bitter_food) { double("Sour & Bitter Food", flavour: :sour_x_bitter) }
  let!(:sour_x_spicy_food) { double("Sour & Spicy Food", flavour: :sour_x_spicy) }

  #doubles created on Wed 8th Fev below
  let!(:sweet_potato) { double('Sweet potato', flavour: {sweet: 4, umami: 2.5, sour: 0, bitter: 0, spicy: 0 }) }
  let!(:mushrooms) { double('Mushrooms', flavour: {sweet: 0.5, umami: 5, sour: 0.5, bitter: 2, spicy: 0 }) }
  let!(:ceviche) { double("Ceviche", flavour: {spicy: 3, umami: 3, sour: 4.5, bitter: 0.5, sweet: 0}) }

  subject(:pairing) { described_class.new }

  describe "#get_wine" do

    # it 'should get sweet wine from the db if the food is sweet' do
    #   allow(pairing).to receive(:food).and_return(sweet_food)
    #   pairing.get_wine(wine_klass)
    #   criterion = 'sweet >= 5'
    #   expect(wine_klass).to have_received(:where).with('sweet >= 5')
    # end
    #
    # it 'should get spicy wine from the db if the food is spicy' do
    #   allow(pairing).to receive(:food).and_return(spicy_food)
    #   pairing.get_wine(wine_klass)
    #   criteria = 'sweet >= 2.6 and sweet <= 5 and fruity >= 5.1 and acid >= 5.1 and alcohol <= 5'
    #   expect(wine_klass).to have_received(:where).with(criteria)
    # end
    #
    # it 'should get sour wine from the db if the food is sour' do
    #   allow(pairing).to receive(:food).and_return(sour_food)
    #   pairing.get_wine(wine_klass)
    #   criteria = 'sweet >= 5 and bitter <= 2.5 and oaky <= 2.5'
    #   expect(wine_klass).to have_received(:where).with(criteria)
    # end
    #
    # it 'should get umami wine from the db if the food is umami' do
    #   allow(pairing).to receive(:food).and_return(umami_food)
    #   pairing.get_wine(wine_klass)
    #   criteria = 'sweet >= 5 and bitter <= 2.5 and fruity >= 5'
    #   expect(wine_klass).to have_received(:where).with(criteria)
    # end
    #
    # it 'should get bitter wine from the db if the food is bitter' do
    #   allow(pairing).to receive(:food).and_return(bitter_food)
    #   pairing.get_wine(wine_klass)
    #   criteria = 'bitter <= 2.5 and oaky <= 2.5'
    #   expect(wine_klass).to have_received(:where).with(criteria)
    # end
    #
    # it 'should be able to get wine appropriate for umami and sweet food' do
    #   allow(pairing).to receive(:food).and_return(umami_x_sweet_food)
    #   pairing.get_wine(wine_klass)
    #   criteria = 'fruity >= 5 and acid >= 2.6 and acid <= 5'
    #   expect(wine_klass).to have_received(:where).with(criteria)
    # end
    #
    # it 'should be able to get wine appropriate for umami and sour food' do
    #   allow(pairing).to receive(:food).and_return(umami_x_sour_food)
    #   pairing.get_wine(wine_klass)
    #   criteria = 'oaky <= 5 and acid >= 7.5'
    #   expect(wine_klass).to have_received(:where).with(criteria)
    # end
    #
    # it 'should be able to get wine appropriate for umami and bitter food' do
    #   allow(pairing).to receive(:food).and_return(umami_x_bitter_food)
    #   pairing.get_wine(wine_klass)
    #   criteria = 'bitter <= 2.5 and oaky <= 2.5'
    #   expect(wine_klass).to have_received(:where).with(criteria)
    # end
    #
    # it 'should be able to get wine appropriate for sweet and sour food' do
    #   allow(pairing).to receive(:food).and_return(sweet_x_sour_food)
    #   pairing.get_wine(wine_klass)
    #   criteria = 'sweet >= 5 and acid >= 7.5'
    #   expect(wine_klass).to have_received(:where).with(criteria)
    # end
    #
    # it 'should be able to get wine appropriate for sweet and bitter food' do
    #   allow(pairing).to receive(:food).and_return(sweet_x_bitter_food)
    #   pairing.get_wine(wine_klass)
    #   criteria = 'sweet >= 5 and bitter <= 2.5 and fruity >= 4 and acid >= 7.5'
    #   expect(wine_klass).to have_received(:where).with(criteria)
    # end
    #
    # it 'should be able to get wine appropriate for sweet and spicy food' do
    #   allow(pairing).to receive(:food).and_return(sweet_x_spicy_food)
    #   pairing.get_wine(wine_klass)
    #   criteria = 'sweet >= 5 and herby <= 2.5 and fruity >= 4.5 and acid >= 7.5'
    #   expect(wine_klass).to have_received(:where).with(criteria)
    # end
    #
    # it 'should be able to get wine appropriate for sour and bitter food' do
    #   allow(pairing).to receive(:food).and_return(sour_x_bitter_food)
    #   pairing.get_wine(wine_klass)
    #   criteria = 'oaky <= 2.5 and bitter <= 2.5 and acid >= 5'
    #   expect(wine_klass).to have_received(:where).with(criteria)
    # end
    #
    # it 'should be able to get wine appropriate for sour and spicy food' do
    #   allow(pairing).to receive(:food).and_return(sour_x_spicy_food)
    #   pairing.get_wine(wine_klass)
    #   criteria = 'sweet >= 5 and bitter <= 2.5 and alcohol <= 5'
    #   expect(wine_klass).to have_received(:where).with(criteria)
    # end


    it 'should return a narrow range of wine if the strongest value is sweet' do
      allow(pairing).to receive(:food).and_return(sweet_potato)
      pairing.get_wine(wine_klass)
      criteria = 'sweet >= 7.5 and sweet <= 8.5'
      expect(wine_klass).to have_received(:where).with(criteria)
    end

    it 'should return a narrow range of wine if the strongest value is sour' do
      allow(pairing).to receive(:food).and_return(ceviche)
      pairing.get_wine(wine_klass)
      criteria = 'acid >= 8.5 and acid <= 9.5'
      expect(wine_klass).to have_received(:where).with(criteria)
    end

  end

  describe 'checking food characteristics' do

    it 'is able to determine when sweet is the strongest food characteristic' do
      allow(pairing).to receive(:food).and_return(sweet_potato)
      expect(pairing.strongest_flavour).to eq :sweet
    end

    it 'is able to determine when umami is the strongest food characteristic' do
      allow(pairing).to receive(:food).and_return(mushrooms)
      expect(pairing.strongest_flavour).to eq :umami
    end

  end

  describe '#food_flavours' do

    it 'is able to determine when sweet is the strongest food characteristic' do
      allow(pairing).to receive(:food).and_return(sweet_potato)
      expect(pairing.food_flavours).to eq({sweet: 4, umami: 2.5, sour: 0, bitter: 0, spicy: 0})
    end
  end

  describe '#strongest_flavour_value' do

    it 'returns 4 when checking the value of the sweet potato double' do
      allow(pairing).to receive(:food).and_return(sweet_potato)
      expect(pairing.strongest_flavour_value).to eq 4
    end

    it 'returns 4 when checking the value of the sweet potato double' do
      allow(pairing).to receive(:food).and_return(mushrooms)
      expect(pairing.strongest_flavour_value).to eq 5
    end
  end

end
