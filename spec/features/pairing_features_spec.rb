require 'rails_helper'

feature 'pairng with instances of food' do

  it 'start using the site immediately' do
    visit('/')
    expect(page).to have_button("Start pairing!")
  end

  it 'create a new empty pairing' do
    visit('/pairings/new')
    expect{ click_button('Start pairing!') }.to change{Pairing.count}.by 1
  end

  it 'a food form can be filled in' do
    visit('/pairings/new')
    click_button('Start pairing!')
    expect(page).to have_content("Tell us about your food")
    expect(page).to have_css("input#food_name")
    expect(page).to have_css("input#food_sweet")
    expect(page).to have_button("Submit")
  end

  it 'user is on a single results page and wants to go back to the home page to start again' do
    start_pairing
    create_pairing(name: 'A sweet food', sweet: 4)
    expect(page).to have_link 'Start pairing again!'

  end


end
