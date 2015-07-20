require 'spec_helper'

feature 'Starting a new game' do
  scenario 'I am asked to enter my name' do
    visit '/'
    click_link 'New Game'
    expect(page).to have_content "What's your name?"
  end

  scenario 'Entering your name' do
    visit '/new_game'
    fill_in 'name', with: 'Paul'
    click_on 'submit'
    expect(page).to have_content 'Hello Paul'
  end

  scenario 'Start game' do
    visit '/new_game'
    fill_in 'name', with: 'Paul'
    click_on 'submit'
    click_on 'Start Game'
    expect(page).to have_content 'What type of ship would you like?'
  end


end
