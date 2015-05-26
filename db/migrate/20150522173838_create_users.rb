class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :twitter_handle
      t.string :twitter_id
      t.string :name

      t.timestamps null: false
    end
  end
end
