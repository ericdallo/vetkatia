class AddAnotherPhoneAndAnotherCelToClientes < ActiveRecord::Migration
  def change
  	add_column :clientes, :commercial_phone, :integer
  	add_column :clientes, :another_cel ,:integer
  end
end
