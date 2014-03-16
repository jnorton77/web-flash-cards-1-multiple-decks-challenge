enable :sessions

get '/decks' do
	authenticate!
	@decks = Deck.all
	erb :"decks/index"
end

get '/decks/:deck_name' do
	authenticate!
	session[:cards] ||= Deck.find_by(name: params[:deck_name]).cards.map(&:id).sample(5)
	if session[:cards].empty?
		erb :results
	else
		session[:card] = session[:cards].pop
		erb :"decks/cards"
	end
end

post '/decks' do
	session[:correct] ||= 0
	session[:incorrect] ||= 0
		p params[:answer]

	if Card.find(session[:card]).answer == params[:answer]

		session[:correct] += 1
	else
		session[:incorrect] += 1
	end
	Card.find(session[:card]).answer
end

post '/decks/count' do
	session[:cards].count.to_s
end

get '/results' do
	erb :results
end
