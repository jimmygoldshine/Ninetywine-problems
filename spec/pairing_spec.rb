# require 'rails_helper'
#
# describe Pairing do
#
#   let!(:wine_klass)  {spy('wine_klass')}
#   let!(:pairing)  {described_class.new(double('cake', sweet: 5, umami: 0, spicy:0, bitter:0, sour:0), wine_klass)}
#
#
#   it 'instantiates with a food object' do
#     expect(pairing).to be_an_instance_of Pairing
#   end
#
#   describe 'sweet food & wine' do
#
#     it 'gets sweet wine from the database' do
#       expect(wine_klass).to have_received(:where).with('sweet > 5.1')
#     end
#   end
#
#   describe 'umami food & wine' do
#
#     let!(:bacon_pairing)  {described_class.new(double('bacon', umami: 5, sweet: 0, spicy:0, bitter:0, sour:0), wine_klass)}
#
#     it 'gets umami wine from the database' do
#       expect(wine_klass).to have_received(:where).with('sweet > 5.1 and bitter < 2.5 and fruity > 5.1')
#     end
#   end
#
#   describe 'spicy food & wine' do
#
#     let!(:spicy_pairing)  {described_class.new(double('spicy', umami: 0, sweet: 0, spicy:4, bitter:0, sour:0), wine_klass)}
#
#     it 'gets spicy wine from the database' do
#       expect(wine_klass).to have_received(:where).with('2.6 < sweet < 5 and fruity > 5.1 and acid > 5.1')
#     end
#   end
#
#   describe 'bitter food & wine' do
#
#     let!(:bitter_pairing)  {described_class.new(double('bitter', umami: 0, sweet: 0, spicy:4, bitter:4, sour:0), wine_klass)}
#
#     it 'gets spicy wine from the database' do
#       expect(wine_klass).to have_received(:where).with('bitter < 2.5 and oaky < 2.5')
#     end
#   end
#
#   describe 'sour food & wine' do
#
#     let!(:sour_pairing)  {described_class.new(double('sour', umami: 0, sweet: 0, spicy:4, bitter:0, sour:4), wine_klass)}
#
#     it 'gets sour wine from the database' do
#       expect(wine_klass).to have_received(:where).with('sweet > 5.1 and bitter < 2.5 and oaky < 2.5')
#     end
#   end
#
# end
