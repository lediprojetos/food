class CreateFdCaixas < ActiveRecord::Migration
  def change
    create_table :fd_caixas do |t|
      t.integer :numr_contador
      t.datetime :data_abertura
      t.datetime :data_fechamento
      t.decimal :valor_caixa
      t.decimal :valor_fechamento
      t.references :fd_empresa, index: true

      t.timestamps
    end
  end
end
