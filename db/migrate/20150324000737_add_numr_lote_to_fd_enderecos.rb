class AddNumrLoteToFdEnderecos < ActiveRecord::Migration
  def change
    add_column :fd_enderecos, :numr_lote, :string
    add_column :fd_enderecos, :numr_numero, :string
  end
end
