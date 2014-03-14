get '/users' do 
  @users = User.all
  erb :"users/index"
end

get '/users/:id' do
  @user = User.find_by(params[:id])
	erb :"users/show"
end

# post '/posts' do
# 	# create a new post
# 	erb :"posts/new"
# end

# get '/posts/:id/edit' do
# 	# edit an existing post - generates the HTML
# 	erb :"posts/edit"
# end

# put '/posts/:id' do
# 	# updates the post after editing

# end

# delete '/posts/:id' do
# 	# delete an existing post

# end
