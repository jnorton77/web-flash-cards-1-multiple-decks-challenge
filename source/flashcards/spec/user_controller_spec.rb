ENV['RACK_ENV'] = 'test'

require "spec_helper"
require 'rspec'
require 'rack/test'

describe 'The Flashcard App' do
  include Rack::Test::Methods

  # def app
  #   Sinatra::Application
  # end

  class User
  	def self.all

  	end
  end

  it "renders the user index view" do
    user = double("user", name: "kori")
    User.stub(:all).and_return([user])
    get "/users"
    expect(last_response).to be_ok
    expect(last_response.body).to include('kori')
  end
end



