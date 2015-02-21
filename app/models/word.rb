class Word < ActiveRecord::Base


  has_many :users_word
  has_many :users, :through => :users_word

end
