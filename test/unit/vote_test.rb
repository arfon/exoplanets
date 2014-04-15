require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  context "A Vote" do
    should belong_to :planet_name
    should belong_to :user
    
    context "when undergoing voting" do
      setup do
        @creating_user = FactoryGirl.create :user
        @planet = FactoryGirl.create :planet, :status => 'active'
        @planet_name = FactoryGirl.create :planet_name, :planet => @planet, :user => @creating_user
        @voting_user = FactoryGirl.create :user
        
      end
      
      should "not allow the creating user to vote on own suggestion" do
        @creating_user.vote_for(@planet_name)
        assert_equal 0, @planet_name.vote_count
      end
      
      should "allow the a user to vote" do
        @voting_user.vote_for(@planet_name)
        assert @voting_user.voter_for?(@planet_name)
        assert_equal 1, @planet_name.reload.vote_count
      end
      
      should "only the a user to vote once" do
        @voting_user.vote_for(@planet_name)
        assert @voting_user.voter_for?(@planet_name)
        assert_equal 1, @planet_name.reload.vote_count
        
        # This vote should fail
        @voting_user.vote_for(@planet_name)
        assert_equal 1, @planet_name.reload.vote_count
      end
    end
  end
end
