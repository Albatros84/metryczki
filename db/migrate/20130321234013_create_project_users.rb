class CreateProjectUsers < ActiveRecord::Migration
  def change
    create_table :project_users do |t|
      t.string :proj_role
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
  end
end
