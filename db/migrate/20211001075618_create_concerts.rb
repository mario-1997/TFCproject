class CreateConcerts < ActiveRecord::Migration[6.1]
  def change
    create_table :concerts do |t|
      t.string :place
      t.date :concert_date
      t.references :group, foreign_key: true, index: true, null: true
      t.timestamps
    end
  end
end
