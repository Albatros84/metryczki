class CreateFieldHistories < ActiveRecord::Migration
  def change
    create_table :field_histories do |t|
      t.string :value
      
      
      t.references :user
      t.references :project

      t.timestamps           
      
      
    end #change end
    add_index :field_histories, :user_id
    add_index :field_histories, :project_id
  end
end
