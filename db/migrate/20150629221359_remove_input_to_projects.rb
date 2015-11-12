class RemoveInputToProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :input, :text
  end
end
