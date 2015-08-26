class CreateMedicines < ActiveRecord::Migration
  def change
    create_table :medicines do |t|
      t.string :name
      t.string :forn1
      t.string :forn2
      t.string :forn3
      t.string :forn4

      t.timestamps null: false
    end
  end
end
