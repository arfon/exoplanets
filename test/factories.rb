require 'factory_girl'

FactoryGirl.define do
  sequence :name do |n|
    n
  end
  
  factory :planet_name do |p|
    p.name   { |planet| planet.name = "Planet #{ FactoryGirl.generate(:name) }" }
    p.explanation   "A very good reason"
  end
end