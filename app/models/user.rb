class User < ActiveRecord::Base
  has_many :messages
  has_one :online_user
  validates :username, :presence => true, :uniqueness => true
end
