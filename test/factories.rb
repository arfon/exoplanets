require 'factory_girl'

FactoryGirl.define do
  sequence :name do |n|
    n
  end
  
  factory :user do |u|
    u.name  { |user| user.name = "User #{ FactoryGirl.generate(:name) }" }
  end
  
  factory :planet do |p|
    p.host_name         { |host| host.host_name = "Planet #{ FactoryGirl.generate(:name) }" }
    p.planet_letter     "B"
    p.discovery_method  "Your mum"
    p.orbital_period    "6 days"
    p.ra                "12.5"
    p.dec               "-3.5"
  end
  
  factory :planet_name do |p|
    p.name   { |planet| planet.name = "Planet #{ FactoryGirl.generate(:name) }" }
    p.explanation   "A very good reason"
    planet
    user
  end
end