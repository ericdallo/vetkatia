class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.binary :data, limit: 10.megabyte, :null => false
      t.string :filename
      t.text :description
      t.string :mime_type

      t.timestamps null: false
    end

    add_reference :exams, :cliente, foreign_key: true, :null => false
  end
end
