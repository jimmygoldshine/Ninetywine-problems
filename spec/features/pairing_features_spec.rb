require 'rails_helper'

feature 'pairng with instances of food' do

  scenario 'create a new empty pairing' do
    visit('/pairings/new')
    expect{ click_button('Submit') }.to change{Pairing.count}.by 1
  end

  scenario 'a food form can be filled in' do
    visit('/pairings/new')
    click_button('Submit')
    expect(page).to have_content("Enter your food and it's characteristics")
    expect(page).to have_css("input#food_name")
    expect(page).to have_css("input#food_sweet")
    expect(page).to have_button("Submit")
  end

  scenario 'returns a list of wines for spicy food' do
    visit('/pairings/new')
    click_button('Submit')
    fill_in 'Name', with: 'Spicy'
    fill_in 'Spicy', with: 5
    fill_in'Sweet', with: 0
    fill_in'Sour', with: 0
    fill_in'Bitter', with: 0
    fill_in'Umami', with: 0
    click_button('Submit')
    expect(page).to have_content("Zinfandel")
  end

  scenario 'returns a list of wines for sweet food' do
    visit('/pairings/new')
    click_button('Submit')
    fill_in 'Name', with: 'Sweet'
    fill_in 'Spicy', with: 0
    fill_in'Sweet', with: 5
    fill_in'Sour', with: 0
    fill_in'Bitter', with: 0
    fill_in'Umami', with: 0
    click_button('Submit')
    expect(page).to have_content("Riesling")
  end

  scenario 'returns a list of wines for bitter food' do
    visit('/pairings/new')
    click_button('Submit')
    fill_in 'Name', with: 'Bitter'
    fill_in 'Spicy', with: 0
    fill_in'Sweet', with: 0
    fill_in'Sour', with: 0
    fill_in'Bitter', with: 5
    fill_in'Umami', with: 0
    click_button('Submit')
    expect(page).to have_content("Pinot Noir")
  end

  scenario 'returns a list of wines for sour food' do
    visit('/pairings/new')
    click_button('Submit')
    fill_in 'Name', with: 'Sour'
    fill_in 'Spicy', with: 0
    fill_in'Sweet', with: 0
    fill_in'Sour', with: 5
    fill_in'Bitter', with: 0
    fill_in'Umami', with: 0
    click_button('Submit')
    expect(page).to have_content("Grenache")
  end

  scenario 'returns a list of wines for umami food' do
    visit('/pairings/new')
    click_button('Submit')
    fill_in 'Name', with: 'Umami'
    fill_in 'Spicy', with: 0
    fill_in'Sweet', with: 0
    fill_in'Sour', with: 0
    fill_in'Bitter', with: 0
    fill_in'Umami', with: 5
    click_button('Submit')
    expect(page).to have_content("Sauvignon Blanc")
  end

  scenario 'returns a list of wines for umami and sweet food' do
    visit('/pairings/new')
    click_button('Submit')
    fill_in 'Name', with: 'Umami'
    fill_in 'Spicy', with: 0
    fill_in'Sweet', with: 3
    fill_in'Sour', with: 0
    fill_in'Bitter', with: 0
    fill_in'Umami', with: 3
    click_button('Submit')
    expect(page).to have_content("Pinotage")
  end

  scenario 'returns a list of wines for umami and sour food' do
    visit('/pairings/new')
    click_button('Submit')
    fill_in 'Name', with: 'Umami'
    fill_in 'Spicy', with: 0
    fill_in'Sweet', with: 0
    fill_in'Sour', with: 3
    fill_in'Bitter', with: 0
    fill_in'Umami', with: 3
    click_button('Submit')
    expect(page).to have_content("Cava")
  end

  scenario 'returns a list of wines for umami and bitter food' do
    visit('/pairings/new')
    click_button('Submit')
    fill_in 'Name', with: 'Umami'
    fill_in 'Spicy', with: 0
    fill_in'Sweet', with: 0
    fill_in'Sour', with: 0
    fill_in'Bitter', with: 3
    fill_in'Umami', with: 3
    click_button('Submit')
    expect(page).to have_content("Gamay")
  end

  scenario 'returns a list of wines for sweet and sour food' do
    visit('/pairings/new')
    click_button('Submit')
    fill_in 'Name', with: 'Umami'
    fill_in 'Spicy', with: 0
    fill_in'Sweet', with: 3
    fill_in'Sour', with: 3
    fill_in'Bitter', with: 0
    fill_in'Umami', with: 0
    click_button('Submit')
    expect(page).to have_content("Zinfandel")
  end

  scenario 'returns a list of wines for sweet and bitter food' do
    visit('/pairings/new')
    click_button('Submit')
    fill_in 'Name', with: 'Umami'
    fill_in 'Spicy', with: 0
    fill_in'Sweet', with: 3
    fill_in'Sour', with: 0
    fill_in'Bitter', with: 3
    fill_in'Umami', with: 0
    click_button('Submit')
    expect(page).to have_content("Beaujolias")
  end

  scenario 'returns a list of wines for sweet and spicy food' do
    visit('/pairings/new')
    click_button('Submit')
    fill_in 'Name', with: 'Umami'
    fill_in 'Spicy', with: 3
    fill_in'Sweet', with: 3
    fill_in'Sour', with: 0
    fill_in'Bitter', with: 0
    fill_in'Umami', with: 0
    click_button('Submit')
    expect(page).to have_content("Zinfandel")
  end

  scenario 'returns a list of wines for sour and bitter food' do
    visit('/pairings/new')
    click_button('Submit')
    fill_in 'Name', with: 'Umami'
    fill_in 'Spicy', with: 0
    fill_in'Sweet', with: 0
    fill_in'Sour', with: 3
    fill_in'Bitter', with: 3
    fill_in'Umami', with: 0
    click_button('Submit')
    expect(page).to have_content("Lambrusco")
  end

  scenario 'returns a list of wines for sour and spicy food' do
    visit('/pairings/new')
    click_button('Submit')
    fill_in 'Name', with: 'Umami'
    fill_in 'Spicy', with: 3
    fill_in'Sweet', with: 0
    fill_in'Sour', with: 3
    fill_in'Bitter', with: 0
    fill_in'Umami', with: 0
    click_button('Submit')
    expect(page).to have_content("Lambrusco")
  end

end
