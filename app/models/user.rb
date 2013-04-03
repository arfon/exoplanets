class User < ActiveRecord::Base
  attr_accessible :name
  
  has_many :votes
  
  def suggestor_for?(planet)
    planet.suggestor == self
  end
  
  def voter_for?(planet)
    Vote.where(:user_id => self.id, :planet_name_id => planet.id).exists?
  end
end
