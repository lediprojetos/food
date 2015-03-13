class CreateFdSituacoes < ActiveRecord::Migration
  def change
    create_table :fd_situacoes do |t|
      t.string :nome_situacao
      t.string :desc_situacao
      t.datetime :data_bloqueio

      t.timestamps
    end
  end
end
