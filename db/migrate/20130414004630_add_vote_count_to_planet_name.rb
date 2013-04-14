class AddVoteCountToPlanetName < ActiveRecord::Migration
  def change
    add_column :planet_names, :vote_count, :integer, :default => 0
  end
end