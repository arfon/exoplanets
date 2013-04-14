require 'test_helper'

class PlanetNameTest < ActiveSupport::TestCase
  context "A Planet Name" do
    setup do
      @planet = FactoryGirl.create :planet_name
    end
    
    should "not have any votes when created" do
      assert_equal 0, @planet.vote_count
    end
    
    should "have a state of #active" do
      assert_equal 'active', @planet.status
    end
  end
  
  context "A Planet Name" do
    setup do
      @user = FactoryGirl.create :user
      @planet = FactoryGirl.create :planet_name, :user => @user
    end
    
    should "belong to the correct User" do
      assert_equal @user, @planet.user
    end
    
    should "have correct #suggestor" do
      assert_equal @user, @planet.suggestor
    end
  end
  
  context "A Planet Name" do
    setup do
      @planet = FactoryGirl.build :planet_name, :name => nil, :user => nil
      @planet.save
    end
    
    should "require #name to be set" do
      assert @planet.errors[:name].any?
    end
    
    should "require #user to be set" do
      assert @planet.errors[:user_id].any?
    end
  end
end
