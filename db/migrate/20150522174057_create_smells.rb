class CreateSmells < ActiveRecord::Migration
  def change
    create_table :smells do |t|
      t.string :content
      t.float :lat
      t.float :lng
      t.belongs_to :user

      t.timestamps null: false
    end
    add_foreign_key :users
  end
end
