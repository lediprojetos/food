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

    FdUsuario.create(:desc_nome => 'Diel', :desc_login =>  'diel.faria@gmail.com', :desc_confirmalogin =>  'diel.faria@gmail.com',:desc_senha =>  'leidof', :desc_confirmasenha =>  'leidof',:fd_empresa_id =>  1)
  end
end
