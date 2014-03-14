class CreateGuesses < ActiveRecord::Migration
  def change
  	create_table :guesses do |t|
  		t.binary :is_correct
  		t.integer :card_id
  		t.integer :round_id

  		t.timestamps
  	end
  end
end
