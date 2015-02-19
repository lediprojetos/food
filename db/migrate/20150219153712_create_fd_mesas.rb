class CreateFdMesas < ActiveRecord::Migration
  def change
    create_table :fd_mesas do |t|
      t.integer :numr_mesa
      t.string :desc_mesa
      t.boolean :flag_mesaaberta
      t.references :fd_empresa, index: true
      t.integer :user_inclusao, :integer, :references => :FdUsuario, index: true
      t.integer :user_exclusao, :integer, :references => :FdUsuario, index: true
      t.datetime :data_exclusao

      t.timestamps
    end
  end
end
