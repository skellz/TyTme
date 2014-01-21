require 'spec_helper'

feature 'user signs in' do 
  # ACCEPTANCE CRITERIA
  # * I click on user from the home page
  # * I click on sign in
  # * I have a valid email
  # * I have a password
  # * I get redirected to my user home page

  let(:user) { FactoryGirl.create(:user) }

  scenario 'user signs in with valid attributes' do 
    visit root_path
    click_link 'User'
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'user attempts to sign in with invalid attributes' do 
    visit root_path
    click_link 'User'
    click_link 'Sign In'
    click_button 'Sign In'

    expect(page).to_not have_content("Sign Out")
    expect(page).to_not have_content("Signed in successfully.")
  end
end