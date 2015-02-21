class UsersWord < ActiveRecord::Base

   validates_uniqueness_of :user_id, scope: :word_id

  belongs_to :user
  belongs_to :word

end
