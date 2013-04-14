require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  context "A Vote" do
    should belong_to :planet_name
    should belong_to :user
  end
end
