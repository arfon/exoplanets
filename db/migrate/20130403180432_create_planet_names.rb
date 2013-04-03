class CreatePlanetNames < ActiveRecord::Migration
  def change
    create_table :planet_names do |t|
      t.column :name, :string
      t.column :explanation, :text
      t.column :status, :string
      t.column :user_id, :integer
      
      t.timestamps
    end
    
    add_index :planet_names, :status
    add_index :planet_names, :user_id
  end
end
