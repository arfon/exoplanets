require 'test_helper'

class PlanetNameTest < ActiveSupport::TestCase
  test "a new planet" do
    planet = FactoryGirl.create :planet_name
    assert_equal 0, planet.vote_count
  end
end
