get '/users' do 
  @users = User.all
  erb :"index/users"
end

get '/users/:id' do
  @user = User.find_by(params[:id])
	erb :"users/show"
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

get '/users/:id/edit' do
  @user = User.find_by(params[:id])
  erb :"users/edit"
end

put "/users/:id" do
  @user = User.find_by(params[:id])
  if @user.update(params)
    redirect to("/users/#{@user.id}")
  else
    erb :"user/edit"
  end
end

# # List all Posts (index)
# get "/posts" do
#   @posts = Post.all
#   erb 'posts/index'
# end

# # Show a single post (show)
# get "/posts/:id" do
#   @post = Post.find(params[:id])
#   erb "posts/show"
# end

# # Show the form to create a new post (new)
# get "/posts/new" do
#   erb "posts/new"
# end

# # Create a new post (create)
# post "/posts" do
#   @post = Post.new(params)
#   if @post.save
#     redirect to("/posts/#{@post.id}")
#   else
#     erb "posts/new"
#   end
# end

# # Show the form to edit a post (edit)
# get "/posts/:id/edit" do
#   @post = Post.find(params[:id])
#   erb "posts/edit"
# end

# # Update an existing post (update)
# put "/posts/:id" do
#   @post = Post.find(params[:id])
#   if @post.update(params)
#     redirect to("/posts/#{@post.id}")
#   else
#     erb "post/edit"
#   end
# end

# foobar "/posts" do

# end

# # Delete an existing post (delete)
# delete "/posts/:id" do
#   Post.destroy(params[:id])

#   redirect to("/posts")
# end