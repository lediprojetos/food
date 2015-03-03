class CreateFdVariacaos < ActiveRecord::Migration
  def change
    create_table :fd_variacaos do |t|
      t.string :desc_variacao
      t.references :fd_empresa, index: true

      t.timestamps
    end
  end
end
