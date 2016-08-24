class CreatePaintings < ActiveRecord::Migration
  def change
    create_table :paintings do |t|
      t.string :europeana_id
      t.string :location

      t.timestamps null: false
    end
  end
end
