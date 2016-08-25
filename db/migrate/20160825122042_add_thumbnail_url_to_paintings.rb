class AddThumbnailUrlToPaintings < ActiveRecord::Migration
  def change
    add_column :paintings, :thumbnail_url, :string
  end
end
