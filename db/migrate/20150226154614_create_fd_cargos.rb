class CreateFdCargos < ActiveRecord::Migration
  def change
    create_table :fd_cargos do |t|
      t.string :nome_cargo
      t.string :desc_cargo
      t.datetime :data_exclusao
      t.references :fd_empresa, index: true
      t.integer :user_exclusao, :integer, :references => :FdUsuario, index: true
      t.timestamps
    end
  end
end
