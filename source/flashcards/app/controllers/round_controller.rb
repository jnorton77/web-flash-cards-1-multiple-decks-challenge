enable :sessions

get '/decks' do
	authenticate!
	@decks = Deck.all
	erb :"decks/index"
end

get '/decks/:deck_name' do
	authenticate!
	session[:cards] = Deck.find_by(name: params[:deck_name]).cards.map(&:id).sample(5)
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
		session[:card] = session[:cards].pop
		Card.find(session[:card]).answer
end

post '/decks/count' do
	session[:cards].count.to_s
end
