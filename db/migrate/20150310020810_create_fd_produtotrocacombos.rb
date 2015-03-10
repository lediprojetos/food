class CreateFdProdutotrocacombos < ActiveRecord::Migration
  def change
    create_table :fd_produtotrocacombos do |t|
      t.references :fd_produtos, index: true
      t.references :fd_produtocombos, index: true

      t.timestamps
    end
  end
end
