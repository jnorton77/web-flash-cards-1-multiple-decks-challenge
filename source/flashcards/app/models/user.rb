class User < ActiveRecord::Base
	has_many :rounds
  validates :name, uniqueness: true

  def self.authenticate(name, password)
    user = User.find_by_name(name)
    user != nil && user.password == password
  end
end