get '/posts' do
  # Look in app/views/index.erb
  # display a list of all posts
  erb :index, locals: { posts: Post.all }
end

get '/posts/:id' do
	# Show me a particular post
	erb :"posts/show"
end

post '/posts' do
	# create a new post
	erb :"posts/new"
end

get '/posts/:id/edit' do
	# edit an existing post - generates the HTML
	erb :"posts/edit"
end

put '/posts/:id' do
	# updates the post after editing

end

delete '/posts/:id' do
	# delete an existing post

end
