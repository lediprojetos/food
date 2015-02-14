class CreateFdCategoriaempresas < ActiveRecord::Migration
  def change
    create_table :fd_categoriaempresas do |t|
      t.string :nome_categoria

      t.timestamps
    end
  end
end
