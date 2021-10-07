class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string :name
      t.date :publication_date 
      t.references :album, foreign_key: true, index: true, null: true
      t.timestamps
    end
  end
end
