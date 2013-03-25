class CreateProjectsGames < ActiveRecord::Migration
  def up
    create_table :games_projects, id: false do |t|
      t.integer :project_id, null: false
      t.integer :game_id, null: false
    end
    add_index :games_projects, [:project_id, :game_id], unique: true
  end

  def down
    remove_index :games_projects, column: [:project_id, :game_id]
    drop_table :games_projects
  end
end
