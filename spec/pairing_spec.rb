require 'pairing'

describe Pairing do

  let!(:wine_klass) { spy("Wine Klass") }
  let!(:sweet_potato) { double('Sweet potato', flavour: {umami: 2.5, sweet: 4, sour: 0, bitter: 0, spicy: 0 }) }
  let!(:mushrooms) { double('Mushrooms', flavour: {sweet: 0.5, umami: 5, sour: 0.5, bitter: 2, spicy: 0 }) }
  let!(:ceviche) { double("Ceviche", flavour: {spicy: 3, umami: 3, sour: 4.5, bitter: 0.5, sweet: 0}) }
  let!(:rocket_salad) { double('Rocket Salad', flavour: {spicy: 0, umami: 2, sour: 1, bitter: 4, sweet: 1}) }
  let!(:phaal) { double('Phaal', flavour: {spicy: 5, umami: 2, sour: 0, bitter: 0, sweet: 0}) }
  let!(:linguine) { double('Linguine', flavour: {spicy: 0, umami: 3, sour: 0.4, bitter: 4, sweet: 0}) }

  subject(:pairing) { described_class.new }

  describe "#get_wine" do

    it 'should return a narrow range of wine if the strongest value is sweet' do
      allow(pairing).to receive(:food).and_return(sweet_potato)
      pairing.get_wine(wine_klass)
      criteria = "sweet >= 6.0 and sweet <= 10.0 and fruity >= 2.5 and fruity <= 7.5 and oaky >= 1.25 and oaky <= 6.25"
      expect(wine_klass).to have_received(:where).with(criteria)
    end

  end

  describe '#food_flavours' do

    it 'is able to determine when sweet is the strongest food characteristic' do
      allow(pairing).to receive(:food).and_return(sweet_potato)
      expect(pairing.food_flavours).to eq({sweet: 4, umami: 2.5, sour: 0, bitter: 0, spicy: 0})
    end
  end

  describe '#eliminate_weak_flavours' do

    it 'elimates the values of food characteristics that are lower than 0.5 using sweet potato as an example' do
      allow(pairing).to receive(:food).and_return(sweet_potato)
      expect(pairing.eliminate_weak_flavours).to eq({sweet:4, umami:2.5})
    end

    it 'elimates the values of food characteristics that are lower than 0.5 using mushrooms as an example' do
      allow(pairing).to receive(:food).and_return(mushrooms)
      expect(pairing.eliminate_weak_flavours).to eq({umami:5, bitter:2})
    end

  end

  describe '#rank_flavours' do

    it 'ranks the food characteristics from highest to lowest after #eliminate_weak_flavours has been called' do
      allow(pairing).to receive(:food).and_return(sweet_potato)
      expect(pairing.rank_flavours.first).to eq [:sweet, 4]
    end
  end

  describe '#query_hash' do
    it 'returns a hash of query criteria based on matching rules' do
      allow(pairing).to receive(:food).and_return(sweet_potato)
      query = {sweet: {lower: 6.0, upper: 10.0}, fruity: {lower: 2.5, upper: 7.5}, oaky: {lower: 1.25, upper: 6.25}}
      expect(pairing.query_hash).to eq query
    end

    it 'should overwrite the upper and lower values with averages when they already exist' do
      allow(pairing).to receive(:food).and_return(linguine)
      query = {bitter: {lower:0.5, upper:4.5}, oaky: {lower:1.25, upper:5.75}, fruity: {lower:3.5, upper:8.5}}
      expect(pairing.query_hash).to eq query
    end

  end

  describe '#query_array' do
    it 'returns an array of queries based on food flavours' do
      allow(pairing).to receive(:food).and_return(sweet_potato)
      expect(pairing.query_array).to eq ["sweet >= 6.0 and sweet <= 10.0", "fruity >= 2.5 and fruity <= 7.5", "oaky >= 1.25 and oaky <= 6.25"]
    end
  end

  describe '#query_builder' do
    it 'returns a string containing the full query needed to return wines from the database' do
      allow(pairing).to receive(:food).and_return(sweet_potato)
      expect(pairing.query_builder).to eq 'sweet >= 6.0 and sweet <= 10.0 and fruity >= 2.5 and fruity <= 7.5 and oaky >= 1.25 and oaky <= 6.25'
    end
  end



end
