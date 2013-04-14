class Vote < ActiveRecord::Base
  attr_accessible :user, :planet_name
  
  belongs_to :user
  belongs_to :planet_name
  
  before_create :check_voter
  after_create :increment_planet_vote_count
  
  def check_voter
    if self.user == self.planet_name.suggestor
      return false
    elsif self.user.voter_for?(self.planet_name)
      return false
    else
      return true
    end
  end
  
  def increment_planet_vote_count
    self.planet_name.increment_counter(:vote_count, 1)
  end
end
