class AddBasecampToProject < ActiveRecord::Migration
  def change
    add_column :projects, :basecamp, :string
  end
end
