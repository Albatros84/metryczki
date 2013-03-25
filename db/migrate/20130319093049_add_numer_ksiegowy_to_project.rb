class AddNumerKsiegowyToProject < ActiveRecord::Migration
  def change
    add_column :projects, :numer_ks, :string
  end
end
