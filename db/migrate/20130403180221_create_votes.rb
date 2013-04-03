class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.column :user_id, :integer
      t.column :planet_name_id, :integer
      
      t.timestamps
    end
    
    add_index :votes, :user_id
    add_index :votes, :planet_name_id
  end
end
