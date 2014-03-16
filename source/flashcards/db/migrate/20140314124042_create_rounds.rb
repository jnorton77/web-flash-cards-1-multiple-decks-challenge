class CreateRounds < ActiveRecord::Migration
  def change
  	create_table :rounds do |t|
  		t.integer :user_id
  		t.integer :deck_id
  		# t.integer :correct
  		# t.integer :incorrect

  		t.timestamps
  	end
  end
end

# Should we just store "results" in new correct and incorrect rows?
