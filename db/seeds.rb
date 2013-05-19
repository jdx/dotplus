la = City.where(subdomain: 'la', name: 'Los Angeles', time_zone: 'Pacific Time (US & Canada)').first_or_create!
City.where(subdomain: 'sf', name: 'San Francisco', time_zone: 'Pacific Time (US & Canada)').first_or_create!
City.where(subdomain: 'seattle', name: 'Seattle', time_zone: 'Pacific Time (US & Canada)').first_or_create!

dickeyxxx = User.where(twitter: 'dickeyxxx').first_or_create! do |u|
  u.name = "Jeff Dickey"
  u.email = 'jeff@dickey.xxx'
  u.avatar = "http://a0.twimg.com/profile_images/3677574460/88bd5392d8936c5c4dd76238c46602b7_normal.jpeg"
  u.bio = "ProductionBeast Engineer"
  u.location = "Santa Monica, California"
  u.url = "http://dickey.xxx"
  u.admin = true
end

ga_location = Location.where(name: 'General Assembly LA').first_or_create! do |location|
  location.city = la
  location.address = '1520 2nd Street, Santa Monica, California 90401'
  location.notes = "Park in the guest parking for 611 N. Brand. There are entrances on Brand, Doran, and Sanchez. GA will validate your parking."
end

ga = Sponsor.where(name: 'General Assembly').first_or_create!

if Event.count == 0
  event = la.events.build
  event.start = DateTime.now + 1.day
  event.end = DateTime.now + 1.day + 2.hours
  event.sponsor = ga
  event.location = ga_location
  event.organizer = dickeyxxx
  event.save!
end
