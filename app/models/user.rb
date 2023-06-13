class User < ApplicationRecord
  attr_accessor :password
  before_save :encrypt_password

  validates :email, presence: true
  validates :password, presence: true, on: :create, confirmation: true
end
