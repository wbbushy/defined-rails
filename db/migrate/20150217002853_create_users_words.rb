class CreateUsersWords < ActiveRecord::Migration
  def change
    create_table :users_words do |t|
      t.timestamps
    end
  end
end
