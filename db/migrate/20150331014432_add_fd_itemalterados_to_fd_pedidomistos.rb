class AddFdItemalteradosToFdPedidomistos < ActiveRecord::Migration
  def change
    add_column :fd_itemalterados, :fd_pedidomisto_id, :integer
    add_column :fd_pedidomistos, :fd_variacaoproduto_id, :integer
  end
end
