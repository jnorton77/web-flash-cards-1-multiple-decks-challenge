get '/users' do
  # Look in app/views/index.erb
  # display a list of all posts
  @users = User.all
  erb :"index/users"
end

get '/users/:id' do
	# Show me a particular post
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
