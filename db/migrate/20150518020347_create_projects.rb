class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :email
      t.text :issue
      t.string :sector
      t.text :input

      t.timestamps null: false
    end
  end
end
