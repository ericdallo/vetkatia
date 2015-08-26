class AddDatesToVaccines < ActiveRecord::Migration
  def change
    add_column :vaccines, :v10_due_date, :date                    
    add_column :vaccines, :v10_1_due_date, :date                 
    add_column :vaccines, :v10_2_due_date, :date                 
    add_column :vaccines, :v10_3_due_date, :date                 
    add_column :vaccines, :v10_4_due_date, :date                 
    add_column :vaccines, :raiva_due_date, :date                 
    add_column :vaccines, :giardia_due_date, :date               
    add_column :vaccines, :pneumodog_due_date, :date             
    add_column :vaccines, :v7_due_date, :date                    
    add_column :vaccines, :triplice_felina_due_date, :date       
    add_column :vaccines, :triplice_felina_raiva_due_date, :date 
    add_column :vaccines, :triplice_felina_1_due_date, :date     
    add_column :vaccines, :triplice_felina_2_due_date, :date 
  end
end
