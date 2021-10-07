class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :name
      t.string :surname
      t.string :ocupation
      t.string :dni
      t.references :group, foreign_key: true, index: true, null: true  #hago referencia a grupos
      t.timestamps
    end
  end
end
