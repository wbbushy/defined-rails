class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.belongs_to :user
      t.string :spelling
      t.string :definition
      t.timestamps
    end
  end
end
