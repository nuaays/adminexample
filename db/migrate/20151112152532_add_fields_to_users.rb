class AddFieldsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :posts, :boolean, default: false
  	add_column :users, :projects, :boolean, default: false

  end
end
