class Deck < ActiveRecord::Base
	has_many :rounds, :cards
  # Remember to create a migration!
end
