class AddOtherVaccinesToVaccines < ActiveRecord::Migration
  def change
  	add_column :vaccines, :v10_1, :boolean
    add_column :vaccines, :v10_2, :boolean
    add_column :vaccines, :v10_3, :boolean
    add_column :vaccines, :v10_4, :boolean
    add_column :vaccines, :v7, :boolean
    add_column :vaccines, :triplice_felina_1, :boolean
    add_column :vaccines, :triplice_felina_2, :boolean
  end
end
