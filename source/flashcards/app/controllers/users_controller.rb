
enable :sessions


get '/users' do
  @users = User.all
  erb :"users/index"
end

get '/users/new' do
  erb :"users/new"
end

post '/users' do
  @user = User.new(params)
  if @user.save
    redirect to "/users/#{@user.id}"
  else
    erb :"users/new"
  end
end

get '/users/:id' do
  authenticate!
  @user = User.find_by(id: params[:id])
	erb :"users/show"
end


get '/users/:id/edit' do
  authenticate!

  @user = User.find_by(id: params[:id])
  erb :"users/edit"
end

put "/users/:id" do
  @user = User.find_by(id: params[:id])
  if @user.update(params[:user])
    redirect to("/users/#{@user.id}")
  else
    erb :"users/edit"
  end
end

delete "/users/:id" do
  User.destroy(params[:id])
  redirect to("/users")
end

