require 'spec_helper'

feature 'charity signs in' do 
  # ACCEPTANCE CRITERIA
  # * I click on Charity from the home page
  # * I click on sign in
  # * I have a valid email
  # * I have a password
  # * I get redirected to my charity home page

  let(:charity) { FactoryGirl.create(:charity) }

  scenario 'charity signs in with valid attributes' do 
    visit root_path
    click_link 'Charity'
    fill_in 'Email', with: charity.email
    fill_in 'Password', with: charity.password
    click_button 'Charity Sign In'

    expect(page).to have_content(charity.name)
    expect(page).to have_content('Successfully signed in')
  end

  scenario 'charity attempts to sign in with invalid attributes' do 
    visit root_path
    click_link 'Charity'
    click_button 'Charity Sign In'

    expect(page).to have_content("Invalid email or password")
  end
end