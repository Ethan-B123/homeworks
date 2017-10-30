class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.integer :band_id, :year, null: false
      t.boolean :is_studio, null: false, default: true
      
      t.timestamps
    end
  end
end
