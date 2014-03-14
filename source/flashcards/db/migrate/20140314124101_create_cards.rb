class CreateCards < ActiveRecord::Migration
  def change
  	create_table :cards do |t|
  		t.integer :deck_id, default: 0
  		t.text :question
  		t.text :answer

  		t.timestamps
  	end
  end
end
