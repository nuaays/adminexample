class AddImagephoneToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :image, :string
    add_column :projects, :phone, :string
  end
end
