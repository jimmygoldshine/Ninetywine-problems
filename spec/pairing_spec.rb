require 'pairing'

describe Pairing do

  let!(:wine_klass) { spy("Wine Klass") }
  let!(:sweet_potato) { double('Sweet potato', flavour: {sweet: 4, umami: 2.5, sour: 0, bitter: 0, spicy: 0 }) }
  let!(:mushrooms) { double('Mushrooms', flavour: {sweet: 0.5, umami: 5, sour: 0.5, bitter: 2, spicy: 0 }) }
  let!(:ceviche) { double("Ceviche", flavour: {spicy: 3, umami: 3, sour: 4.5, bitter: 0.5, sweet: 0}) }
  let!(:rocket_salad) { double('Rocket Salad', flavour: {spicy: 0, umami: 2, sour: 1, bitter: 4, sweet: 1}) }
  let!(:phaal) { double('Phaal', flavour: {spicy: 5, umami: 2, sour: 0, bitter: 0, sweet: 0}) }

  subject(:pairing) { described_class.new }

  describe "#get_wine" do

    it 'should return a narrow range of wine if the strongest value is sweet' do
      allow(pairing).to receive(:food).and_return(sweet_potato)
      pairing.get_wine(wine_klass)
      criteria = 'sweet >= 7.0 and sweet <= 9.0'
      expect(wine_klass).to have_received(:where).with(criteria)
    end

    it 'should return a narrow range of wine if the strongest value is sour' do
      allow(pairing).to receive(:food).and_return(ceviche)
      pairing.get_wine(wine_klass)
      criteria = 'acid >= 8.0 and acid <= 10.0'
      expect(wine_klass).to have_received(:where).with(criteria)
    end

    it 'should return a narrow range of wine if the strongest value is bitter' do
      allow(pairing).to receive(:food).and_return(rocket_salad)
      pairing.get_wine(wine_klass)
      criteria = 'bitter >= 1.5 and bitter <= 3.5 and oaky >= 1.5 and oaky <= 3.5'
      expect(wine_klass).to have_received(:where).with(criteria)
    end

    it 'should return a narrow range of wine if the strongest value is umami' do
      allow(pairing).to receive(:food).and_return(mushrooms)
      pairing.get_wine(wine_klass)
      criteria = 'fruity >= 9.0 and fruity <= 11.0 and oaky >= 6.5 and oaky <= 8.5'
      expect(wine_klass).to have_received(:where).with(criteria)
    end

    it 'should return a narrow range of wine if the strongest value is spicy' do
      allow(pairing).to receive(:food).and_return(phaal)
      pairing.get_wine(wine_klass)
      criteria = 'alcohol >= 1.0 and alcohol <= 3.0 and sweet >= 4.0 and sweet <= 6.0'
      expect(wine_klass).to have_received(:where).with(criteria)
    end

  end

  describe '#strongest_flavour' do

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

  describe '#eliminate_weak_flavours' do

    it 'elimates the values of food characteristics that are lower than 0.5 using sweet potato as an example' do
      allow(pairing).to receive(:food).and_return(sweet_potato)
      expect(pairing.eliminate_weak_flavours).to eq({sweet:4, umami:2.5})
    end

    it 'elimates the values of food characteristics that are lower than 0.5 using mushrooms as an example' do
      allow(pairing).to receive(:food).and_return(mushrooms)
      expect(pairing.eliminate_weak_flavours).to eq({sweet:0.5, umami:5, sour:0.5, bitter:2})
    end

  end

end
