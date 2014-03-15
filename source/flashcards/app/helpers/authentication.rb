helpers do
  def authenticate!
    redirect to "/" if session[:user_id].nil?
  end
end
