class CreateFdUsuarios < ActiveRecord::Migration
  def change
    create_table :fd_usuarios do |t|
      t.string :desc_nome
      t.string :desc_login
      t.string :desc_senha
      t.datetime :data_inclusao
      t.string :desc_perfil
      t.references :fd_empresa, index: true

      t.timestamps
    end
  end
end
