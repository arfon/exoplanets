class User < ActiveRecord::Base
  # attr_accessible :name, :provider, :uid
  serialize :extra
  
  has_many :votes
  
  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end
  
  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["nickname"]
      user.picture = auth["info"]["image"]
      user.oauth_token = auth["credentials"]["token"]
      user.oauth_expires_at = Time.at(auth["credentials"]["expires_at"]) if auth["provider"] == "facebook"
      user.extra = auth
    end
  end
  
  def suggestor_for?(planet_name)
    planet_name.suggestor == self
  end
  
  def voter_for?(planet_name)
    Vote.where(:user_id => self.id, :planet_name_id => planet_name.id).exists?
  end
  
  def vote_for(planet_name)
    Vote.create(:user => self, :planet_name => planet_name) unless planet_name.suggestor == self
  end
end
