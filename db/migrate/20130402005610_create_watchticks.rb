class CreateWatchticks < ActiveRecord::Migration
  def change
    create_table :watchticks do |t|
      t.text :tick

      t.timestamps
    end
  end
end
