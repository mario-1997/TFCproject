class CreateAlbums < ActiveRecord::Migration[6.1]
  def change
    create_table :albums do |t|
      t.string :name
      t.string :musical_style
      t.date :publication_date
      t.references :group, foreign_key: true, index: true, null: true
      t.timestamps
    end
  end
end
