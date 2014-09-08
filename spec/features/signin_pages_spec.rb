require "rails_helper"

describe "signin process" do

  it "sign in an user with the right password" do
    visit "/sessions/new"
    User.create(:email => "katharinechen.ny@gmail.com", :password => "password")
    fill_in "Email", :with => "katharinechen.ny@gmail.com"
    fill_in "Password", :with => "password"
    click_button "Log In"
    page.should have_content "Logged in!"
  end

  it "does not sign in an user with the wrong password" do
    visit "/sessions/new"
    User.create(:email => "katharinechen.ny@gmail.com", :password => "password")
    fill_in "Email", :with => "katharinechen.ny@gmail.com"
    fill_in "Password", :with => "12345"
    click_button "Log In"
    page.should have_content "Email or password is invalid"
  end
end

