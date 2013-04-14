class PlanetName < ActiveRecord::Base
  # FIXME - status should be set by state machine
  # TODO - add counter cache fields for votes
  
  attr_accessible :name, :explanation, :user
  validates_presence_of :name, :user_id
  
  has_many :votes
  has_many :voters, :through => :votes, :source => :user
  
  belongs_to :user
  
  def suggestor
    user
  end
  
  def self.trending
    limit(10).order('vote_count DESC')
  end
  
  state_machine :status, :initial => :active do
    # event :reject do
    #   transition :active => :rejected
    # end
  end
end
