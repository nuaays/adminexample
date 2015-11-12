class AddShortlinkToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :shortlink, :string
  end
end
