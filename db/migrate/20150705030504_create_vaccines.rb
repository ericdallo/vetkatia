class CreateVaccines < ActiveRecord::Migration
  def change
    create_table :vaccines do |t|
      t.boolean :v10
      t.boolean :raiva
      t.boolean :giardia
      t.boolean :pneumodog
      t.boolean :triplice_felina
      t.boolean :triplice_felina_raiva
      t.references :pet, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
