class RemoveProjectIdFromFieldHistories < ActiveRecord::Migration
  def up
    remove_column :field_histories, :project_id
  end

  def down
    add_column :field_histories, :project_id, :integer
  end
end
