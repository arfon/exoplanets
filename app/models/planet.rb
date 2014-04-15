class Planet < ActiveRecord::Base
  has_many :planet_names
  
  scope :for_naming, where(:status => 'active')
  
  validates_presence_of :host_name, :planet_letter, :discovery_method, :orbital_period, :ra, :dec
  
  state_machine :status, :initial => :inactive do
    event :activate do
      transition :inactive => :active
    end
  end
end
