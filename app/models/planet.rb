class Planet < ActiveRecord::Base
  has_many :planet_names
  
  scope :for_naming, where(:status => 'active')
  
  state_machine :status, :initial => :inactive do
    event :activate do
      transition :inactive => :active
    end
  end
end
