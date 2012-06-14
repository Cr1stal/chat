class User < ActiveRecord::Base
  has_many :messages
  validates :username, :presence => true, :uniqueness => true
end
