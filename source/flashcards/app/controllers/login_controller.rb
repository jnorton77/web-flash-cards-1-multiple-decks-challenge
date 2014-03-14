get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/' do
  if User.authenticate(params[:name], params[:password])
    session[:user_id] = User.find_by_name(params[:name]).id
    redirect to :"users/#{session[:user_id]}" 
  else
    erb :index
  end
end
  

