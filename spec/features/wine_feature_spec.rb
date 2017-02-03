require 'rails_helper'

describe 'wine features' do

  scenario 'users clicks through to wine info from wine recommendations' do
    visit '/'
    click_button 'Start pairing!'
    fill_in :food_name, with: "A sweet food"
    fill_in :food_sweet, with: 4
    fill_in :food_umami, with: 0
    fill_in :food_spicy, with: 0
    fill_in :food_sour, with: 0
    fill_in :food_bitter, with: 0
    click_button "Submit"
    save_and_open_page
    expect(page).to have_link('Sauternes')
    click_link('Sauternes')
    expect(page).to have_content 'Sauternes'
    expect(page).to have_content 'Alcohol'
  end

end
