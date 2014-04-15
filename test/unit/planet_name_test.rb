require 'test_helper'

class PlanetNameTest < ActiveSupport::TestCase
  context "A Planet Name" do
    should have_many :votes
    should have_many(:voters).through(:votes)
    should belong_to :user
    should belong_to :planet
    
  end

  context "A Planet Name" do
    setup do
      @planet_name = FactoryGirl.create :planet_name
    end
    
    should "not have any votes when created" do
      assert_equal 0, @planet_name.vote_count
    end
    
    should "have a state of #active" do
      assert_equal 'active', @planet_name.status
    end
  end
  
  context "A Planet Name" do
    setup do
      @user = FactoryGirl.create :user
      @planet_name = FactoryGirl.create :planet_name, :user => @user
    end
    
    should "belong to the correct User" do
      assert_equal @user, @planet_name.user
    end
    
    should "have correct #suggestor" do
      assert_equal @user, @planet_name.suggestor
    end
  end
  
  context "A Planet Name" do
    setup do
      @planet_name = FactoryGirl.build :planet_name, :name => nil, :user => nil
      @planet_name.save
    end
    
    should "require #name to be set" do
      assert @planet_name.errors[:name].any?
    end
    
    should "require #user to be set" do
      assert @planet_name.errors[:user_id].any?
    end
  end
end
