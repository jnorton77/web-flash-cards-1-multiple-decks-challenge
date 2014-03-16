

require 'csv'

module SpanishImporter
	def self.import
		count = 1
		deck = Deck.create(name: 'spanish')
		File.open('db/spanish.txt', 'r').each do |line|
			question_answer = line.chomp.split("\t")
			Card.create(question: question_answer[0], answer: question_answer[1], deck: deck)
			count += 1
			break if count > 10
		end
	end
end

module StatesImporter
	def self.import
		deck = Deck.create(name: 'states')
		# count = 1
		CSV.foreach('db/states.csv', headers: true, header_converters: :symbol) do |row|
			Card.create(question: row[:name], answer: row[:capital], deck: deck)
			# count += 1
			# break if count >
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


