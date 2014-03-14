class Guess < ActiveRecord::Base
	belongs_to :card, :round
  # Remember to create a migration!
end
