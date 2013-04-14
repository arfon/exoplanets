require 'test_helper'

class UserTest < ActiveSupport::TestCase
  context "A User" do
    should have_many :votes

  end
end
