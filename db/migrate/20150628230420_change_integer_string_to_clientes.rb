class ChangeIntegerStringToClientes < ActiveRecord::Migration
  def change
  	change_column :clientes, :phone, :string, limit:15
  	change_column :clientes, :commercial_phone, :string, limit:15
  	change_column :clientes, :cel, :string, limit:15
  	change_column :clientes, :another_cel, :string, limit:15
  end
end
