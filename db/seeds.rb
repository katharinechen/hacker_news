katharinechen = User.create(email: "katharinechen.ny@gmail.com", password: "1234")
bobmiller = User.create(email: "bobmiller@gmail.com", password: "45678")

link1 = Link.create(url: "http://www.theonion.com/articles/biden-gets-grow-light-delivered-to-white-house-und,36597/", user_id: "1")

link2 = Link.create(url: "http://www.theonion.com/articles/concert-security-drastically-overestimating-fans-d,36900/", user_id: "2")
link3 = Link.create(url: "http://www.theonion.com/articles/college-football-player-first-in-family-to-meet-nc,36841/", user_id: "2")
link4 = Link.create(url: "http://www.theonion.com/articles/vikings-intrigued-by-matt-cassels-ability-to-get-t,36807/", user_id: "1")

Link.all.each do |link|
  link.update_attribute :created_at, (rand*10).days.ago
end
