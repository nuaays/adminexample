class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.string :image
      t.text :news
      t.string :source

      t.timestamps null: false
    end
  end
end
