require 'csv'

module SpanishImporter
	def self.import
		deck = Deck.create(name: 'spanish')
		File.open('db/spanish.txt', 'r').each do |line|
			question_answer = line.chomp.split("\t")
			Card.create(question: question_answer[0], answer: question_answer[1], deck: deck)
		end
	end
end

module StatesImporter
	def self.import
		deck = Deck.create(name: 'states')
		CSV.foreach('db/states.csv', headers: true, header_converters: :symbol) do |row|
			Card.create(question: row[:name], answer: row[:capital], deck: deck)
		end
	end
end

StatesImporter.import
SpanishImporter.import

# SpanishImporter.import
# deck = Deck.create(name: 'spanish')

# Card.all.each { |card| card.update(deck: deck) }

# def randomize_decks
# 	Card.all.each do |card|
# 		Deck.all.sample.cards << card
# 	end
# end


