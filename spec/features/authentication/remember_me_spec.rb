require 'rails_helper'

# Feature: Sign in
#   As a user
#   I want to sign in
#   So I can visit protected areas of the site
feature "Rememberable sign in", :devise do
  let(:user) {FactoryGirl.create(:user)}

  # Scenario: User can sign in with valid credentials
  #   Given I exist as a user
  #   And I am not signed in
  #   When I sign in with valid credentials
  #   Then I see a success message
  #   Then I am not rememberable
  scenario "user visits the site to sign in and is not rememberable" do
    visit root_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password, :match => :prefer_exact
    click_button 'Log in'
    expect(page).to have_content("Signed in successfully.")
    expect(page.status_code).to eq 200 
    user.reload 
    expect(user.remember_created_at).to be_falsy
  end

  # Scenario: User can sign in with valid credentials
  #   Given I exist as a user
  #   And I am not signed in
  #   When I sign in with valid credentials
  #   Then I see a success message
  #   Then I am rememberable
  scenario "user visits the site to sign in and is rememberable" do
    visit root_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password, :match => :prefer_exact
    check 'Remember me'
    click_button 'Log in'
    expect(page).to have_content("Signed in successfully.")
    expect(page.status_code).to eq 200
    user.reload 
    expect(user.remember_created_at).to be_truthy
  end

end