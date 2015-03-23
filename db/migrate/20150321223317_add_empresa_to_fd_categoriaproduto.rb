class AddEmpresaToFdCategoriaproduto < ActiveRecord::Migration
  def change
    add_reference :fd_categoriaprodutos, :fd_empresa, index: true
  end
end
