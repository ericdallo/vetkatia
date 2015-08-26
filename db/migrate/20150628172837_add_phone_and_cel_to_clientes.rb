class AddPhoneAndCelToClientes < ActiveRecord::Migration
  def change
  	add_column :clientes, :phone, :integer
  	add_column :clientes , :cel, :integer
  end
end
