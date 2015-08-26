class AddColumnAnamnesisAndHistoricToPets < ActiveRecord::Migration
  def change
  	add_column :pets,:anamnesis, :text
  	add_column :pets,:historic, :text
  end
end
