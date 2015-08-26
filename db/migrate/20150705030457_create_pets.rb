class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :specie
      t.string :race
      t.string :sex
      t.string :fur
      t.date :born_date
      t.text :obs
      t.references :cliente, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
