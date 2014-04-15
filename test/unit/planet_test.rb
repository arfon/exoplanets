require 'test_helper'

class PlanetTest < ActiveSupport::TestCase
  context "A Planet" do
    should have_many :planet_names
    
    context "when newly created" do
      setup do
        @planet = FactoryGirl.create :planet
      end

      should "have a state of #active" do
        assert_equal 'inactive', @planet.status
      end
    end

  end
end
