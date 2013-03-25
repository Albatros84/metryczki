class CreateUserProjectRoles < ActiveRecord::Migration
  def change
    create_table :user_project_roles do |t|
      t.string :proj_role

      t.timestamps
    end
  end
end
