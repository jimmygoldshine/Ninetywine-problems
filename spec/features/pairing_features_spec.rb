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
    click_button "Submit"
    expect(page).to have_link 'Start pairing again!'

  end

  it 'returns a list of wines for spicy food' do
    start_pairing
    create_pairing(name: 'A spicy food', spicy: 5)
    click_button('Submit')
    expect(page).to have_content("Zinfandel")
  end

  it 'returns a list of wines for sweet food' do
    start_pairing
    create_pairing(name: 'A sweet food', sweet: 5)
    click_button('Submit')
    expect(page).to have_content("Gewurztraminer")
  end

  it 'returns a list of wines for bitter food' do
    start_pairing
    create_pairing(name: 'A bitter food', bitter: 5)
    click_button('Submit')
    expect(page).to have_content("Pinot Noir")
  end

  it 'returns a list of wines for sour food' do
    start_pairing
    create_pairing(name: 'A sour food', sour: 5)
    click_button('Submit')
    expect(page).to have_content("Grenache")
  end

  it 'returns a list of wines for umami food' do
    start_pairing
    create_pairing(name: 'An umami food', umami: 5)
    click_button('Submit')
    expect(page).to have_content("Auslese")
  end

  it 'returns a list of wines for umami and sweet food' do
    start_pairing
    create_pairing(name: 'An umami and sweet food', umami: 3, sweet: 3)
    click_button('Submit')
    expect(page).to have_content("Muscat")
  end

  it 'returns a list of wines for umami and sour food' do
    start_pairing
    create_pairing(name: 'An umami and sour food', umami: 3, sour: 3)
    click_button('Submit')
    expect(page).to have_content("Sauternes")
  end

  it 'returns a list of wines for umami and bitter food' do
    start_pairing
    create_pairing(name: 'An umami and bitter food', umami: 3, bitter: 3)
    click_button('Submit')
    expect(page).to have_content("Muscat")
  end

  it 'returns a list of wines for sweet and sour food' do
    start_pairing
    create_pairing(name: 'A sweet and sour food', sweet: 3, sour: 3)
    click_button('Submit')
    expect(page).to have_content("Gewurztraminer")
  end

  it 'returns a list of wines for sweet and bitter food' do
    start_pairing
    create_pairing(name: 'A sweet and bitter food', sweet: 3, bitter: 3)
    click_button('Submit')
    expect(page).to have_content("Sauternes")
  end

  it 'returns a list of wines for sweet and spicy food' do
    start_pairing
    create_pairing(name: 'A sweet and spicy food', sweet: 3, spicy: 3)
    click_button('Submit')
    expect(page).to have_content("Muscat")
  end

  it 'returns a list of wines for sour and bitter food' do
    start_pairing
    create_pairing(name: 'A sour and bitter food', sour: 3, bitter: 3)
    click_button('Submit')
    expect(page).to have_content("Gewurztraminer")
  end

  it 'returns a list of wines for sour and spicy food' do
    start_pairing
    create_pairing(name: 'A sour and spicy food', sour: 3, spicy: 3)
    click_button('Submit')
    expect(page).to have_content("Gewurztraminer")
  end
end
