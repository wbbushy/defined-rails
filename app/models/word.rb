class Word < ActiveRecord::Base

  validates :spelling, uniqueness: true

  belongs_to :users

end
