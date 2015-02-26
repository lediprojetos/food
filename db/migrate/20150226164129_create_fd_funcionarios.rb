class CreateFdFuncionarios < ActiveRecord::Migration
  def change
    create_table :fd_funcionarios do |t|
      t.string :nome_funcionario
      t.string :desc_telefone
      t.string :desc_celular
      t.datetime :data_exclusao
      t.references :fd_cargo, index: true
      t.references :fd_endereco, index: true
      t.references :fd_empresa, index: true
      t.integer :user_inclusao, :integer, :references => :FdUsuario, index: true
      t.integer :user_exclusao, :integer, :references => :FdUsuario, index: true
      t.timestamps
    end
  end
end
