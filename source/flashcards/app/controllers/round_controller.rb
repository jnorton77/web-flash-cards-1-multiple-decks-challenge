enable :sessions

get '/decks' do
	@decks = Deck.all
	erb :"decks/index"
end

get '/decks/:deck_name' do
	session[:cards] = Deck.find_by(name: params[:deck_name]).cards.map(&:id)
	session[:card] = session[:cards].pop
	p session[:card]
	erb :"decks/cards"
end

post '/decks' do
session[:correct] ||= 0
session[:incorrect] ||= 0

	if Card.find(session[:card]).answer == params[:answer]
		session[:correct] += 1
	else
		session[:incorrect] += 1
	end

	if session[:cards].empty?
		erb :"results"
	else
		session[:card] = session[:cards].pop
		erb :"decks/cards"
	end
end
