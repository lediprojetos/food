class CreateFdEnderecos < ActiveRecord::Migration
  def change
    create_table :fd_enderecos do |t|
      t.string :nome_bairro
      t.string :nome_rua
      t.string :numr_quadra
      t.string :desc_complemento
      t.string :desc_pontoreferencia
      t.string :numr_cep
      t.datetime :data_inclusao
      t.references :fd_cidade, index: true

      t.timestamps
    end
  end
end
