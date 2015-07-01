class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
       t.string :tag_line
       t.integer :user_id
       t.integer :album_id
       # t.integer :user_id 
      t.timestamps null: false
    end
    # add_reference :users, foreign_key: true
    # add_reference :album,foreign_key: true
    add_attachment :images, :avatar
  end
end
