class CreateFdClientes < ActiveRecord::Migration
  def change
    create_table :fd_clientes do |t|
      t.string :nome_cliente
      t.string :desc_sexo
      t.string :desc_celular
      t.string :desc_telefone
      t.string :desc_email
      t.string :desc_cpf
      t.date :data_nascimento
      t.datetime :data_inclusao
      t.references :fd_empresa, index: true
      t.references :fd_endereco, index: true

      t.timestamps
    end
  end
end
