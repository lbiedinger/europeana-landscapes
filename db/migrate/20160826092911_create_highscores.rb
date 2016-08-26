class CreateHighscores < ActiveRecord::Migration
  def change
    create_table :highscores do |t|
      t.string :initials
      t.integer :score
    end

    add_index :highscores, :score
  end
end
