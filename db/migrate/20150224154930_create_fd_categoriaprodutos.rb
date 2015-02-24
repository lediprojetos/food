class CreateFdCategoriaprodutos < ActiveRecord::Migration
  def change
    create_table :fd_categoriaprodutos do |t|
      t.string :desc_categoria

      t.timestamps
    end
  end
end
