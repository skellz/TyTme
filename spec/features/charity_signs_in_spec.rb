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
    click_link 'Charitable Orginizations'
    click_link 'Sign In'
    fill_in 'Email', with: charity.email
    fill_in 'Password', with: charity.password
    click_button 'Sign In'

    #expect(page).to have_content(charity.name)
    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'charity attempts to sign in with invalid attributes' do 
    visit root_path
    click_link 'Charitable Orginizations'
    click_link 'Sign In'
    click_button 'Sign In'

    expect(page).to_not have_content("Sign Out")
    expect(page).to_not have_content("Signed in successfully")
  end
end