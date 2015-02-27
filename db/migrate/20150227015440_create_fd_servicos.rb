class CreateFdServicos < ActiveRecord::Migration
  def change
    create_table :fd_servicos do |t|
      t.string :desc_servico
      t.integer :numr_porcentagem
      t.decimal :valr_servico
      t.boolean :flag_ativo
      t.datetime :data_exclusao

      t.timestamps
    end
  end
end
