class Round < ActiveRecord::Base
	belongs_to :deck, :user
	has_many :guesses
  # Remember to create a migration!
end
