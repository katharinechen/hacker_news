require 'rails_helper'

describe "users can only vote once for links they did not create" do

  before(:each) do
    visit '/sessions/new'
    @user1 = User.create(email: "katharinechen.ny@gmail.com", password: "password")
    @user2 = User.create(email: "bobmiller@gmail.com", password: "45678")
    @link1 = Link.create(url: "http://www.theonion.com/articles/concert-security-drastically-overestimating-fans-d,36900/", user_id: @user1.id)
    @link2 = Link.create(url: "http://www.theonion.com/articles/college-football-player-first-in-family-to-meet-nc,36841/", user_id: @user2.id)
    @link3 = Link.create(url: "http://www.theonion.com/articles/vikings-intrigued-by-matt-cassels-ability-to-get-t,36807/", user_id: @user1.id)

    fill_in "Email", :with => "katharinechen.ny@gmail.com"
    fill_in "Password", :with => "password"

    click_button "Log In"
    visit '/'
  end

  it "allow a user to vote for a link the user did not create nor already voted for" do
    click_on("button-#{@link2.id}")
    expect(page).to have_content("Thank you for submitting a vote.")
  end

  it "show an error messenge if a user to vote for a link the user created" do
    click_on("button-#{@link1.id}")
    expect(page).to have_content("Your vote has not been submitted.")
  end

  it "show an error message if a user voted for a link he/she already voted for" do
    click_on("button-#{@link2.id}")
    click_on("button-#{@link2.id}")
    expect(page).to have_content("Your vote has not been submitted.")
  end

end














