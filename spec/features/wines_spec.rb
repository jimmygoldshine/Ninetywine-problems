require 'rails_helper'

feature 'wines' do

  scenario 'view full wine database' do
    visit('/wines')
    expect(page).to have_content('Riesling')
  end

  scenario 'view sweeet wine selection' do
    visit('/wines')
    expect(page).not_to have_content('Gewurztraminer')
    expect(page).to have_content('Muscat')
  end
end
