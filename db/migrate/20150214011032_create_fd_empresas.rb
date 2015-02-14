class CreateFdEmpresas < ActiveRecord::Migration
  def change
    create_table :fd_empresas do |t|
      t.string :desc_razaosocial
      t.string :desc_nomefantasia
      t.string :nome_responsavel
      t.string :desc_cnpj
      t.string :desc_telefone
      t.string :desc_celular
      t.datetime :data_inclusao
      t.references :fd_endereco, index: true
      t.references :fd_categoriaempresa, index: true

      t.timestamps
    end
  end
end
