require 'json'
enable :sessions

get '/decks' do
	authenticate!
	@decks = Deck.all
	erb :"decks/index"
end

get '/decks/:deck_name' do
	session[:total_correct] = 0
	session[:total_incorrect] = 0
	session[:cards] = Deck.find_by(name: params[:deck_name]).cards.map(&:id).sample(5)
	erb :"decks/cards"
end

post '/decks/:deck_name' do
	# authenticate!
	content_type :json
	session[:total_correct] += 1 if params[:correct] ==  "true"
	session[:total_incorrect] += 1 if params[:correct] == "false"

	if session[:cards].empty?
		{endgame: true}.to_json
	else
		session[:card] = session[:cards].pop
		{ question: Card.find(session[:card]).question,
			answer: Card.find(session[:card]).answer,
			endgame: false
		}.to_json
	end
end

get '/results' do
	erb :results
end


