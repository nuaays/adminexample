class AddAlbumToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :album, :string
  end
end
