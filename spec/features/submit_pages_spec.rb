require "rails_helper"

describe "submitting process" do

  it "allows only users to submit links" do
    visit "/sessions/new"
    User.create(:email => "katharinechen.ny@gmail.com", :password => "password")
    fill_in "Email", :with => "katharinechen.ny@gmail.com"
    fill_in "Password", :with => "password"
    click_button "Log In"
    visit "/links/new"
    page.should have_content "Create a new Link"
  end

  it "redirect non-users to the sign in page when they click the submit link" do
    visit "/links/new"
    page.should have_content "Log In"
  end
end
