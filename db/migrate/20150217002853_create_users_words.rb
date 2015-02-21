class CreateUsersWords < ActiveRecord::Migration
  def change
    create_table :users_words do |t|
      t.belongs_to :user
      t.belongs_to :word
      t.timestamps
    end
  end
end
