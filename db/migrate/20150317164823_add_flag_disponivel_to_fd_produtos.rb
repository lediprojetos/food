class AddFlagDisponivelToFdProdutos < ActiveRecord::Migration
  def change
    add_column :fd_produtos, :flag_disponivel, :boolean
    add_column :fd_produtos, :flag_produtomisto, :boolean
  end
end
