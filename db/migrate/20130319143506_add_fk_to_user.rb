class AddFkToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :user_roles_id, :integer
 
    add_column :projects, :user_roles_id, :integer

  end
  
  def self.down
    remove_column :users, :user_roles_fk 

    remove_column :projects, :user_roles_id  

  end
end
