require 'rails_helper'

feature 'pairing with instances of food' do

  it 'start using the site immediately' do
    visit('/')
    expect(page).to have_button("S T A R T   P A I R I N G")
  end

  it 'create a new empty pairing' do
    visit('/pairings/new')
    expect{ click_button("S T A R T   P A I R I N G") }.to change{Pairing.count}.by 1
  end

  it 'a food form can be filled in' do
    visit('/pairings/new')
    click_button("S T A R T   P A I R I N G")
    expect(page).to have_css("input#food_name")
    expect(page).to have_css("input#sweet_slider")
    expect(page).to have_button("N E X T")
  end

  it 'user is on a single results page and wants to go back to the home page to start again' do
    start_pairing
    create_pairing(name: 'A sweet food', sweet: 4)
    expect(page).to have_selector("input[type=submit]")
  end

end
