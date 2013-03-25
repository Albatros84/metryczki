class CreateWelcomes < ActiveRecord::Migration
  def change
    create_table :welcomes do |t|
      t.string :name
      t.string :client
      t.string :type
      t.string :highrise
      t.string :skydrive

      t.timestamps
    end
  end
end
