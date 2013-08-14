class User < ActiveRecord::Base
  attr_accessible :birth_date, :email, :father_name, :first_name, :last_name, :login, :password

  validates :email, :login, :password, presence: true
  validates :login, uniqueness: true
  validates :login,	:length => {minimum: 5, maximum: 32}
  validates :email, :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
end
