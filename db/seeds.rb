katharinechen = User.create(email: "katharinechen.ny@gmail.com", password: "1234")
bobmiller = User.create(email: "bobmiller@gmail.com", password: "45678")
susanburt = User.create(email: "susanburt@gmail.com", password: "123456")
robertmark = User.create(email: "mrrobertmark@gmail.com", password: "susan")
bobdylan = User.create(email: "bobbied@gmail.com", password: "dylanmanic")

link1 = Link.create(url: "http://www.theonion.com/articles/biden-gets-grow-light-delivered-to-white-house-und,36597/", user_id: "1")
link2 = Link.create(url: "http://www.theonion.com/articles/concert-security-drastically-overestimating-fans-d,36900/", user_id: "4")
link3 = Link.create(url: "http://www.theonion.com/articles/college-football-player-first-in-family-to-meet-nc,36841/", user_id: "2")
link4 = Link.create(url: "http://www.theonion.com/articles/vikings-intrigued-by-matt-cassels-ability-to-get-t,36807/", user_id: "1")
link5 = Link.create(url: "http://www.theonion.com/articles/nasa-administrator-resigns-after-leak-of-offensive,36992/", user_id: "5")
link6 = Link.create(url: "http://www.theonion.com/articles/concert-security-drastically-overestimating-fans-d,36900/", user_id: "1")
link7 = Link.create(url: "http://www.theonion.com/articles/mars-maven-begins-mission-to-take-thousands-of-hig,36987/", user_id: "3")
link8 = Link.create(url: "http://www.theonion.com/articles/heineken-reminds-nfl-executives-they-would-be-pret,37029/", user_id: "5")

#This is to randomize the created_at for all of the links created in the seed.rb file 
Link.all.each do |link|
  link.update_attribute :created_at, (rand*10).days.ago
end

comment1 = Comment.create(user_id: "1", link_id: "1", text: "Comment 1", commentable_id: "1", commentable_type: "0")
comment2 = Comment.create(user_id: "2", link_id:  "1", text: "Comment 2", commentable_id: "1", commentable_type: "0")