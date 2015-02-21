class User < ActiveRecord::Base

  has_many :users_word
  has_many :words, :through => :users_word

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
