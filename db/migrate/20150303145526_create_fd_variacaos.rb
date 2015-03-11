#encoding: utf-8
class CreateFdVariacaos < ActiveRecord::Migration
  def change
    create_table :fd_variacaos do |t|
      t.string :desc_variacao
      t.boolean :flag_global
      t.references :fd_empresa, index: true

      t.timestamps
    end

    FdVariacao.create(:desc_variacao => 'Único', :flag_global => true)

  end
end
