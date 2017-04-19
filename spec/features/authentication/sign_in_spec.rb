require 'rails_helper'

  # Feature: Sign in
  #   As a user
  #   I want to sign in
  #   So I can visit protected areas of the site
feature "Sign in", :devise do

  # Scenario: User cannot sign in if not registered
  #   Given I do not exist as a user
  #   When I sign in with valid credentials
  #   Then I see an invalid credentials message
  scenario 'user cannot sign in if not registered' do
    signin('test@example.com', 'plain')
    expect(page).to have_content 'Invalid Email or password.'
  end
  
  # Scenario: User can sign in with valid credentials
  #   Given I exist as a user
  #   And I am not signed in
  #   When I sign in with valid credentials
  #   Then I see a success message
  #   Then I have a role user
  scenario "user visits the site to sign in" do
    user = create :user
    signin(user.email, user.password)
    expect(page).to have_content("Signed in successfully.")
    expect(page.status_code).to eq 200 
    expect(user.role).to eq "user"
  end

  # Scenario: User can sign in with valid credentials
  #   Given I exist as a agent
  #   And I am not signed in
  #   When I sign in with valid credentials
  #   Then I see a success message
  #   Then I have a role user
  scenario "agent visits the site to sign in" do
    user = create :user, :agent
    signin(user.email, user.password)
    expect(page).to have_content("Signed in successfully.")
    expect(page.status_code).to eq 200
    expect(user.role).to eq "agent"
  end

  # Scenario: Admin can sign in with valid credentials
  #   Given I exist as a admin
  #   And I am not signed in
  #   When I sign in with valid credentials
  #   Then I see a success message
  #   Then I have a role admin
  scenario "admin visits the site to sign in" do
    user = create :user, :admin
    signin(user.email,user.password)
    expect(page).to have_content("Signed in successfully.")
    expect(page.status_code).to eq 200 
    expect(user.role).to eq "admin"
  end

  # Scenario: User cannot sign in with wrong email
  #   Given I exist as a user
  #   And I am not signed in
  #   When I sign in with a wrong email
  #   Then I see an invalid email message
  scenario 'user cannot sign in with wrong email' do
    user = create :user
    signin('invalid@example.com', user.password)
    expect(page).to have_content 'Invalid Email or password.'
  end

  # Scenario: User cannot sign in with wrong password
  #   Given I exist as a user
  #   And I am not signed in
  #   When I sign in with a wrong password
  #   Then I see an invalid password message
  scenario 'user cannot sign in with wrong password' do
    user = create :user
    signin(user.email, 'wrongpassword')
    expect(page).to have_content 'Invalid Email or password.'
  end
  
end