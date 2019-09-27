class CreateMemberUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :member_users do |t|
      t.integer :user_id
      t.string :image
      t.string :name
      t.string :gender
      t.string :prefectures
      t.string :part
      t.string :genre
      t.string :artist
      t.string :url
      t.string :description
      t.timestamps
    end
  end
end
