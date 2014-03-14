

module CardImporter
	def self.import
		File.open('db/migrate/spanish.txt', 'r').each do |line|
			question_answer = line.chomp.split("\t")
			# Card.create(question: question_answer[0], answer: question_answer[1])
			Card.create({question: question_answer[0], answer: question_answer[1]})
			# create(question: question_answer[0], answer: question_answer[1])
		end
	end
end

CardImporter.import
