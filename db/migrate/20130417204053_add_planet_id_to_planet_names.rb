class AddPlanetIdToPlanetNames < ActiveRecord::Migration
  def change
    add_column :planet_names, :planet_id, :integer
  end
end