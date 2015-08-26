class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :name
      t.string :adress
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :cep
      t.string :rg
      t.string :cpf

      t.timestamps null: false
    end
  end
end
