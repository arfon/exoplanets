desc 'Bootstrap app'
task :bootstrap => :environment do
  10.times do
    u = User.create(:name => "User #{rand(1000000)}")
  end
  
  100.times do
    PlanetName.create(:user => User.first(:offset => (rand(10))), :name => "Awesome suggestion #{rand(10000000)}", :status => "active")
  end
  
  100.times do
    planet_name = PlanetName.find(rand(100)+1)
    voting_user = User.find_by_sql("SELECT  `users`.* FROM `users` where id != #{planet_name.user_id} order by RAND()").first
    Vote.create(:user => voting_user, :planet_name => planet_name)
  end
end