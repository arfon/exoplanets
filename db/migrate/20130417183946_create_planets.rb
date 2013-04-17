class CreatePlanets < ActiveRecord::Migration
  def change
    create_table :planets do |t|
      t.column :host_name, :string
      t.column :planet_letter, :string
      t.column :discovery_method, :string
      t.column :orbital_period, :string
      t.column :planet_mass, :string
      t.column :planet_radius, :string
      t.column :ra, :string
      t.column :dec, :string
      t.column :hd_host_name, :string
      t.column :status, :string
      t.timestamps
    end
    
    add_index :planets, :status
  end
end
